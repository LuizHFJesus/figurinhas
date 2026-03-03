import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_mobile_ads/google_mobile_ads.dart';
import 'package:sticker_manager_wc22/core/ads/ad_unit_ids.dart';
import 'package:sticker_manager_wc22/data/services/active_album_service.dart';
import 'package:sticker_manager_wc22/domain/models/album_stats.dart';
import 'package:sticker_manager_wc22/domain/models/section_stats.dart';
import 'package:sticker_manager_wc22/domain/models/user_album.dart';
import 'package:sticker_manager_wc22/domain/repositories/user_profile_repository.dart';
import 'package:sticker_manager_wc22/domain/usecases/get_active_user_album_usecase.dart';
import 'package:sticker_manager_wc22/domain/usecases/get_album_groups_usecase.dart';
import 'package:sticker_manager_wc22/domain/usecases/get_sections_by_group_usecase.dart';
import 'package:sticker_manager_wc22/domain/usecases/watch_section_stats_usecase.dart';
import 'package:sticker_manager_wc22/ui/ads/usecases/load_banner_ad_usecase.dart';
import 'package:sticker_manager_wc22/ui/home/models/group_sections.dart';
import 'package:sticker_manager_wc22/ui/share/coordinators/share_coordinator.dart';

class HomeController extends GetxController {
  // Dependencies
  final UserProfileRepository _profileRepo;
  final GetActiveUserAlbumUseCase _getActiveAlbum;
  final WatchSectionStatsUseCase _watchSectionStats;
  final GetAlbumGroupsUseCase _getGroups;
  final GetSectionsByGroupUseCase _getSections;
  final ShareCoordinator _shareCoordinator;
  final ActiveAlbumService _activeAlbumService;
  final LoadBannerAdUseCase _loadBannerUseCase;

  // State
  Rx<UserAlbum?> get activeAlbum => _activeAlbumService.activeAlbum;
  Rx<AlbumStats?> get albumStats => _activeAlbumService.albumStats;

  // Scroll
  final ScrollController scrollController = ScrollController();
  final RxBool showScrollToTop = false.obs;

  // Ad
  RxBool get isBannerReady => _loadBannerUseCase.isBannerReady;
  BannerAd? get bannerAd => _loadBannerUseCase.bannerAd;

  // Data
  final RxList<GroupSections> catalogStructure = <GroupSections>[].obs;

  HomeController(
    this._profileRepo,
    this._getActiveAlbum,
    this._watchSectionStats,
    this._getGroups,
    this._getSections,
    this._shareCoordinator,
    this._activeAlbumService,
    this._loadBannerUseCase,
  );

  @override
  Future<void> onInit() async {
    super.onInit();
    scrollController.addListener(_onScroll);
    await _loadData();
  }

  @override
  void onClose() {
    scrollController.dispose();
    _loadBannerUseCase.dispose();
    super.onClose();
  }

  Future<void> _loadData() async {
    if (activeAlbum.value == null) {
      final profileId = await _profileRepo.ensureLocalProfileId();
      final album = await _getActiveAlbum(profileId);
      _activeAlbumService.setActiveAlbum(album);
    }

    final groups = await _getGroups(activeAlbum.value!.albumId);

    final viewModels = await Future.wait(
      groups.map((group) async {
        final sections = await _getSections(
          albumId: activeAlbum.value!.albumId,
          groupId: group.groupId,
        );
        return GroupSections(group: group, sections: sections);
      }),
    );

    catalogStructure.assignAll(viewModels);
    await _loadBannerUseCase.call(adUnitId: AdUnitIds.homeBanner);
  }

  Stream<SectionStats> watchSectionStat(String sectionId) {
    if (activeAlbum.value == null) return const Stream.empty();

    return _watchSectionStats.watch(
      userAlbumId: activeAlbum.value!.userAlbumId,
      albumId: activeAlbum.value!.albumId,
      sectionId: sectionId,
    );
  }

  Future<void> showShareOptions(BuildContext context) async {
    if (activeAlbum.value == null) return;
    await _shareCoordinator.showShareOptions(context, activeAlbum.value!);
  }

  Future<void> scrollToTop() async {
    await scrollController.animateTo(
      0,
      duration: const Duration(milliseconds: 400),
      curve: Curves.easeInOut,
    );
  }

  void _onScroll() {
    final offset = scrollController.offset;
    final showFab = offset > 500;

    if (showScrollToTop.value != showFab) showScrollToTop.value = showFab;
  }
}
