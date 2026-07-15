import 'dart:async';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sticker_manager_wc22/data/services/active_album_service.dart';
import 'package:sticker_manager_wc22/domain/models/section.dart';
import 'package:sticker_manager_wc22/domain/models/section_stats.dart';
import 'package:sticker_manager_wc22/domain/models/sticker.dart';
import 'package:sticker_manager_wc22/domain/models/sticker_filter.dart';
import 'package:sticker_manager_wc22/domain/models/user_album.dart';
import 'package:sticker_manager_wc22/domain/repositories/catalog_repository.dart';
import 'package:sticker_manager_wc22/domain/repositories/user_profile_repository.dart';
import 'package:sticker_manager_wc22/domain/usecases/get_active_user_album_usecase.dart';
import 'package:sticker_manager_wc22/domain/usecases/get_stickers_by_section_usecase.dart';
import 'package:sticker_manager_wc22/domain/usecases/has_seen_how_it_works_usecase.dart';
import 'package:sticker_manager_wc22/domain/usecases/increment_sticker_quantity_usecase.dart';
import 'package:sticker_manager_wc22/domain/usecases/set_has_seen_how_it_works_usecase.dart';
import 'package:sticker_manager_wc22/domain/usecases/set_sticker_quantity_usecase.dart';
import 'package:sticker_manager_wc22/domain/usecases/watch_section_stats_usecase.dart';
import 'package:sticker_manager_wc22/ui/common/state/sticker_qty_store.dart';
import 'package:sticker_manager_wc22/ui/common/widgets/dialog/sticker_quantity_dialog.dart';
import 'package:sticker_manager_wc22/ui/section/models/section_route_args.dart';
import 'package:sticker_manager_wc22/ui/settings/coordinators/more_options_coordinator.dart';

class SectionController extends GetxController {
  // Dependencies
  final UserProfileRepository _profileRepo;
  final CatalogRepository _catalogRepo;
  final GetActiveUserAlbumUseCase _getActiveAlbum;
  final GetStickersBySectionUseCase _getStickers;
  final WatchSectionStatsUseCase _watchStats;
  final IncrementStickerQuantityUseCase _incrementSticker;
  final SetStickerQuantityUseCase _setStickerQuantity;
  final HasSeenHowItWorksUseCase _hasSeenHowItWorks;
  final SetHasSeenHowItWorksUseCase _setHasSeenHowItWorks;
  final MoreOptionsCoordinator _moreOptionsCoordinator;
  final ActiveAlbumService _activeAlbumService;

  // Parameters
  final String sectionId;
  final SectionRouteArgs? sectionArgs;

  // State
  final Rx<UserAlbum?> activeAlbum = Rx<UserAlbum?>(null);
  final Rx<Section?> section = Rx<Section?>(null);
  final Rx<SectionStats?> stats = Rx<SectionStats?>(null);
  final Rx<StickerFilter> currentFilter = StickerFilter.all.obs;

  // Data
  final List<Sticker> _allStickers = [];
  final RxList<Sticker> visibleStickers = <Sticker>[].obs;
  StickerQtyStore get stickerQtyStore => _activeAlbumService.qtyStore;

  StreamSubscription<SectionStats>? _sectionStatsSubscription;

  SectionController(
    this._profileRepo,
    this._catalogRepo,
    this._getActiveAlbum,
    this._getStickers,
    this._watchStats,
    this._incrementSticker,
    this._setStickerQuantity,
    this._hasSeenHowItWorks,
    this._setHasSeenHowItWorks,
    this._moreOptionsCoordinator,
    this._activeAlbumService, {
    required this.sectionId,
    this.sectionArgs,
  });

