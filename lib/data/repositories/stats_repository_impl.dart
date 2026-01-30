import 'package:sticker_manager_wc22/data/datasources/user_local_datasource.dart';
import 'package:sticker_manager_wc22/data/entities/album_stats_state_entity.dart';
import 'package:sticker_manager_wc22/data/entities/section_stats_state_entity.dart';
import 'package:sticker_manager_wc22/data/mappers/entity_mappers.dart';
import 'package:sticker_manager_wc22/domain/models/album_stats.dart';
import 'package:sticker_manager_wc22/domain/models/section_stats.dart';
import 'package:sticker_manager_wc22/domain/repositories/catalog_repository.dart';
import 'package:sticker_manager_wc22/domain/repositories/stats_repository.dart';

class StatsRepositoryImpl implements StatsRepository {
  final UserLocalDataSource _local;
  final CatalogRepository _catalog;

  StatsRepositoryImpl(this._local, this._catalog);

  static String _sectionStatsId(String userAlbumId, String sectionId) =>
      '$userAlbumId:$sectionId';

  @override
  Future<void> ensureAlbumStatsInitialized({
    required String userAlbumId,
    required String albumId,
  }) async {
    final existing = await _local.getAlbumStats(userAlbumId);
    if (existing != null) return;

    final total = await _catalog.countStickers(albumId);
    final totalFoils = await _catalog.countFoils(albumId);
    final now = DateTime.now();

    final e = AlbumStatsStateEntity()
      ..albumStatsId = userAlbumId
      ..userAlbumId = userAlbumId
      ..totalStickers = total
      ..obtainedStickers = 0
      ..missingStickers = total
      ..duplicateStickers = 0
      ..progress = total == 0 ? 0.0 : 0.0
      ..totalFoils = totalFoils
      ..obtainedFoils = 0
      ..missingFoils = totalFoils
      ..updatedAt = now;

    await _local.upsertAlbumStats(e);
  }

  @override
  Future<void> ensureSectionStatsInitialized({
    required String userAlbumId,
    required String albumId,
    required String sectionId,
  }) async {
    final key = _sectionStatsId(userAlbumId, sectionId);
    final existing = await _local.getSectionStats(key);
    if (existing != null) return;

    final total = await _catalog.countStickersBySection(
      albumId: albumId,
      sectionId: sectionId,
    );
    final now = DateTime.now();

    final e = SectionStatsStateEntity()
      ..sectionStatsId = key
      ..userAlbumId = userAlbumId
      ..sectionId = sectionId
      ..totalStickers = total
      ..obtainedStickers = 0
      ..missingStickers = total
      ..duplicateStickers = 0
      ..progress = total == 0 ? 0.0 : 0.0
      ..updatedAt = now;

    await _local.upsertSectionStats(e);
  }

  @override
  Future<AlbumStats> getAlbumStats(String userAlbumId) async {
    final e = await _local.getAlbumStats(userAlbumId);

    if (e == null) {
      throw StateError(
        'AlbumStats not initialized for userAlbumId=$userAlbumId',
      );
    }

    return EntityMappers.toAlbumStats(e);
  }

  @override
  Stream<AlbumStats> watchAlbumStats(String userAlbumId) {
    return _local.watchAlbumStats(userAlbumId).map((e) {
      if (e == null) {
        throw StateError(
          'AlbumStats not initialized for userAlbumId=$userAlbumId',
        );
      }

      return EntityMappers.toAlbumStats(e);
    });
  }

  @override
  Future<SectionStats> getSectionStats({
    required String userAlbumId,
    required String sectionId,
  }) async {
    final e = await _local.getSectionStats(
      _sectionStatsId(userAlbumId, sectionId),
    );

    if (e == null) {
      throw StateError(
        'SectionStats not initialized for $userAlbumId/$sectionId',
      );
    }

    return EntityMappers.toSectionStats(e);
  }

  @override
  Stream<SectionStats> watchSectionStats({
    required String userAlbumId,
    required String sectionId,
  }) {
    final key = _sectionStatsId(userAlbumId, sectionId);

    return _local.watchSectionStats(key).map((e) {
      if (e == null) {
        throw StateError(
          'SectionStats not initialized for $userAlbumId/$sectionId',
        );
      }

      return EntityMappers.toSectionStats(e);
    });
  }

  // --- Internal update helpers used by Data StatsUpdater ---
  Future<void> putAlbumStats(AlbumStatsStateEntity e) =>
      _local.upsertAlbumStats(e);

  Future<void> putSectionStats(SectionStatsStateEntity e) =>
      _local.upsertSectionStats(e);

  Future<AlbumStatsStateEntity> requireAlbumStats(String userAlbumId) async =>
      (await _local.getAlbumStats(userAlbumId))!;

  Future<SectionStatsStateEntity> requireSectionStats(
    String userAlbumId,
    String sectionId,
  ) async =>
      (await _local.getSectionStats(_sectionStatsId(userAlbumId, sectionId)))!;
}
