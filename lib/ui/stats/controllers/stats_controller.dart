import 'package:get/get.dart';
import 'package:sticker_manager_wc22/domain/models/album_stats.dart';
import 'package:sticker_manager_wc22/domain/repositories/user_profile_repository.dart';
import 'package:sticker_manager_wc22/domain/usecases/get_active_user_album_usecase.dart';
import 'package:sticker_manager_wc22/domain/usecases/watch_album_stats_usecase.dart';

class StatsController extends GetxController {
  final UserProfileRepository _profileRepo;
  final GetActiveUserAlbumUseCase _getActiveAlbum;
  final WatchAlbumStatsUseCase _watchAlbumStats;

  final AlbumStats? albumStats;
  final Rx<AlbumStats?> stats = Rx<AlbumStats?>(null);

  StatsController(
    this._profileRepo,
    this._getActiveAlbum,
    this._watchAlbumStats, {
    required this.albumStats,
  });

  @override
  Future<void> onInit() async {
    super.onInit();
    stats.value = albumStats;
    await _loadStats();
  }

  Future<void> _loadStats() async {
    final profileId = await _profileRepo.ensureLocalProfileId();
    final album = await _getActiveAlbum(profileId);

    _watchAlbumStats
        .watch(userAlbumId: album.userAlbumId, albumId: album.albumId)
        .listen((s) {
          stats.value = s;
        });
  }
}
