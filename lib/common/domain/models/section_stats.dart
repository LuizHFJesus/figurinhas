import 'package:isar_community/isar.dart';

part 'section_stats.g.dart';

@collection
class SectionStats {
  Id isarId = Isar.autoIncrement;

  @Index()
  late String sectionId;

  late int total;
  late int owned;
  late int missing;

  late double progress;

  late DateTime updatedAt;
}
