import 'package:isar_community/isar.dart';
import 'package:sticker_manager_wc22/common/domain/models/group.dart';

part 'album.g.dart';

@collection
class Album {
  Id isarId = Isar.autoIncrement;

  @Index(unique: true, replace: true)
  String? id;

  @Index()
  String? userId;

  late String name;
  late String edition;

  @Index()
  late bool isActive;

  late DateTime createdAt;
  late DateTime updatedAt;

  final categories = IsarLinks<Group>();
}
