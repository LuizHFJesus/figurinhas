import 'package:isar_community/isar.dart';
part 'album_entity.g.dart';

@collection
class AlbumEntity {
  Id isarId = Isar.autoIncrement;

  @Index(unique: true, replace: true)
  late String albumId;

  late String edition;

  String? hash;
  int? version;
}
