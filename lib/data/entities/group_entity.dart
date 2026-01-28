import 'package:isar_community/isar.dart';
part 'group_entity.g.dart';

@collection
class GroupEntity {
  Id isarId = Isar.autoIncrement;

  @Index(unique: true, replace: true)
  late String groupId; // "GROUP_A", "OTHERS"

  @Index()
  late String albumId;

  late String name;

  @Index()
  late int order;

  /// Normalized string used by "contains" search
  @Index()
  late String? searchText;
}
