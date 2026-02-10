import 'dart:async';
import 'package:get/get.dart';
import 'package:sticker_manager_wc22/domain/models/section.dart';
import 'package:sticker_manager_wc22/domain/models/section_stats.dart';
import 'package:sticker_manager_wc22/domain/models/sticker.dart';
import 'package:sticker_manager_wc22/domain/models/sticker_filter.dart';
import 'package:sticker_manager_wc22/domain/models/sticker_state.dart';
import 'package:sticker_manager_wc22/domain/models/user_album.dart';
import 'package:sticker_manager_wc22/domain/repositories/catalog_repository.dart';
import 'package:sticker_manager_wc22/domain/repositories/sticker_state_repository.dart';
import 'package:sticker_manager_wc22/domain/repositories/user_profile_repository.dart';
import 'package:sticker_manager_wc22/domain/usecases/get_active_user_album_usecase.dart';
import 'package:sticker_manager_wc22/domain/usecases/get_stickers_by_section_usecase.dart';
import 'package:sticker_manager_wc22/domain/usecases/increment_sticker_quantity_usecase.dart';
import 'package:sticker_manager_wc22/domain/usecases/watch_section_stats_usecase.dart';
import 'package:sticker_manager_wc22/ui/common/state/sticker_qty_store.dart';
import 'package:sticker_manager_wc22/ui/section/models/section_route_args.dart';

class SectionController extends GetxController {
  // Dependencies
  final UserProfileRepository _profileRepo;
  final CatalogRepository _catalogRepo;
  final GetActiveUserAlbumUseCase _getActiveAlbum;
  final GetStickersBySectionUseCase _getStickers;
  final WatchSectionStatsUseCase _watchStats;
  final StickerStateRepository _stateRepo;
  final IncrementStickerQuantityUseCase _incrementSticker;

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
  final Map<String, int> _quantities = {};
  final Set<String> _sectionCodes = {};
  final RxList<Sticker> visibleStickers = <Sticker>[].obs;
  final StickerQtyStore stickerQtyStore = StickerQtyStore();

  StreamSubscription<SectionStats>? _sectionStatsSubscription;
  StreamSubscription<List<StickerState>>? _stickerStatesSubscription;

  SectionController(
    this._profileRepo,
    this._catalogRepo,
    this._getActiveAlbum,
    this._getStickers,
    this._watchStats,
    this._stateRepo,
    this._incrementSticker, {
    required this.sectionId,
    required this.sectionArgs,
  });

  @override
  Future<void> onInit() async {
    super.onInit();
    activeAlbum.value = sectionArgs?.album;
    section.value = sectionArgs?.section;
    stats.value = sectionArgs?.stats;
    await _loadData();
  }

  @override
  Future<void> onClose() async {
    await _sectionStatsSubscription?.cancel();
    await _stickerStatesSubscription?.cancel();
    stickerQtyStore.dispose();
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

    _sectionCodes
      ..clear()
      ..addAll(_allStickers.map((e) => e.code));

    final allQuantities = await _stateRepo.getAllQuantitiesForUserAlbum(
      album.userAlbumId,
    );

    _quantities
      ..clear()
      ..addAll(allQuantities);

    _syncQtyStoreForAll();
    _rebuildVisibleStickers();

    await _listenSectionStats(album);
    await _listenStickerStates(album);
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

  int quantityOf(String code) => _quantities[code] ?? 0;

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

  Future<void> _listenStickerStates(UserAlbum album) async {
    await _stickerStatesSubscription?.cancel();
    _stickerStatesSubscription = _stateRepo
        .watchAllStatesForUserAlbum(album.userAlbumId)
        .listen((states) {
          for (final s in states) {
            if (!_sectionCodes.contains(s.code)) continue;
            _applyQtyChange(code: s.code, newQty: s.quantity);
          }
        });
  }

  void _syncQtyStoreForAll() {
    for (final st in _allStickers) {
      stickerQtyStore.set(st.code, quantityOf(st.code));
    }
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

  void _applyQtyChange({required String code, required int newQty}) {
    final oldQty = quantityOf(code);
    if (oldQty == newQty) return;

    final filter = currentFilter.value;

    final checkVisibility = filter != StickerFilter.all;
    final wasVisible = !checkVisibility || _isVisibleForFilter(oldQty);

    _quantities[code] = newQty;
    stickerQtyStore.set(code, newQty);

    if (!checkVisibility) return;

    final isVisible = _isVisibleForFilter(newQty);
    if (wasVisible != isVisible) _rebuildVisibleStickers();
  }
}
