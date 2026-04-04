import 'dart:async';
import 'package:get/get.dart';
import 'package:google_mobile_ads/google_mobile_ads.dart';
import 'package:sticker_manager_wc22/core/ads/ad_unit_ids.dart';
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
import 'package:sticker_manager_wc22/domain/usecases/increment_sticker_quantity_usecase.dart';
import 'package:sticker_manager_wc22/domain/usecases/watch_section_stats_usecase.dart';
import 'package:sticker_manager_wc22/ui/ads/usecases/load_banner_ad_usecase.dart';
import 'package:sticker_manager_wc22/ui/common/state/sticker_qty_store.dart';
import 'package:sticker_manager_wc22/ui/section/models/section_route_args.dart';

class SectionController extends GetxController {
  // Dependencies
  final UserProfileRepository _profileRepo;
  final CatalogRepository _catalogRepo;
  final GetActiveUserAlbumUseCase _getActiveAlbum;
  final GetStickersBySectionUseCase _getStickers;
  final WatchSectionStatsUseCase _watchStats;
  final IncrementStickerQuantityUseCase _incrementSticker;
  final ActiveAlbumService _activeAlbumService;
  final LoadBannerAdUseCase _loadBannerUseCase;

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

  // Ad
  RxBool get isBannerReady => _loadBannerUseCase.isBannerReady;
  BannerAd? get bannerAd => _loadBannerUseCase.bannerAd;

  SectionController(
    this._profileRepo,
    this._catalogRepo,
    this._getActiveAlbum,
    this._getStickers,
    this._watchStats,
    this._incrementSticker,
    this._activeAlbumService,
    this._loadBannerUseCase, {
    required this.sectionId,
    required this.sectionArgs,
  });

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
    _loadBannerUseCase.dispose();
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
    await _loadBannerUseCase.call(adUnitId: AdUnitIds.sectionBanner);
  }

  // Actions

  Future<void> setFilter(StickerFilter filter) async {
    if (currentFilter.value == filter) return;
    currentFilter.value = filter;
    _rebuildVisibleStickers();
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

    final current = quantityOf(sticker.code);
    if (current <= 0) return;

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
