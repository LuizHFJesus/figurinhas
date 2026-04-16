import 'package:sticker_manager_wc22/domain/models/album_stats.dart';
import 'package:sticker_manager_wc22/domain/repositories/stats_repository.dart';

class WatchAlbumStatsUseCase {
  final StatsRepository _stats;

  WatchAlbumStatsUseCase(this._stats);

  Stream<AlbumStats> watch({
    required String userAlbumId,
    required String albumId,
  }) async* {
    await _stats.ensureAlbumStatsInitialized(
      userAlbumId: userAlbumId,
      albumId: albumId,
    );

    yield* _stats.watchAlbumStats(userAlbumId);
  }
}
