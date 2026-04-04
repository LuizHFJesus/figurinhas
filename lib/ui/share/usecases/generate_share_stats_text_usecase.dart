import 'package:get/get.dart';
import 'package:sticker_manager_wc22/domain/repositories/catalog_repository.dart';
import 'package:sticker_manager_wc22/domain/repositories/stats_repository.dart';

class GenerateShareStatsTextUseCase {
  final CatalogRepository _catalog;
  final StatsRepository _statsRepo;

  GenerateShareStatsTextUseCase(this._catalog, this._statsRepo);

  Future<String> call({
    required String albumId,
    required String userAlbumId,
    required String albumName,
  }) async {
    final album = await _catalog.getAlbum(albumId);
    final stats = await _statsRepo.getAlbumStats(userAlbumId);

    final buffer = StringBuffer();
    if (album != null && album.edition != albumName) {
      buffer.writeln('📚 ${'share_lbl_edition'.tr}: ${album.edition}');
    }
    buffer.writeln('📕 ${'share_lbl_album'.tr}: $albumName\n');

    buffer.writeln('📊 ${'share_stats'.tr}\n');

    buffer.writeln('✅ ${'stats_obtained'.tr}: ${stats.obtained} / ${stats.total}');
    buffer.writeln('🌟 ${'stats_foils'.tr}: ${stats.obtainedFoils} / ${stats.totalFoils}');
    buffer.writeln('📌 ${'stats_missing'.tr}: ${stats.missing}');
    buffer.writeln('🔁 ${'stats_repeated'.tr}: ${stats.duplicates}');

    final progress = (stats.progress * 100).toStringAsFixed(1);
    buffer.writeln('📈 ${'stats_progress'.tr}: $progress%\n');

    buffer.writeln('📲 ${'share_app_link'.tr}');

    return buffer.toString();
  }
}