  static SectionController put(String sectionId, {SectionRouteArgs? args}) {
    if (Get.isRegistered<SectionController>(tag: sectionId)) {
      return Get.find<SectionController>(tag: sectionId);
    }

    return Get.put(
      SectionController(
        Get.find<UserProfileRepository>(),
        Get.find<CatalogRepository>(),
        Get.find<GetActiveUserAlbumUseCase>(),
        Get.find<GetStickersBySectionUseCase>(),
        Get.find<WatchSectionStatsUseCase>(),
        Get.find<IncrementStickerQuantityUseCase>(),
        Get.find<SetStickerQuantityUseCase>(),
        Get.find<HasSeenHowItWorksUseCase>(),
        Get.find<SetHasSeenHowItWorksUseCase>(),
        Get.find<MoreOptionsCoordinator>(),
        Get.find<ActiveAlbumService>(),
        sectionId: sectionId,
        sectionArgs: args,
      ),
      tag: sectionId,
    );
  }

  @override
  Future<void> onInit() async {
    super.onInit();
    activeAlbum.value = sectionArgs?.album;
    section.value = sectionArgs?.section;
    stats.value = sectionArgs?.stats;

    ever(
      currentFilter,
      (_) => _rebuildVisibleStickers()
    );

    await _loadData();
  }

  @override
  Future<void> onClose() async {
    await _sectionStatsSubscription?.cancel();
    super.onClose();
  }

  Future<void> _loadData() async {
    if (sectionId.isEmpty) return;

    final profileId = await _profileRepo.ensureLocalProfileId();
    activeAlbum.value ??= await _getActiveAlbum(profileId);

    final album = activeAlbum.value;
    if (album == null) return;

    section.value ??= await _catalogRepo.getSectionById(
      albumId: album.albumId,
      sectionId: sectionId,
    );

    final stickers = await _getStickers(
      albumId: album.albumId,
      sectionId: sectionId,
    );

    _allStickers
      ..clear()
      ..addAll(stickers);

    _rebuildVisibleStickers();

    await _listenSectionStats(album);
  }

  // Actions

  Future<void> setFilter(StickerFilter filter) async {
    if (currentFilter.value == filter) return;
    currentFilter.value = filter;
    _rebuildVisibleStickers();
  }

  Future<void> onStickerTap(BuildContext context, Sticker sticker) async {
    final album = activeAlbum.value;
    if (album == null) return;

    final profileId = await _profileRepo.ensureLocalProfileId();
    final hasSeen = await _hasSeenHowItWorks(profileId);

    if (!hasSeen) {
      if (context.mounted) {
        await _moreOptionsCoordinator.showHowItWorks(context);
        await _setHasSeenHowItWorks(profileId, true);
      }
    }

    await _incrementSticker(
      userAlbumId: album.userAlbumId,
      albumId: album.albumId,
      code: sticker.code,
    );
  }

  Future<void> onStickerLongPress(BuildContext context, Sticker sticker) async {
    final album = activeAlbum.value;
    if (album == null) return;

    final current = quantityOf(sticker.code);
    if (current <= 0) return;

    if (current >= 3) {
      final newQty = await showDialog<int?>(
        context: context,
        builder: (_) => StickerQuantityDialog(
          sticker: sticker,
          initialQuantity: current,
        ),
      );

      if (newQty != null && newQty != current) {
        await _setStickerQuantity(
          userAlbumId: album.userAlbumId,
          albumId: album.albumId,
          code: sticker.code,
          quantity: newQty,
        );
      }
      return;
    }

    await _incrementSticker(
      userAlbumId: album.userAlbumId,
      albumId: album.albumId,
      code: sticker.code,
      delta: -1,
    );
  }

  int quantityOf(String code) => _activeAlbumService.quantityOf(code);

  Future<void> _listenSectionStats(UserAlbum album) async {
    await _sectionStatsSubscription?.cancel();
    _sectionStatsSubscription = _watchStats
        .watch(
          userAlbumId: album.userAlbumId,
          albumId: album.albumId,
          sectionId: sectionId,
        )
        .listen((s) => stats.value = s);
  }

  bool _isVisibleForFilter(int qty) {
    return switch (currentFilter.value) {
      StickerFilter.all => true,
      StickerFilter.obtained => qty > 0,
      StickerFilter.missing => qty == 0,
      StickerFilter.repeated => qty > 1,
    };
  }

  void _rebuildVisibleStickers() {
    visibleStickers.assignAll(
      _allStickers.where((st) => _isVisibleForFilter(quantityOf(st.code))),
    );
  }
}
