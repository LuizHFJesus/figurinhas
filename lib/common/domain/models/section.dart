import 'package:isar_community/isar.dart';
import 'package:sticker_manager_wc22/common/domain/models/group.dart';
import 'package:sticker_manager_wc22/common/domain/models/sticker.dart';

part 'section.g.dart';

@collection
class Section {
  Id isarId = Isar.autoIncrement;

  @Index(unique: true, type: IndexType.hash)
  late String id;

  late String name;
  String? icon;

  @Index()
  late int displayOrder;

  final group = IsarLink<Group>();
  final stickers = IsarLinks<Sticker>();

  Section();

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'name': name,
      'icon': icon,
      'displayOrder': displayOrder,
    };
  }

  factory Section.fromMap(Map<String, dynamic> map) {
    return Section()
      ..id = map['id'] as String
      ..name = map['name'] as String
      ..icon = map['icon'] as String?
      ..displayOrder = map['displayOrder'] as int? ?? 0;
  }
}

