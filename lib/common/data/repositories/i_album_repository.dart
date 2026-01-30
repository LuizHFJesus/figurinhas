import 'package:dart_either/dart_either.dart';
import 'package:sticker_manager_wc22/common/domain/models/album.dart';
import 'package:sticker_manager_wc22/common/domain/models/album_stats.dart';
import 'package:sticker_manager_wc22/common/domain/models/group.dart';
import 'package:sticker_manager_wc22/common/domain/models/section.dart';
import 'package:sticker_manager_wc22/common/domain/models/section_stats.dart';
import 'package:sticker_manager_wc22/common/utils/failure.dart';

abstract class IAlbumRepository {
  Future<Either<Failure, Album?>> getActiveAlbum();

  Future<Either<Failure, List<Group>>> getGroups(String albumId);

  Future<Either<Failure, List<Section>>> getSections(int groupId);

  Future<Either<Failure, AlbumStats?>> getAlbumStats(String albumId);

  Future<Either<Failure, SectionStats?>> getSectionStats(String sectionId);

  Future<Either<Failure, List<SectionStats>>> getAllSectionStats(
    String albumId,
  );

  Future<Either<Failure, void>> updateAlbum(Album album);

  Future<Either<Failure, void>> updateAlbumStats(AlbumStats stats);

  Future<Either<Failure, void>> updateSectionStats(SectionStats stats);
}
