import 'package:isar_community/isar.dart';
part 'sticker_entity.g.dart';

@collection
class StickerEntity {
  Id isarId = Isar.autoIncrement;

  @Index(unique: true, replace: true)
  late String code; // "BRA1", "FWC1"

  @Index()
  late String albumId;

  @Index()
  late String groupId;

  @Index()
  late String sectionId;

  late String displayName;

  @Index()
  late bool isFoil;

  @Index()
  late int order;

  /// Normalized string used by "contains" search
  @Index()
  late String? searchText;
}
