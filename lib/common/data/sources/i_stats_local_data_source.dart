import 'package:dart_either/dart_either.dart';
import 'package:sticker_manager_wc22/common/domain/models/album_stats.dart';
import 'package:sticker_manager_wc22/common/domain/models/section_stats.dart';
import 'package:sticker_manager_wc22/common/util/failure.dart';

abstract class IStatsLocalDataSource {
  Future<Either<Failure, void>> saveAlbumStats(AlbumStats stats);

  Future<Either<Failure, AlbumStats?>> getAlbumStats(String albumId);

  Future<Either<Failure, void>> saveSectionStats(SectionStats stats);

  Future<Either<Failure, SectionStats?>> getSectionStats(String sectionId);

  Future<Either<Failure, List<SectionStats>>> getAllSectionStatsByAlbum(
    String albumId,
  );
}
