import 'package:isar_community/isar.dart';
import 'package:sticker_manager_wc22/common/domain/models/section.dart';

part 'sticker.g.dart';

@collection
class Sticker {
  Id isarId = Isar.autoIncrement;

  @Index()
  late String code;

  @Index()
  late String? name;

  @Index()
  late bool isFoil;

  @Index()
  late int quantity;

  @Index()
  late bool isOwned;

  @Index()
  late bool isRepeated;

  late DateTime updatedAt;

  final section = IsarLink<Section>();
}
