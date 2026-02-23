import 'package:sticker_manager_wc22/data/entities/album_stats_state_entity.dart';
import 'package:sticker_manager_wc22/data/entities/group_entity.dart';
import 'package:sticker_manager_wc22/data/entities/section_entity.dart';
import 'package:sticker_manager_wc22/data/entities/section_stats_state_entity.dart';
import 'package:sticker_manager_wc22/data/entities/sticker_entity.dart';
import 'package:sticker_manager_wc22/data/entities/sticker_state_entity.dart';
import 'package:sticker_manager_wc22/data/entities/user_album_entity.dart';
import 'package:sticker_manager_wc22/domain/models/album_stats.dart';
import 'package:sticker_manager_wc22/domain/models/group.dart';
import 'package:sticker_manager_wc22/domain/models/section.dart';
import 'package:sticker_manager_wc22/domain/models/section_stats.dart';
import 'package:sticker_manager_wc22/domain/models/sticker.dart';
import 'package:sticker_manager_wc22/domain/models/sticker_state.dart';
import 'package:sticker_manager_wc22/domain/models/user_album.dart';

class EntityMappers {
  static Sticker toSticker(StickerEntity e) => Sticker(
    code: e.code,
    albumId: e.albumId,
    groupId: e.groupId,
    sectionId: e.sectionId,
    displayName: e.displayName,
    isFoil: e.isFoil,
    order: e.order,
  );

  static Group toGroup(GroupEntity e) => Group(
    groupId: e.groupId,
    albumId: e.albumId,
    name: e.name,
    order: e.order,
  );

  static Section toSection(SectionEntity e) => Section(
    sectionId: e.sectionId,
    albumId: e.albumId,
    groupId: e.groupId,
    name: e.name,
    icon: e.icon,
    emoji: e.emoji,
    order: e.order,
  );

  static UserAlbum toUserAlbum(UserAlbumEntity e) => UserAlbum(
    userAlbumId: e.userAlbumId,
    profileId: e.profileId,
    albumId: e.albumId,
    name: e.name,
    isActive: e.isActive,
  );

  static StickerState toStickerState(StickerStateEntity e) => StickerState(
    userAlbumId: e.userAlbumId,
    code: e.code,
    quantity: e.quantity,
  );

  static AlbumStats toAlbumStats(AlbumStatsStateEntity e) => AlbumStats(
    userAlbumId: e.userAlbumId,
    total: e.totalStickers,
    obtained: e.obtainedStickers,
    missing: e.missingStickers,
    duplicates: e.duplicateStickers,
    progress: e.progress,
    totalFoils: e.totalFoils,
    obtainedFoils: e.obtainedFoils,
    missingFoils: e.missingFoils,
  );

  static SectionStats toSectionStats(SectionStatsStateEntity e) => SectionStats(
    userAlbumId: e.userAlbumId,
    sectionId: e.sectionId,
    total: e.totalStickers,
    obtained: e.obtainedStickers,
    missing: e.missingStickers,
    duplicates: e.duplicateStickers,
    progress: e.progress,
  );
}
