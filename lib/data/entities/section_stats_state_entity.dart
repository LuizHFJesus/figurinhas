import 'package:isar_community/isar.dart';
part 'section_stats_state_entity.g.dart';

@collection
class SectionStatsStateEntity {
  Id isarId = Isar.autoIncrement;

  /// "$userAlbumId:$sectionId"
  @Index(unique: true, replace: true)
  late String sectionStatsId;

  @Index()
  late String userAlbumId;

  @Index()
  late String sectionId;

  late int totalStickers;
  late int obtainedStickers;
  late int missingStickers;
  late int duplicateStickers;

  late double progress;

  @Index()
  late DateTime updatedAt;

  DateTime? deletedAt;
}
