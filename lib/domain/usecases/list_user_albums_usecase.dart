import 'package:sticker_manager_wc22/domain/models/user_album.dart';
import 'package:sticker_manager_wc22/domain/repositories/user_album_repository.dart';

class ListUserAlbumsUseCase {
  final UserAlbumRepository _repo;

  ListUserAlbumsUseCase(this._repo);

  Future<List<UserAlbum>> call(String profileId) =>
      _repo.listUserAlbums(profileId);
}
