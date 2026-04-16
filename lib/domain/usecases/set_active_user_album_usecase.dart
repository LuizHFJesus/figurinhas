import 'package:sticker_manager_wc22/domain/repositories/user_album_repository.dart';

class SetActiveUserAlbumUseCase {
  final UserAlbumRepository _repo;

  SetActiveUserAlbumUseCase(this._repo);

  Future<void> call({
    required String profileId,
    required String userAlbumId,
  }) =>
      _repo.setActiveUserAlbum(profileId: profileId, userAlbumId: userAlbumId);
}
