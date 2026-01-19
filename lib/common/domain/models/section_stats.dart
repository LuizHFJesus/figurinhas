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

  SectionStats();

  Map<String, dynamic> toMap() {
    return {
      'sectionId': sectionId,
      'total': total,
      'owned': owned,
      'missing': missing,
      'progress': progress,
      'updatedAt': updatedAt.toIso8601String(),
    };
  }

  factory SectionStats.fromMap(Map<String, dynamic> map) {
    return SectionStats()
      ..sectionId = map['sectionId'] as String
      ..total = map['total'] as int? ?? 0
      ..owned = map['owned'] as int? ?? 0
      ..missing = map['missing'] as int? ?? 0
      ..progress = (map['progress'] as num? ?? 0.0).toDouble()
      ..updatedAt = map['updatedAt'] != null
          ? DateTime.parse(map['updatedAt'] as String)
          : DateTime.now();
  }
}
