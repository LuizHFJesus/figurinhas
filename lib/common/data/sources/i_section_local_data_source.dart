import 'package:dart_either/dart_either.dart';
import 'package:sticker_manager_wc22/common/domain/models/section.dart';
import 'package:sticker_manager_wc22/common/util/failure.dart';

abstract class ISectionLocalDataSource {
  Future<Either<Failure, void>> saveSections(List<Section> sections);

  Future<Either<Failure, List<Section>>> getSectionsByGroup(int groupId);

  Future<Either<Failure, Section?>> getSectionById(int id);
}
