import 'package:dart_either/dart_either.dart';
import 'package:get/get.dart';
import 'package:isar_community/isar.dart';
import 'package:sticker_manager_wc22/common/data/services/isar_service.dart';
import 'package:sticker_manager_wc22/common/data/sources/i_group_local_data_source.dart';
import 'package:sticker_manager_wc22/common/domain/models/album.dart';
import 'package:sticker_manager_wc22/common/domain/models/group.dart';
import 'package:sticker_manager_wc22/common/util/failure.dart';

class GroupLocalDataSource implements IGroupLocalDataSource {
  final Isar _isar = Get.find<IsarService>().isar;

  @override
  Future<Either<Failure, void>> saveCategories(List<Group> categories) async {
    try {
      await _isar.writeTxn(() async {
        await _isar.groups.putAll(categories);
        for (final group in categories) {
          await group.album.save();
        }
      });
      return const Right(null);
    } catch (e) {
      return Left(DatabaseFailure(message: 'Falha ao salvar categorias: $e'));
    }
  }

  @override
  Future<Either<Failure, List<Group>>> getCategoriesByAlbum(
    String albumId,
  ) async {
    try {
      final categories = await _isar.groups
          .filter()
          .album((q) => q.idEqualTo(albumId))
          .sortByDisplayOrder()
          .findAll();
      return Right(categories);
    } catch (e) {
      return Left(DatabaseFailure(message: 'Falha ao buscar categorias: $e'));
    }
  }
}
