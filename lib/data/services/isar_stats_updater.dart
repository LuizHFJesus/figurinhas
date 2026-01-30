import 'package:sticker_manager_wc22/data/repositories/stats_repository_impl.dart';
import 'package:sticker_manager_wc22/domain/repositories/catalog_repository.dart';

class IsarStatsUpdater {
  final CatalogRepository _catalog;
  final StatsRepositoryImpl _stats;

  IsarStatsUpdater(this._catalog, this._stats);

  Future<void> applyStickerQuantityChange({
    required String userAlbumId,
    required String albumId,
    required String code,
    required int oldQty,
    required int newQty,
  }) async {
    await _stats.ensureAlbumStatsInitialized(
      userAlbumId: userAlbumId,
      albumId: albumId,
    );

    final sectionId = await _catalog.getSectionIdByCode(code);
    await _stats.ensureSectionStatsInitialized(
      userAlbumId: userAlbumId,
      albumId: albumId,
      sectionId: sectionId,
    );

    final isFoil = await _catalog.isFoilByCode(code);
    final obtainedDelta = _obtainedFlag(newQty) - _obtainedFlag(oldQty);
    final dupDelta = _dups(newQty) - _dups(oldQty);
    final now = DateTime.now();

    // Album
    final albumStats = await _stats.requireAlbumStats(userAlbumId);

    albumStats.obtainedStickers = _clampInt(
      value: albumStats.obtainedStickers + obtainedDelta,
      min: 0,
      max: albumStats.totalStickers,
    );

    albumStats.missingStickers = _clampInt(
      value: albumStats.totalStickers - albumStats.obtainedStickers,
      min: 0,
      max: albumStats.totalStickers,
    );

    albumStats.duplicateStickers = _clampInt(
      value: albumStats.duplicateStickers + dupDelta,
      min: 0,
      max: 1 << 30,
    );

    albumStats.progress = _calcProgress(
      albumStats.obtainedStickers,
      albumStats.totalStickers,
    );

    if (isFoil) {
      albumStats.obtainedFoils = _clampInt(
        value: albumStats.obtainedFoils + obtainedDelta,
        min: 0,
        max: albumStats.totalFoils,
      );

      albumStats.missingFoils = _clampInt(
        value: albumStats.totalFoils - albumStats.obtainedFoils,
        min: 0,
        max: albumStats.totalFoils,
      );
    }

    albumStats.updatedAt = now;
    await _stats.putAlbumStats(albumStats);

    // Section
    final sectionStats = await _stats.requireSectionStats(
      userAlbumId,
      sectionId,
    );

    sectionStats.obtainedStickers = _clampInt(
      value: sectionStats.obtainedStickers + obtainedDelta,
      min: 0,
      max: sectionStats.totalStickers,
    );

    sectionStats.missingStickers = _clampInt(
      value: sectionStats.totalStickers - sectionStats.obtainedStickers,
      min: 0,
      max: sectionStats.totalStickers,
    );

    sectionStats.duplicateStickers = _clampInt(
      value: sectionStats.duplicateStickers + dupDelta,
      min: 0,
      max: 1 << 30,
    );

    sectionStats.progress = _calcProgress(
      sectionStats.obtainedStickers,
      sectionStats.totalStickers,
    );

    sectionStats.updatedAt = now;
    await _stats.putSectionStats(sectionStats);
  }

  static double _calcProgress(int obtained, int total) =>
      total == 0 ? 0.0 : obtained / total;

  static int _clampInt({
    required int value,
    required int min,
    required int max,
  }) => value.clamp(min, max);

  static int _dups(int q) => q <= 1 ? 0 : (q - 1);

  static int _obtainedFlag(int qty) => qty > 0 ? 1 : 0;
}
