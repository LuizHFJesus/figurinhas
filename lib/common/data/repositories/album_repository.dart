import 'package:dart_either/dart_either.dart';
import 'package:sticker_manager_wc22/common/data/repositories/i_album_repository.dart';
import 'package:sticker_manager_wc22/common/data/sources/i_album_local_data_source.dart';
import 'package:sticker_manager_wc22/common/data/sources/i_group_local_data_source.dart';
import 'package:sticker_manager_wc22/common/data/sources/i_section_local_data_source.dart';
import 'package:sticker_manager_wc22/common/data/sources/i_stats_local_data_source.dart';
import 'package:sticker_manager_wc22/common/domain/models/album.dart';
import 'package:sticker_manager_wc22/common/domain/models/album_stats.dart';
import 'package:sticker_manager_wc22/common/domain/models/group.dart';
import 'package:sticker_manager_wc22/common/domain/models/section.dart';
import 'package:sticker_manager_wc22/common/domain/models/section_stats.dart';
import 'package:sticker_manager_wc22/common/util/failure.dart';

class AlbumRepository implements IAlbumRepository {
  final IAlbumLocalDataSource albumLocalDataSource;
  final IGroupLocalDataSource groupLocalDataSource;
  final ISectionLocalDataSource sectionLocalDataSource;
  final IStatsLocalDataSource statsLocalDataSource;

  AlbumRepository({
    required this.albumLocalDataSource,
    required this.groupLocalDataSource,
    required this.sectionLocalDataSource,
    required this.statsLocalDataSource,
  });

  @override
  Future<Either<Failure, Album?>> getActiveAlbum() =>
      albumLocalDataSource.getActiveAlbum();

  @override
  Future<Either<Failure, List<Group>>> getGroups(String albumId) =>
      groupLocalDataSource.getGroupsByAlbum(albumId);

  @override
  Future<Either<Failure, List<Section>>> getSections(int groupId) =>
      sectionLocalDataSource.getSectionsByCategory(groupId);

  @override
  Future<Either<Failure, AlbumStats?>> getAlbumStats(String albumId) =>
      statsLocalDataSource.getAlbumStats(albumId);

  @override
  Future<Either<Failure, SectionStats?>> getSectionStats(String sectionId) =>
      statsLocalDataSource.getSectionStats(sectionId);

  @override
  Future<Either<Failure, List<SectionStats>>> getAllSectionStats(
    String albumId,
  ) => statsLocalDataSource.getAllSectionStatsByAlbum(albumId);

  @override
  Future<Either<Failure, void>> updateAlbum(Album album) =>
      albumLocalDataSource.updateAlbum(album);

  @override
  Future<Either<Failure, void>> updateAlbumStats(AlbumStats stats) =>
      statsLocalDataSource.saveAlbumStats(stats);

  @override
  Future<Either<Failure, void>> updateSectionStats(SectionStats stats) =>
      statsLocalDataSource.saveSectionStats(stats);
}
