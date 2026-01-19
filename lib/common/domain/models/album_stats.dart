import 'package:isar_community/isar.dart';

part 'album_stats.g.dart';

@collection
class AlbumStats {
  Id isarId = Isar.autoIncrement;

  @Index()
  late String albumId;

  late int total;
  late int owned;
  late int repeated;
  late int missing;
  late double progress;
  late int totalFoil;
  late int ownedFoil;
  late DateTime updatedAt;
}

