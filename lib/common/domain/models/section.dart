import 'package:isar_community/isar.dart';
import 'package:sticker_manager_wc22/common/domain/models/group.dart';
import 'package:sticker_manager_wc22/common/domain/models/sticker.dart';

part 'section.g.dart';

@collection
class Section {
  Id isarId = Isar.autoIncrement;

  @Index(unique: true, replace: true)
  String? id;

  late String name;
  String? icon;

  @Index()
  late int displayOrder;

  final category = IsarLink<Group>();
  final stickers = IsarLinks<Sticker>();
}

