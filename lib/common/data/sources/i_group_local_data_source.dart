import 'package:dart_either/dart_either.dart';
import 'package:sticker_manager_wc22/common/domain/models/group.dart';
import 'package:sticker_manager_wc22/common/util/failure.dart';

abstract class IGroupLocalDataSource {
  Future<Either<Failure, void>> saveCategories(List<Group> categories);

  Future<Either<Failure, List<Group>>> getCategoriesByAlbum(String albumId);
}
