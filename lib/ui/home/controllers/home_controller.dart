import 'package:get/get.dart';
import 'package:sticker_manager_wc22/domain/models/album_stats.dart';
import 'package:sticker_manager_wc22/domain/models/section_stats.dart';
import 'package:sticker_manager_wc22/domain/models/user_album.dart';
import 'package:sticker_manager_wc22/domain/repositories/user_profile_repository.dart';
import 'package:sticker_manager_wc22/domain/usecases/get_active_user_album_usecase.dart';
import 'package:sticker_manager_wc22/domain/usecases/get_album_groups_usecase.dart';
import 'package:sticker_manager_wc22/domain/usecases/get_sections_by_group_usecase.dart';
import 'package:sticker_manager_wc22/domain/usecases/watch_album_stats_usecase.dart';
import 'package:sticker_manager_wc22/domain/usecases/watch_section_stats_usecase.dart';
import 'package:sticker_manager_wc22/ui/home/models/group_sections.dart';

class HomeController extends GetxController {
  final UserProfileRepository _profileRepo;
  final GetActiveUserAlbumUseCase _getActiveAlbum;
  final WatchAlbumStatsUseCase _watchAlbumStats;
  final WatchSectionStatsUseCase _watchSectionStats;

  final GetAlbumGroupsUseCase _getGroups;
  final GetSectionsByGroupUseCase _getSections;

  final Rx<UserAlbum?> activeAlbum = Rx<UserAlbum?>(null);
  final Rx<AlbumStats?> albumStats = Rx<AlbumStats?>(null);

  final RxList<GroupSections> catalogStructure = <GroupSections>[].obs;

  HomeController(
    this._profileRepo,
    this._getActiveAlbum,
    this._watchAlbumStats,
    this._watchSectionStats,
    this._getGroups,
    this._getSections,
  );

  @override
  Future<void> onInit() async {
    super.onInit();
    await _loadData();
  }

  Future<void> _loadData() async {
    final profileId = await _profileRepo.ensureLocalProfileId();

    final album = await _getActiveAlbum(profileId);
    activeAlbum.value = album;

    final groups = await _getGroups(album.albumId);

    final viewModels = await Future.wait(
      groups.map((group) async {
        final sections = await _getSections(
          albumId: album.albumId,
          groupId: group.groupId,
        );
        return GroupSections(group: group, sections: sections);
      }),
    );

    catalogStructure.assignAll(viewModels);

    _watchAlbumStats
        .watch(
          userAlbumId: album.userAlbumId,
          albumId: album.albumId,
        )
        .listen((stats) {
          albumStats.value = stats;
        });
  }

  Stream<SectionStats> watchSectionStat(String sectionId) {
    if (activeAlbum.value == null) return const Stream.empty();

    return _watchSectionStats.watch(
      userAlbumId: activeAlbum.value!.userAlbumId,
      albumId: activeAlbum.value!.albumId,
      sectionId: sectionId,
    );
  }
}
