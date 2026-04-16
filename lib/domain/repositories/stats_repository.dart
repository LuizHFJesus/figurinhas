import 'package:sticker_manager_wc22/domain/models/album_stats.dart';
import 'package:sticker_manager_wc22/domain/models/section_stats.dart';

abstract class StatsRepository {
  Future<AlbumStats> getAlbumStats(String userAlbumId);

  Stream<AlbumStats> watchAlbumStats(String userAlbumId);

  Future<SectionStats> getSectionStats({
    required String userAlbumId,
    required String sectionId,
  });

  Stream<SectionStats> watchSectionStats({
    required String userAlbumId,
    required String sectionId,
  });

  /// Internal bootstrap helpers (called by updater/usecases)
  Future<void> ensureAlbumStatsInitialized({
    required String userAlbumId,
    required String albumId,
  });

  Future<void> ensureSectionStatsInitialized({
    required String userAlbumId,
    required String albumId,
    required String sectionId,
  });

  Future<void> resetUserAlbumStats(String userAlbumId);

  Future<void> fillUserAlbumStats(String userAlbumId);
}
