import 'package:isar_community/isar.dart';
part 'section_entity.g.dart';

@collection
class SectionEntity {
  Id isarId = Isar.autoIncrement;

  @Index(unique: true, replace: true)
  late String sectionId; // "BRAZIL", "QATAR", etc

  @Index()
  late String albumId;

  @Index()
  late String groupId;

  late String name;
  late String icon;

  @Index()
  late int order;

  /// Normalized string used by "contains" search
  @Index()
  late String? searchText;
}
