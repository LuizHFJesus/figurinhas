import 'package:sticker_manager_wc22/domain/models/user_album.dart';

abstract class UserAlbumRepository {
  Future<UserAlbum> createUserAlbum({
    required String profileId,
    required String albumId,
    required String name,
    bool setActive = true,
  });

  Future<List<UserAlbum>> listUserAlbums(String profileId);

  Future<UserAlbum?> getActiveUserAlbum(String profileId);

  Stream<UserAlbum> watchActiveUserAlbum(String profileId);

  Future<void> setActiveUserAlbum({
    required String profileId,
    required String userAlbumId,
  });

  Future<void> renameUserAlbum({
    required String userAlbumId,
    required String newName,
  });
}
