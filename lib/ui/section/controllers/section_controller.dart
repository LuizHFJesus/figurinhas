import 'package:get/get.dart';
import 'package:sticker_manager_wc22/domain/models/section.dart';
import 'package:sticker_manager_wc22/domain/models/section_stats.dart';
import 'package:sticker_manager_wc22/domain/models/sticker.dart';
import 'package:sticker_manager_wc22/domain/models/sticker_filter.dart';
import 'package:sticker_manager_wc22/domain/models/user_album.dart';
import 'package:sticker_manager_wc22/domain/repositories/catalog_repository.dart';
import 'package:sticker_manager_wc22/domain/repositories/sticker_state_repository.dart';
import 'package:sticker_manager_wc22/domain/repositories/user_profile_repository.dart';
import 'package:sticker_manager_wc22/domain/usecases/get_active_user_album_usecase.dart';
import 'package:sticker_manager_wc22/domain/usecases/get_stickers_by_section_usecase.dart';
import 'package:sticker_manager_wc22/domain/usecases/increment_sticker_quantity_usecase.dart';
import 'package:sticker_manager_wc22/domain/usecases/watch_section_stats_usecase.dart';
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

  // Data
  final RxList<Sticker> allStickers = <Sticker>[].obs;
  final RxMap<String, int> quantities = <String, int>{}.obs;
  final Rx<StickerFilter> currentFilter = StickerFilter.all.obs;

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
  void onInit() {
    super.onInit();
    activeAlbum.value = sectionArgs?.album;
    section.value = sectionArgs?.section;
    stats.value = sectionArgs?.stats;
    _loadData();
  }

  Future<void> _loadData() async {
    if (sectionId.isEmpty) return;

    final profileId = await _profileRepo.ensureLocalProfileId();
    activeAlbum.value ??= await _getActiveAlbum(profileId);

    section.value ??= await _catalogRepo.getSectionById(
      albumId: activeAlbum.value!.albumId,
      sectionId: sectionId,
    );

    final list = await _getStickers(
      albumId: activeAlbum.value!.albumId,
      sectionId: sectionId,
    );
    allStickers.assignAll(list);

    final allQuantities = await _stateRepo.getAllQuantitiesForUserAlbum(
      activeAlbum.value!.userAlbumId,
    );
    quantities.assignAll(allQuantities);

    _watchStats
        .watch(
          userAlbumId: activeAlbum.value!.userAlbumId,
          albumId: activeAlbum.value!.albumId,
          sectionId: sectionId,
        )
        .listen((s) => stats.value = s);

    _stateRepo
        .watchAllStatesForUserAlbum(activeAlbum.value!.userAlbumId)
        .listen((states) {
          for (final s in states) {
            if (allStickers.any((st) => st.code == s.code)) {
              quantities[s.code] = s.quantity;
            }
          }
        });
  }

  // Actions

  Future<void> setFilter(StickerFilter filter) async =>
      currentFilter.value = filter;

  Future<void> onStickerTap(Sticker sticker) async {
    if (activeAlbum.value == null) return;

    await _incrementSticker(
      userAlbumId: activeAlbum.value!.userAlbumId,
      albumId: activeAlbum.value!.albumId,
      code: sticker.code,
    );

    final current = quantities[sticker.code] ?? 0;
    quantities[sticker.code] = current + 1;
  }

  Future<void> onStickerLongPress(Sticker sticker) async {
    if (activeAlbum.value == null) return;

    final current = quantities[sticker.code] ?? 0;
    if (current > 0) {
      await _incrementSticker(
        userAlbumId: activeAlbum.value!.userAlbumId,
        albumId: activeAlbum.value!.albumId,
        code: sticker.code,
        delta: -1,
      );
      quantities[sticker.code] = current - 1;
    }
  }

  // Getters

  List<Sticker> get filteredStickers {
    if (currentFilter.value == StickerFilter.all) return allStickers;

    return allStickers.where((s) {
      final qty = quantities[s.code] ?? 0;
      switch (currentFilter.value) {
        case StickerFilter.obtained:
          return qty > 0;
        case StickerFilter.missing:
          return qty == 0;
        case StickerFilter.repeated:
          return qty > 1;
        case StickerFilter.all:
          return true;
      }
    }).toList();
  }
}
