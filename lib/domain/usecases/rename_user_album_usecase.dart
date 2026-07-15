import 'package:sticker_manager_wc22/domain/repositories/user_album_repository.dart';

class RenameUserAlbumUseCase {
  final UserAlbumRepository _repository;

  RenameUserAlbumUseCase(this._repository);

  Future<void> call({
    required String userAlbumId,
    required String newName,
  }) {
    return _repository.renameUserAlbum(
      userAlbumId: userAlbumId,
      newName: newName,
    );
  }
}
