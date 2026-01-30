import 'package:dart_either/dart_either.dart';
import 'package:sticker_manager_wc22/common/domain/models/group.dart';
import 'package:sticker_manager_wc22/common/utils/failure.dart';

abstract class IGroupLocalDataSource {
  Future<Either<Failure, void>> saveGroups(List<Group> groups);

  Future<Either<Failure, List<Group>>> getGroupsByAlbum(String albumId);
}
