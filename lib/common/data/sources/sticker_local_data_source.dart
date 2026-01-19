import 'package:dart_either/dart_either.dart';
import 'package:get/get.dart';
import 'package:isar_community/isar.dart';
import 'package:sticker_manager_wc22/common/data/services/isar_service.dart';
import 'package:sticker_manager_wc22/common/data/sources/i_sticker_local_data_source.dart';
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
  Future<Either<Failure, void>> updateSticker(Sticker sticker) async {
    try {
      await _isar.writeTxn(() => _isar.stickers.put(sticker));
      return const Right(null);
    } catch (e) {
      return Left(DatabaseFailure(message: 'Erro ao atualizar figurinha: $e'));
    }
  }
}
