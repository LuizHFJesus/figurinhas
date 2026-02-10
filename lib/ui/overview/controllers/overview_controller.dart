import 'dart:async';

import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:sticker_manager_wc22/common/utils/text_normalizer.dart';
import 'package:sticker_manager_wc22/domain/models/album_stats.dart';
import 'package:sticker_manager_wc22/domain/models/section.dart';
import 'package:sticker_manager_wc22/domain/models/sticker.dart';
import 'package:sticker_manager_wc22/domain/models/sticker_filter.dart';
import 'package:sticker_manager_wc22/domain/models/sticker_state.dart';
import 'package:sticker_manager_wc22/domain/models/user_album.dart';
import 'package:sticker_manager_wc22/domain/repositories/sticker_state_repository.dart';
import 'package:sticker_manager_wc22/domain/repositories/user_profile_repository.dart';
import 'package:sticker_manager_wc22/domain/usecases/get_active_user_album_usecase.dart';
import 'package:sticker_manager_wc22/domain/usecases/get_all_sections_usecase.dart';
import 'package:sticker_manager_wc22/domain/usecases/get_all_stickers_usecase.dart';
import 'package:sticker_manager_wc22/domain/usecases/increment_sticker_quantity_usecase.dart';
import 'package:sticker_manager_wc22/domain/usecases/watch_album_stats_usecase.dart';
import 'package:sticker_manager_wc22/ui/overview/models/overview_view_model.dart';

class OverviewController extends GetxController {
  // Dependencies
  final UserProfileRepository _profileRepo;
  final GetActiveUserAlbumUseCase _getActiveAlbum;
  final WatchAlbumStatsUseCase _watchAlbumStats;
  final GetAllSectionsUseCase _getAllSections;
  final GetAllStickersUseCase _getAllStickers;
  final StickerStateRepository _stateRepo;
  final IncrementStickerQuantityUseCase _incrementSticker;

  StreamSubscription<List<StickerState>>? _stickersSubscription;

  // State
  final RxBool isLoading = true.obs;
  final Rx<UserAlbum?> activeAlbum = Rx<UserAlbum?>(null);
  final Rx<AlbumStats?> albumStats = Rx<AlbumStats?>(null);

  // Data (Raw)
  List<Section> _allSections = [];
  List<Sticker> _allStickers = [];
  final RxMap<String, int> quantities = <String, int>{}.obs;

  // Filters State
  final TextEditingController searchController = TextEditingController();
  final RxString searchQuery = ''.obs;
  late final Rx<StickerFilter> currentFilter = StickerFilter.all.obs;
  final RxList<OverviewSection> filteredSections = <OverviewSection>[].obs;

  OverviewController(
    this._profileRepo,
    this._getActiveAlbum,
    this._watchAlbumStats,
    this._getAllSections,
    this._getAllStickers,
    this._stateRepo,
    this._incrementSticker,
  );

  @override
  Future<void> onInit() async {
    super.onInit();

    debounce(
      searchQuery,
      (_) => _applyFilters(),
      time: const Duration(milliseconds: 300),
    );

    ever(currentFilter, (_) => _applyFilters());

    ever(quantities, (_) {
      if (currentFilter.value != StickerFilter.all) {
        _applyFilters();
      }
    });

    await _loadData();
  }

  @override
  Future<void> onClose() async {
    await _stickersSubscription?.cancel();
    searchController.dispose();
    super.onClose();
  }

  Future<void> _loadData() async {
    try {
      isLoading.value = true;
      final profileId = await _profileRepo.ensureLocalProfileId();
      final album = await _getActiveAlbum(profileId);
      activeAlbum.value = album;

      _allSections = await _getAllSections(album.albumId);
      _allStickers = await _getAllStickers(album.albumId);

      final allQuantities = await _stateRepo.getAllQuantitiesForUserAlbum(
        album.userAlbumId,
      );
      quantities.assignAll(allQuantities);

      _applyFilters();

      _watchAlbumStats
          .watch(userAlbumId: album.userAlbumId, albumId: album.albumId)
          .listen((s) => albumStats.value = s);

      _stickersSubscription = _stateRepo
          .watchAllStatesForUserAlbum(album.userAlbumId)
          .listen((states) {
            final updates = <String, int>{};
            for (final s in states) {
              updates[s.code] = s.quantity;
            }
            quantities.addAll(updates);
          });
    } finally {
      isLoading.value = false;
    }
  }

  void _applyFilters() {
    if (isLoading.value) return;

    final query = TextNormalizer.normalize(searchQuery.value);
    final filter = currentFilter.value;
    final result = <OverviewSection>[];

    for (final section in _allSections) {
      final sectionStickers = _allStickers.where(
        (s) => s.sectionId == section.sectionId,
      );

      final visibleStickers = sectionStickers.where((sticker) {
        final qty = quantities[sticker.code] ?? 0;

        var matchesStatus = true;
        switch (filter) {
          case StickerFilter.all:
            matchesStatus = true;
          case StickerFilter.obtained:
            matchesStatus = qty > 0;
          case StickerFilter.missing:
            matchesStatus = qty == 0;
          case StickerFilter.repeated:
            matchesStatus = qty > 1;
        }
        if (!matchesStatus) return false;

        if (query.isNotEmpty) {
          final matchCode = sticker.code.toLowerCase().contains(query);
          final matchName = TextNormalizer.normalize(
            sticker.displayName,
          ).contains(query);
          final matchSection = TextNormalizer.normalize(
            section.name,
          ).contains(query);

          if (!matchCode && !matchName && !matchSection) return false;
        }

        return true;
      }).toList();

      if (visibleStickers.isNotEmpty) {
        result.add(
          OverviewSection(section: section, visibleStickers: visibleStickers),
        );
      }
    }

    filteredSections.assignAll(result);
  }

  // Actions
  Future<void> updateSearch(String value) async => searchQuery.value = value;

  Future<void> setFilter(StickerFilter filter) async =>
      currentFilter.value = filter;

  Future<void> onStickerTap(Sticker sticker) async {
    if (activeAlbum.value == null) return;

    final currentQty = quantities[sticker.code] ?? 0;
    final newQty = currentQty + 1;
    quantities[sticker.code] = newQty;

    try {
      await _incrementSticker(
        userAlbumId: activeAlbum.value!.userAlbumId,
        albumId: activeAlbum.value!.albumId,
        code: sticker.code,
      );
    } catch (e) {
      quantities[sticker.code] = currentQty;
    }
  }

  Future<void> onStickerLongPress(Sticker sticker) async {
    if (activeAlbum.value == null) return;

    final currentQty = quantities[sticker.code] ?? 0;
    if (currentQty > 0) {
      final newQty = currentQty - 1;
      quantities[sticker.code] = newQty;

      try {
        await _incrementSticker(
          userAlbumId: activeAlbum.value!.userAlbumId,
          albumId: activeAlbum.value!.albumId,
          code: sticker.code,
          delta: -1,
        );
      } catch (e) {
        quantities[sticker.code] = currentQty;
      }
    }
  }
}
