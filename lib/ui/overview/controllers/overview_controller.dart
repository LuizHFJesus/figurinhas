import 'dart:async';

import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:sticker_manager_wc22/common/utils/text_normalizer.dart';
import 'package:sticker_manager_wc22/data/services/active_album_service.dart';
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
import 'package:sticker_manager_wc22/domain/usecases/search_sections_usecase.dart';
import 'package:sticker_manager_wc22/ui/common/state/sticker_qty_store.dart';
import 'package:sticker_manager_wc22/ui/overview/models/overview_view_model.dart';
import 'package:sticker_manager_wc22/ui/share/coordinators/share_coordinator.dart';

class OverviewController extends GetxController {
  // Dependencies
  final UserProfileRepository _profileRepo;
  final GetActiveUserAlbumUseCase _getActiveAlbum;
  final GetAllSectionsUseCase _getAllSections;
  final GetAllStickersUseCase _getAllStickers;
  final SearchSectionsUseCase _searchSections;
  final StickerStateRepository _stateRepo;
  final IncrementStickerQuantityUseCase _incrementSticker;
  final ShareCoordinator _shareCoordinator;
  final ActiveAlbumService _activeAlbumService;

  // Subscriptions
  StreamSubscription<List<StickerState>>? _statesSub;

  // State
  final RxBool isLoading = true.obs;
  final RxBool isSearching = false.obs;
  Rx<UserAlbum?> get activeAlbum => _activeAlbumService.activeAlbum;
  Rx<AlbumStats?> get albumStats => _activeAlbumService.albumStats;

  // Filters
  final TextEditingController searchController = TextEditingController();
  final RxString searchQuery = ''.obs;
  final Rx<StickerFilter> currentFilter = StickerFilter.all.obs;

  // Raw data (stable)
  final List<Section> _allSections = [];
  final List<Sticker> _allStickers = [];
  final Map<String, List<Sticker>> _stickersBySection = {};
  final Map<String, int> _quantities = {};

  final StickerQtyStore qtyStore = StickerQtyStore();
  final FocusNode searchFocus = FocusNode();

  // Output
  final RxList<OverviewSection> visibleSections = <OverviewSection>[].obs;

  OverviewController(
    this._profileRepo,
    this._getActiveAlbum,
    this._getAllSections,
    this._getAllStickers,
    this._searchSections,
    this._stateRepo,
    this._incrementSticker,
    this._shareCoordinator,
    this._activeAlbumService,
  );

  @override
  Future<void> onInit() async {
    super.onInit();

    debounce(
      searchQuery,
      (_) => _rebuildVisibleSections(),
      time: const Duration(milliseconds: 250),
    );

    ever(currentFilter, (_) => _rebuildVisibleSections());

    await _loadData();
  }

  @override
  Future<void> onClose() async {
    await _statesSub?.cancel();
    qtyStore.dispose();
    searchController.dispose();
    searchFocus.dispose();
    super.onClose();
  }

  Future<void> _loadData() async {
    try {
      isLoading.value = true;

      if (activeAlbum.value == null) {
        final profileId = await _profileRepo.ensureLocalProfileId();
        final album = await _getActiveAlbum(profileId);
        _activeAlbumService.setActiveAlbum(album);
      }
      final album = activeAlbum.value!;

      final results = await Future.wait([
        _getAllSections(album.albumId),
        _getAllStickers(album.albumId),
        _stateRepo.getAllQuantitiesForUserAlbum(album.userAlbumId),
      ]);

      _allSections
        ..clear()
        ..addAll(results[0] as List<Section>);

      _allStickers
        ..clear()
        ..addAll(results[1] as List<Sticker>);

      final initialQuantities = results[2] as Map<String, int>;
      _quantities
        ..clear()
        ..addAll(initialQuantities);

      _buildSectionIndex();

      for (final st in _allStickers) {
        qtyStore.set(st.code, _quantities[st.code] ?? 0);
      }

      await _rebuildVisibleSections();

      _statesSub = _stateRepo
          .watchAllStatesForUserAlbum(album.userAlbumId)
          .listen((states) async {
            for (final s in states) {
              await _applyQtyChange(code: s.code, newQty: s.quantity);
            }
          });
    } finally {
      isLoading.value = false;
    }
  }

