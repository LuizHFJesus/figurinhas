import 'package:dart_either/dart_either.dart';
import 'package:get/get.dart';
import 'package:isar_community/isar.dart';
import 'package:sticker_manager_wc22/common/data/services/isar_service.dart';
import 'package:sticker_manager_wc22/common/data/sources/i_sticker_local_data_source.dart';
import 'package:sticker_manager_wc22/common/domain/models/album.dart';
import 'package:sticker_manager_wc22/common/domain/models/group.dart';
import 'package:sticker_manager_wc22/common/domain/models/section.dart';
import 'package:sticker_manager_wc22/common/domain/models/sticker.dart';
import 'package:sticker_manager_wc22/common/util/failure.dart';

class StickerLocalDataSource implements IStickerLocalDataSource {
  final Isar _isar = Get.find<IsarService>().isar;

  @override
  Future<Either<Failure, void>> saveStickers(List<Sticker> stickers) async {
    try {
      await _isar.writeTxn(() async {
        await _isar.stickers.putAll(stickers);
        for (final sticker in stickers) {
          await sticker.section.save();
        }
      });
      return const Right(null);
    } catch (e) {
      return Left(DatabaseFailure(message: 'Erro ao salvar figurinhas: $e'));
    }
  }

  @override
  Future<Either<Failure, void>> updateSticker(Sticker sticker) async {
    try {
      await _isar.writeTxn(() => _isar.stickers.put(sticker));
      return const Right(null);
    } catch (e) {
      return Left(DatabaseFailure(message: 'Erro ao atualizar figurinha: $e'));
    }
  }

  @override
  Future<Either<Failure, List<Sticker>>> getStickersBySection(
    String sectionId,
  ) async {
    try {
      final results = await _isar.stickers
          .filter()
          .section((q) => q.idEqualTo(sectionId))
          .findAll();
      return Right(results);
    } catch (e) {
      return Left(
        DatabaseFailure(message: 'Erro ao buscar figurinhas da seção: $e'),
      );
    }
  }

  @override
  Future<Either<Failure, List<Sticker>>> getAllStickers(String albumId) async {
    try {
      final stickers = await _isar.stickers
          .filter()
          .section(
            (q) => q.group((c) => c.album((a) => a.idEqualTo(albumId))),
          )
          .findAll();
      return Right(stickers);
    } catch (e) {
      return Left(
        DatabaseFailure(message: 'Erro ao buscar todas as figurinhas: $e'),
      );
    }
  }

  @override
  Future<Either<Failure, List<Sticker>>> getRepeatedStickers(
    String albumId,
  ) async {
    try {
      final stickers = await _isar.stickers
          .filter()
          .quantityGreaterThan(1)
          .and()
          .section(
            (q) => q.group((c) => c.album((a) => a.idEqualTo(albumId))),
          )
          .findAll();
      return Right(stickers);
    } catch (e) {
      return Left(DatabaseFailure(message: 'Erro ao buscar repetidas: $e'));
    }
  }

  @override
  Future<Either<Failure, List<Sticker>>> getMissingStickers(
    String albumId,
  ) async {
    try {
      final stickers = await _isar.stickers
          .filter()
          .quantityEqualTo(0)
          .and()
          .section(
            (q) => q.group((c) => c.album((a) => a.idEqualTo(albumId))),
          )
          .findAll();
      return Right(stickers);
    } catch (e) {
      return Left(DatabaseFailure(message: 'Erro ao buscar faltantes: $e'));
    }
  }

  @override
  Future<Either<Failure, List<Sticker>>> searchStickers(
    String albumId,
    String query,
  ) async {
    try {
      final stickers = await _isar.stickers
          .filter()
          .codeContains(query, caseSensitive: false)
          .and()
          .section(
            (q) => q.group((c) => c.album((a) => a.idEqualTo(albumId))),
          )
          .findAll();
      return Right(stickers);
    } catch (e) {
      return Left(DatabaseFailure(message: 'Erro ao pesquisar figurinhas: $e'));
    }
  }
}
