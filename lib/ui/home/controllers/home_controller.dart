import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sticker_manager_wc22/data/services/active_album_service.dart';
import 'package:sticker_manager_wc22/domain/models/album_stats.dart';
import 'package:sticker_manager_wc22/domain/models/section_stats.dart';
import 'package:sticker_manager_wc22/domain/models/user_album.dart';
import 'package:sticker_manager_wc22/domain/repositories/user_profile_repository.dart';
import 'package:sticker_manager_wc22/domain/usecases/get_active_user_album_usecase.dart';
import 'package:sticker_manager_wc22/domain/usecases/get_all_groups_and_sections_usecase.dart';
import 'package:sticker_manager_wc22/domain/usecases/watch_section_stats_usecase.dart';
import 'package:sticker_manager_wc22/ui/settings/coordinators/more_options_coordinator.dart';
import 'package:sticker_manager_wc22/ui/home/models/group_sections.dart';
import 'package:sticker_manager_wc22/ui/share/coordinators/share_coordinator.dart';

class HomeController extends GetxController {
  // Dependencies
  final UserProfileRepository _profileRepo;
  final GetActiveUserAlbumUseCase _getActiveAlbum;
  final WatchSectionStatsUseCase _watchSectionStats;
  final GetAllGroupsAndSectionsUseCase _getAllGroupsAndSections;
  final ShareCoordinator _shareCoordinator;
  final MoreOptionsCoordinator _moreOptionsCoordinator;
  final ActiveAlbumService _activeAlbumService;

  // State
  Rx<UserAlbum?> get activeAlbum => _activeAlbumService.activeAlbum;
  Rx<AlbumStats?> get albumStats => _activeAlbumService.albumStats;

  // Scroll
  final ScrollController scrollController = ScrollController();
  final RxBool showScrollToTop = false.obs;

  // Data
  final RxList<GroupSections> catalogStructure = <GroupSections>[].obs;

  HomeController(
    this._profileRepo,
    this._getActiveAlbum,
    this._watchSectionStats,
    this._getAllGroupsAndSections,
    this._shareCoordinator,
    this._moreOptionsCoordinator,
    this._activeAlbumService,
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
    super.onClose();
  }

  Future<void> _loadData() async {
    if (activeAlbum.value == null) {
      final profileId = await _profileRepo.ensureLocalProfileId();
      final album = await _getActiveAlbum(profileId);
      _activeAlbumService.setActiveAlbum(album);
    }

    final viewModels = await _getAllGroupsAndSections(
      activeAlbum.value!.albumId,
    );
    catalogStructure.assignAll(viewModels);
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

  Future<void> showMoreOptions(BuildContext context) async {
    if (activeAlbum.value == null) return;
    await _moreOptionsCoordinator.showMoreOptions(context, activeAlbum.value!);
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