  void _buildSectionIndex() {
    _stickersBySection.clear();
    for (final s in _allSections) {
      _stickersBySection[s.sectionId] = <Sticker>[];
    }
    for (final st in _allStickers) {
      (_stickersBySection[st.sectionId] ??= <Sticker>[]).add(st);
    }
  }

  // Filtering core

  bool _matchesFilter(int qty) {
    return switch (currentFilter.value) {
      StickerFilter.all => true,
      StickerFilter.obtained => qty > 0,
      StickerFilter.missing => qty == 0,
      StickerFilter.repeated => qty > 1,
    };
  }

  bool _matchesQuery({
    required String normalizedQuery,
    required Section section,
    required Sticker sticker,
  }) {
    if (normalizedQuery.isEmpty) return true;

    final matchCode = sticker.code.toLowerCase().contains(normalizedQuery);
    final matchName = TextNormalizer.normalize(
      sticker.displayName,
    ).contains(normalizedQuery);
    final matchSection = TextNormalizer.normalize(
      section.name,
    ).contains(normalizedQuery);

    return matchCode || matchName || matchSection;
  }

  Future<void> _rebuildVisibleSections() async {
    final album = activeAlbum.value;
    if (album == null) return;

    final query = searchQuery.value.trim();
    final normalizedQuery = TextNormalizer.normalize(query);

    Set<String>? allowedSectionIds;
    if (query.isNotEmpty) {
      final ids = await _searchSections(albumId: album.albumId, query: query);
      allowedSectionIds = ids.toSet();
    }

    final result = <OverviewSection>[];

    for (final section in _allSections) {
      if (allowedSectionIds != null &&
          !allowedSectionIds.contains(section.sectionId)) {
        continue;
      }

      final stickers =
          _stickersBySection[section.sectionId] ?? const <Sticker>[];

      final visible = <Sticker>[];
      for (final st in stickers) {
        final qty = _quantities[st.code] ?? 0;

        if (!_matchesFilter(qty)) continue;
        // if (!_matchesQuery(
        //   normalizedQuery: normalizedQuery,
        //   section: section,
        //   sticker: st,
        // )) {
        //   continue;
        // }

        visible.add(st);
      }

      if (visible.isNotEmpty) {
        result.add(OverviewSection(section: section, visibleStickers: visible));
      }
    }

    visibleSections.assignAll(result);
  }

  Future<void> _applyQtyChange({
    required String code,
    required int newQty,
  }) async {
    final oldQty = _quantities[code] ?? 0;
    if (oldQty == newQty) return;

    _quantities[code] = newQty;
    qtyStore.set(code, newQty);

    if (currentFilter.value == StickerFilter.all) return;

    if (_matchesFilter(oldQty) != _matchesFilter(newQty)) {
      await _rebuildVisibleSections();
    }
  }

  // Actions

  void focusSearch() => searchFocus.requestFocus();

  Future<void> updateSearch(String value) async => searchQuery.value = value;

  Future<void> cleanSearch() async {
    searchController.clear();
    await updateSearch('');
  }

  Future<void> setFilter(StickerFilter filter) async {
    if (currentFilter.value == filter) return;
    currentFilter.value = filter;
  }

  Future<void> onStickerTap(Sticker sticker) async {
    final album = activeAlbum.value;
    if (album == null) return;

    await _incrementSticker(
      userAlbumId: album.userAlbumId,
      albumId: album.albumId,
      code: sticker.code,
    );
  }

  Future<void> onStickerLongPress(Sticker sticker) async {
    final album = activeAlbum.value;
    if (album == null) return;

    final current = _quantities[sticker.code] ?? 0;
    if (current <= 0) return;

    await _incrementSticker(
      userAlbumId: album.userAlbumId,
      albumId: album.albumId,
      code: sticker.code,
      delta: -1,
    );
  }

  Future<void> showShareOptions(BuildContext context) async {
    if (activeAlbum.value == null) return;
    await _shareCoordinator.showShareOptions(context, activeAlbum.value!);
  }
}
