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

  AlbumStats();

  Map<String, dynamic> toMap() {
    return {
      'albumId': albumId,
      'total': total,
      'owned': owned,
      'repeated': repeated,
      'missing': missing,
      'progress': progress,
      'totalFoil': totalFoil,
      'ownedFoil': ownedFoil,
      'updatedAt': updatedAt.toIso8601String(),
    };
  }

  factory AlbumStats.fromMap(Map<String, dynamic> map) {
    return AlbumStats()
      ..albumId = map['albumId'] as String
      ..total = map['total'] as int? ?? 0
      ..owned = map['owned'] as int? ?? 0
      ..repeated = map['repeated'] as int? ?? 0
      ..missing = map['missing'] as int? ?? 0
      ..progress = (map['progress'] as num? ?? 0.0).toDouble()
      ..totalFoil = map['totalFoil'] as int? ?? 0
      ..ownedFoil = map['ownedFoil'] as int? ?? 0
      ..updatedAt = map['updatedAt'] != null
          ? DateTime.parse(map['updatedAt'] as String)
          : DateTime.now();
  }
}

