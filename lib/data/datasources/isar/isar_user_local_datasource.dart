import 'package:isar_community/isar.dart';
import 'package:sticker_manager_wc22/data/datasources/user_local_datasource.dart';
import 'package:sticker_manager_wc22/data/entities/album_stats_state_entity.dart';
import 'package:sticker_manager_wc22/data/entities/section_stats_state_entity.dart';
import 'package:sticker_manager_wc22/data/entities/sticker_state_entity.dart';
import 'package:sticker_manager_wc22/data/entities/user_album_entity.dart';
import 'package:sticker_manager_wc22/data/entities/user_profile_entity.dart';
import 'package:uuid/uuid.dart';

class IsarUserLocalDataSource implements UserLocalDataSource {
  final Isar _isar;
  final Uuid _uuid = const Uuid();

  IsarUserLocalDataSource(this._isar);

  @override
  Future<UserProfileEntity> ensureLocalProfile() async {
    final existing = await _isar.userProfileEntitys.where().findFirst();
    if (existing != null) return existing;

    final now = DateTime.now();
    final profile = UserProfileEntity()
      ..profileId = _uuid.v4()
      ..createdAt = now
      ..updatedAt = now;

    await _isar.writeTxn(() async {
      await _isar.userProfileEntitys.put(profile);
    });

    return profile;
  }

  @override
  Future<UserAlbumEntity> createUserAlbum(UserAlbumEntity e) async {
    await _isar.writeTxn(() async {
      await _isar.userAlbumEntitys.put(e);
    });
    return e;
  }

  @override
  Future<List<UserAlbumEntity>> listUserAlbums(String profileId) {
    return _isar.userAlbumEntitys
        .filter()
        .profileIdEqualTo(profileId)
        .sortByCreatedAt()
        .findAll();
  }

  @override
  Future<UserAlbumEntity?> getActiveUserAlbum(String profileId) {
    return _isar.userAlbumEntitys
        .filter()
        .profileIdEqualTo(profileId)
        .and()
        .isActiveEqualTo(true)
        .findFirst();
  }

  @override
  Stream<UserAlbumEntity?> watchActiveUserAlbum(String profileId) {
    return _isar.userAlbumEntitys
        .filter()
        .profileIdEqualTo(profileId)
        .and()
        .isActiveEqualTo(true)
        .watch(fireImmediately: true)
        .map((list) => list.isEmpty ? null : list.first);
  }

  @override
  Future<void> setActiveUserAlbum({
    required String profileId,
    required String userAlbumId,
  }) async {
    await _isar.writeTxn(() async {
      final all = await _isar.userAlbumEntitys
          .filter()
          .profileIdEqualTo(profileId)
          .findAll();

      for (final e in all) {
        final shouldBeActive = e.userAlbumId == userAlbumId;
        if (e.isActive != shouldBeActive) {
          e.isActive = shouldBeActive;
          e.updatedAt = DateTime.now();
          await _isar.userAlbumEntitys.put(e);
        }
      }
    });
  }

  @override
  Future<StickerStateEntity?> getStickerState(String stateId) {
    return _isar.stickerStateEntitys
        .filter()
        .stateIdEqualTo(stateId)
        .findFirst();
  }

  @override
  Future<void> upsertStickerState(StickerStateEntity e) async {
    await _isar.writeTxn(() async {
      await _isar.stickerStateEntitys.put(e);
    });
  }

  @override
  Future<List<StickerStateEntity>> getAllStickerStates(String userAlbumId) {
    return _isar.stickerStateEntitys
        .filter()
        .userAlbumIdEqualTo(userAlbumId)
        .findAll();
  }

  @override
  Stream<List<StickerStateEntity>> watchAllStickerStates(String userAlbumId) {
    return _isar.stickerStateEntitys
        .filter()
        .userAlbumIdEqualTo(userAlbumId)
        .watch(fireImmediately: true);
  }

  @override
  Future<AlbumStatsStateEntity?> getAlbumStats(String userAlbumId) {
    return _isar.albumStatsStateEntitys
        .filter()
        .albumStatsIdEqualTo(userAlbumId)
        .findFirst();
  }

  @override
  Stream<AlbumStatsStateEntity?> watchAlbumStats(String userAlbumId) {
    return _isar.albumStatsStateEntitys
        .filter()
        .albumStatsIdEqualTo(userAlbumId)
        .watch(fireImmediately: true)
        .map((list) => list.isEmpty ? null : list.first);
  }

  @override
  Future<void> upsertAlbumStats(AlbumStatsStateEntity e) async {
    await _isar.writeTxn(() async {
      await _isar.albumStatsStateEntitys.put(e);
    });
  }

  @override
  Future<SectionStatsStateEntity?> getSectionStats(String sectionStatsId) {
    return _isar.sectionStatsStateEntitys
        .filter()
        .sectionStatsIdEqualTo(sectionStatsId)
        .findFirst();
  }

  @override
  Stream<SectionStatsStateEntity?> watchSectionStats(String sectionStatsId) {
    return _isar.sectionStatsStateEntitys
        .filter()
        .sectionStatsIdEqualTo(sectionStatsId)
        .watch(fireImmediately: true)
        .map((list) => list.isEmpty ? null : list.first);
  }

  @override
  Future<void> upsertSectionStats(SectionStatsStateEntity e) async {
    await _isar.writeTxn(() async {
      await _isar.sectionStatsStateEntitys.put(e);
    });
  }
}
