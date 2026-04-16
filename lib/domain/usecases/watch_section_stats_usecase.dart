import 'package:sticker_manager_wc22/domain/models/section_stats.dart';
import 'package:sticker_manager_wc22/domain/repositories/stats_repository.dart';

class WatchSectionStatsUseCase {
  final StatsRepository _stats;

  WatchSectionStatsUseCase(this._stats);

  Stream<SectionStats> watch({
    required String userAlbumId,
    required String albumId,
    required String sectionId,
  }) async* {
    await _stats.ensureSectionStatsInitialized(
      userAlbumId: userAlbumId,
      albumId: albumId,
      sectionId: sectionId,
    );

    yield* _stats.watchSectionStats(
      userAlbumId: userAlbumId,
      sectionId: sectionId,
    );
  }
}
