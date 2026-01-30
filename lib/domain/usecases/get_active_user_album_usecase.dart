import 'package:sticker_manager_wc22/domain/models/user_album.dart';
import 'package:sticker_manager_wc22/domain/repositories/user_album_repository.dart';

class GetActiveUserAlbumUseCase {
  final UserAlbumRepository _repo;

  GetActiveUserAlbumUseCase(this._repo);

  Future<UserAlbum> call(String profileId) =>
      _repo.getActiveUserAlbum(profileId);

  Stream<UserAlbum> watch(String profileId) =>
      _repo.watchActiveUserAlbum(profileId);
}
