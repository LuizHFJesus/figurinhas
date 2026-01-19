import 'package:isar_community/isar.dart';
import 'package:sticker_manager_wc22/common/domain/models/album.dart';
import 'package:sticker_manager_wc22/common/domain/models/section.dart';

part 'group.g.dart';

@collection
class Group {
  Id isarId = Isar.autoIncrement;

  @Index(unique: true, replace: true)
  String? id;

  late String name;

  @Index()
  late int displayOrder;

  final album = IsarLink<Album>();
  final sections = IsarLinks<Section>();
}
