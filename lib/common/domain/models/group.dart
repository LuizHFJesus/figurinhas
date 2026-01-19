import 'package:isar_community/isar.dart';
import 'package:sticker_manager_wc22/common/domain/models/album.dart';
import 'package:sticker_manager_wc22/common/domain/models/section.dart';

part 'group.g.dart';

@collection
class Group {
  Id isarId = Isar.autoIncrement;

  late String name;

  @Index()
  late int displayOrder;

  final album = IsarLink<Album>();
  final sections = IsarLinks<Section>();

  Group();

  Map<String, dynamic> toMap() {
    return {
      'name': name,
      'displayOrder': displayOrder,
    };
  }

  factory Group.fromMap(Map<String, dynamic> map) {
    return Group()
      ..name = map['name'] as String
      ..displayOrder = map['displayOrder'] as int? ?? 0;
  }
}
