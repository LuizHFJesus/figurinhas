import 'package:dart_either/dart_either.dart';
import 'package:get/get.dart';
import 'package:isar_community/isar.dart';
import 'package:sticker_manager_wc22/common/data/services/isar_service.dart';
import 'package:sticker_manager_wc22/common/data/sources/i_stats_local_data_source.dart';
import 'package:sticker_manager_wc22/common/domain/models/album_stats.dart';
import 'package:sticker_manager_wc22/common/domain/models/section_stats.dart';
import 'package:sticker_manager_wc22/common/utils/failure.dart';

class StatsLocalDataSource implements IStatsLocalDataSource {
  final Isar _isar = Get.find<IsarService>().isar;

  @override
  Future<Either<Failure, void>> saveAlbumStats(AlbumStats stats) async {
    try {
      await _isar.writeTxn(() => _isar.albumStats.put(stats));
      return const Right(null);
    } catch (e) {
      return Left(
        DatabaseFailure(message: 'Falha ao salvar estatísticas do álbum: $e'),
      );
    }
  }

  @override
  Future<Either<Failure, AlbumStats?>> getAlbumStats(String albumId) async {
    try {
      final stats = await _isar.albumStats
          .filter()
          .albumIdEqualTo(albumId)
          .findFirst();
      return Right(stats);
    } catch (e) {
      return Left(
        DatabaseFailure(message: 'Falha ao buscar estatísticas do álbum: $e'),
      );
    }
  }

  @override
  Future<Either<Failure, void>> saveSectionStats(SectionStats stats) async {
    try {
      await _isar.writeTxn(() => _isar.sectionStats.put(stats));
      return const Right(null);
    } catch (e) {
      return Left(
        DatabaseFailure(message: 'Falha ao salvar estatísticas da seção: $e'),
      );
    }
  }

  @override
  Future<Either<Failure, SectionStats?>> getSectionStats(
    String sectionId,
  ) async {
    try {
      final stats = await _isar.sectionStats
          .filter()
          .sectionIdEqualTo(sectionId)
          .findFirst();
      return Right(stats);
    } catch (e) {
      return Left(
        DatabaseFailure(message: 'Falha ao buscar estatísticas da seção: $e'),
      );
    }
  }

  @override
  Future<Either<Failure, List<SectionStats>>> getAllSectionStatsByAlbum(
    String albumId,
  ) async {
    try {
      final stats = await _isar.sectionStats
          .filter()
          .albumIdEqualTo(albumId)
          .findAll();
      return Right(stats);
    } catch (e) {
      return Left(
        DatabaseFailure(
          message: 'Falha ao buscar todas as estatísticas de seções: $e',
        ),
      );
    }
  }
}
