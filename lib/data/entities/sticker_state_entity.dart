import 'package:isar_community/isar.dart';
part 'sticker_state_entity.g.dart';

@collection
class StickerStateEntity {
  Id isarId = Isar.autoIncrement;

  /// "$userAlbumId:$code"
  @Index(unique: true, replace: true)
  late String stateId;

  @Index()
  late String userAlbumId;

  @Index()
  late String code;

  /// 0 missing, >=1 obtained, >1 repeated
  late int quantity;

  bool wanted = false;
  bool forTrade = false;
  String? note;

  @Index()
  late DateTime updatedAt;

  DateTime? deletedAt;
}
