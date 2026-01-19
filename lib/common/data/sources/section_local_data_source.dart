import 'package:dart_either/dart_either.dart';
import 'package:get/get.dart';
import 'package:isar_community/isar.dart';
import 'package:sticker_manager_wc22/common/data/services/isar_service.dart';
import 'package:sticker_manager_wc22/common/data/sources/i_section_local_data_source.dart';
import 'package:sticker_manager_wc22/common/domain/models/group.dart';
import 'package:sticker_manager_wc22/common/domain/models/section.dart';
import 'package:sticker_manager_wc22/common/util/failure.dart';

class SectionLocalDataSource implements ISectionLocalDataSource {
  final Isar _isar = Get.find<IsarService>().isar;

  @override
  Future<Either<Failure, void>> saveSections(List<Section> sections) async {
    try {
      await _isar.writeTxn(() async {
        await _isar.sections.putAll(sections);
        for (final section in sections) {
          await section.category.save();
        }
      });
      return const Right(null);
    } catch (e) {
      return Left(DatabaseFailure(message: 'Falha ao salvar seções: $e'));
    }
  }

  @override
  Future<Either<Failure, List<Section>>> getSectionsByCategory(
    int categoryId,
  ) async {
    try {
      final sections = await _isar.sections
          .filter()
          .category((q) => q.isarIdEqualTo(categoryId))
          .sortByDisplayOrder()
          .findAll();
      return Right(sections);
    } catch (e) {
      return Left(DatabaseFailure(message: 'Falha ao buscar seções: $e'));
    }
  }

  @override
  Future<Either<Failure, Section?>> getSectionById(int id) async {
    try {
      final section = await _isar.sections.get(id);
      return Right(section);
    } catch (e) {
      return Left(DatabaseFailure(message: 'Falha ao buscar seção: $e'));
    }
  }
}
