import 'package:get/get.dart';
import 'package:sticker_manager_wc22/domain/models/album_stats.dart';
import 'package:sticker_manager_wc22/domain/models/user_album.dart';
import 'package:sticker_manager_wc22/domain/usecases/watch_album_stats_usecase.dart';

class ActiveAlbumService extends GetxService {
  final WatchAlbumStatsUseCase _watchAlbumStats;

  ActiveAlbumService(this._watchAlbumStats);

  final Rx<UserAlbum?> activeAlbum = Rx<UserAlbum?>(null);
  final Rx<AlbumStats?> albumStats = Rx<AlbumStats?>(null);

  void setActiveAlbum(UserAlbum album) {
    activeAlbum.value = album;
    _watchStats(album);
  }

  void _watchStats(UserAlbum album) {
    _watchAlbumStats
        .watch(userAlbumId: album.userAlbumId, albumId: album.albumId)
        .listen((stats) {
      albumStats.value = stats;
    });
  }
}
