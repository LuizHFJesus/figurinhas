import 'package:sticker_manager_wc22/data/entities/album_stats_state_entity.dart';
import 'package:sticker_manager_wc22/data/entities/section_stats_state_entity.dart';
import 'package:sticker_manager_wc22/data/entities/sticker_state_entity.dart';
import 'package:sticker_manager_wc22/data/entities/user_album_entity.dart';
import 'package:sticker_manager_wc22/data/entities/user_profile_entity.dart';

abstract class UserLocalDataSource {
  // Profile
  Future<UserProfileEntity> ensureLocalProfile();

  // UserAlbums
  Future<UserAlbumEntity> createUserAlbum(UserAlbumEntity e);

  Future<List<UserAlbumEntity>> listUserAlbums(String profileId);

  Future<UserAlbumEntity?> getActiveUserAlbum(String profileId);

  Stream<UserAlbumEntity?> watchActiveUserAlbum(String profileId);

  Future<void> setActiveUserAlbum({
    required String profileId,
    required String userAlbumId,
  });

  // StickerState
  Future<StickerStateEntity?> getStickerState(String stateId);

  Future<void> upsertStickerState(StickerStateEntity e);

  Future<List<StickerStateEntity>> getAllStickerStates(String userAlbumId);

  Stream<List<StickerStateEntity>> watchAllStickerStates(String userAlbumId);
  
  Future<void> deleteAllStickerStates(String userAlbumId);

  // Stats (read/write)
  Future<AlbumStatsStateEntity?> getAlbumStats(String userAlbumId);

  Stream<AlbumStatsStateEntity?> watchAlbumStats(String userAlbumId);

  Future<void> upsertAlbumStats(AlbumStatsStateEntity e);

  Future<SectionStatsStateEntity?> getSectionStats(String sectionStatsId);

  Stream<SectionStatsStateEntity?> watchSectionStats(String sectionStatsId);

  Future<void> upsertSectionStats(SectionStatsStateEntity e);

  Future<void> resetAllStats(String userAlbumId);
}
