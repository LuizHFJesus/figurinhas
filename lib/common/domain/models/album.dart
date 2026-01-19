import 'package:isar_community/isar.dart';
import 'package:sticker_manager_wc22/common/domain/models/group.dart';

part 'album.g.dart';

@collection
class Album {
  Id isarId = Isar.autoIncrement;

  @Index(unique: true, replace: true)
  String? id;

  @Index()
  String? userId;

  late String name;
  late String edition;

  @Index()
  late bool isActive;

  late DateTime createdAt;
  late DateTime updatedAt;

  final categories = IsarLinks<Group>();

  Album();

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'userId': userId,
      'name': name,
      'edition': edition,
      'isActive': isActive,
      'createdAt': createdAt.toIso8601String(),
      'updatedAt': updatedAt.toIso8601String(),
    };
  }

  factory Album.fromMap(Map<String, dynamic> map) {
    return Album()
      ..id = map['id'] as String?
      ..userId = map['userId'] as String?
      ..name = map['name'] as String
      ..edition = map['edition'] as String
      ..isActive = map['isActive'] as bool? ?? false
      ..createdAt = map['createdAt'] != null
          ? DateTime.parse(map['createdAt'] as String)
          : DateTime.now()
      ..updatedAt = map['updatedAt'] != null
          ? DateTime.parse(map['updatedAt'] as String)
          : DateTime.now();
  }
}
