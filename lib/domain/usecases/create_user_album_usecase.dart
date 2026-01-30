import 'package:sticker_manager_wc22/domain/models/user_album.dart';
import 'package:sticker_manager_wc22/domain/repositories/user_album_repository.dart';

class CreateUserAlbumUseCase {
  final UserAlbumRepository _repo;

  CreateUserAlbumUseCase(this._repo);

  Future<UserAlbum> call({
    required String profileId,
    required String albumId,
    required String name,
    bool setActive = true,
  }) => _repo.createUserAlbum(
    profileId: profileId,
    albumId: albumId,
    name: name,
    setActive: setActive,
  );
}
