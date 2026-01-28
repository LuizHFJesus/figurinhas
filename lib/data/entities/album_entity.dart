import 'package:isar_community/isar.dart';
part 'album_entity.g.dart';

@collection
class AlbumEntity {
  Id isarId = Isar.autoIncrement;

  @Index(unique: true, replace: true)
  late String albumId; // "2022FWC"

  late String edition;

  String? catalogHash;
  int? catalogVersion;
}
