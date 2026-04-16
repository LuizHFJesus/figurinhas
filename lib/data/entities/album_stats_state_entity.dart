import 'package:isar_community/isar.dart';
part 'album_stats_state_entity.g.dart';

@collection
class AlbumStatsStateEntity {
  Id isarId = Isar.autoIncrement;

  /// userAlbumId
  @Index(unique: true, replace: true)
  late String albumStatsId;

  @Index()
  late String userAlbumId;

  late int totalStickers;
  late int obtainedStickers;
  late int missingStickers;
  late int duplicateStickers;

  late double progress;

  late int totalFoils;
  late int obtainedFoils;
  late int missingFoils;

  @Index()
  late DateTime updatedAt;

  DateTime? deletedAt;
}
