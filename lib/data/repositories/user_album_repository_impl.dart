import 'package:sticker_manager_wc22/data/datasources/user_local_datasource.dart';
import 'package:sticker_manager_wc22/data/entities/user_album_entity.dart';
import 'package:sticker_manager_wc22/data/mappers/entity_mappers.dart';
import 'package:sticker_manager_wc22/domain/models/user_album.dart';
import 'package:sticker_manager_wc22/domain/repositories/user_album_repository.dart';
import 'package:uuid/uuid.dart';

class UserAlbumRepositoryImpl implements UserAlbumRepository {
  final UserLocalDataSource _local;
  final Uuid _uuid = const Uuid();

  UserAlbumRepositoryImpl(this._local);

  @override
  Future<UserAlbum> createUserAlbum({
    required String profileId,
    required String albumId,
    required String name,
    bool setActive = true,
  }) async {
    final now = DateTime.now();
    final e = UserAlbumEntity()
      ..userAlbumId = _uuid.v4()
      ..profileId = profileId
      ..albumId = albumId
      ..name = name
      ..isActive = setActive
      ..createdAt = now
      ..updatedAt = now;

    final created = await _local.createUserAlbum(e);

    if (setActive) {
      await _local.setActiveUserAlbum(
        profileId: profileId,
        userAlbumId: created.userAlbumId,
      );
    }

    return EntityMappers.toUserAlbum(created);
  }

  @override
  Future<List<UserAlbum>> listUserAlbums(String profileId) async {
    final list = await _local.listUserAlbums(profileId);
    return list.map(EntityMappers.toUserAlbum).toList(growable: false);
  }

  @override
  Future<UserAlbum?> getActiveUserAlbum(String profileId) async {
    final e = await _local.getActiveUserAlbum(profileId);
    return e == null ? null : EntityMappers.toUserAlbum(e);
  }

  @override
  Stream<UserAlbum> watchActiveUserAlbum(String profileId) {
    return _local.watchActiveUserAlbum(profileId).map((e) {
      if (e == null) {
        throw StateError('No active UserAlbum for profileId=$profileId');
      }
      return EntityMappers.toUserAlbum(e);
    });
  }

  @override
  Future<void> setActiveUserAlbum({
    required String profileId,
    required String userAlbumId,
  }) =>
      _local.setActiveUserAlbum(profileId: profileId, userAlbumId: userAlbumId);

  @override
  Future<void> renameUserAlbum({
    required String userAlbumId,
    required String newName,
  }) => _local.updateUserAlbumName(userAlbumId: userAlbumId, newName: newName);
}
