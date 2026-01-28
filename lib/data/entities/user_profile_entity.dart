import 'package:isar_community/isar.dart';
part 'user_profile_entity.g.dart';

@collection
class UserProfileEntity {
  Id isarId = Isar.autoIncrement;

  @Index(unique: true, replace: true)
  late String profileId; // UUID

  @Index()
  String? remoteUid;

  String? displayName;

  late DateTime createdAt;
  late DateTime updatedAt;
}
