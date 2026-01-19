import 'package:isar_community/isar.dart';
import 'package:sticker_manager_wc22/common/domain/models/section.dart';

part 'sticker.g.dart';

@collection
class Sticker {
  Id isarId = Isar.autoIncrement;

  @Index()
  late String id;

  @Index()
  late String code;

  @Index()
  late String? displayName;

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

  Sticker();

  factory Sticker.fromMap(Map<String, dynamic> map) {
    return Sticker()
      ..id = map['id'] as String
      ..code = map['code'] as String
      ..displayName = map['displayName'] as String
      ..isFoil = map['isFoil'] as bool? ?? false
      ..quantity = map['quantity'] as int? ?? 0
      ..isOwned = (map['quantity'] as int? ?? 0) > 0
      ..isRepeated = (map['quantity'] as int? ?? 0) > 1
      ..updatedAt = DateTime.now();
  }
}
