import 'package:isar_community/isar.dart';
part 'user_album_entity.g.dart';

@collection
class UserAlbumEntity {
  Id isarId = Isar.autoIncrement;

  /// Stable key for this local "instance" of an album for a profile
  @Index(unique: true, replace: true)
  late String userAlbumId; // UUID

  @Index()
  late String profileId;

  /// References catalog albumId (ex: "2022FWC")
  @Index()
  late String albumId;

  /// User-friendly name: "Álbum Qatar 2022", "Meu Segundo Álbum"
  late String name;

  @Index()
  late bool isActive;

  late DateTime createdAt;
  late DateTime updatedAt;
}
