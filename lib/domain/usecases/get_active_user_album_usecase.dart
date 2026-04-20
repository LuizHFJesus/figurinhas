import 'package:sticker_manager_wc22/domain/models/user_album.dart';
import 'package:sticker_manager_wc22/domain/repositories/user_album_repository.dart';
import 'package:sticker_manager_wc22/domain/usecases/ensure_default_user_album_usecase.dart';

class GetActiveUserAlbumUseCase {
  final UserAlbumRepository _repo;
  final EnsureDefaultUserAlbumUsecase _ensureDefaultUserAlbum;

  GetActiveUserAlbumUseCase(this._repo, this._ensureDefaultUserAlbum);

  Future<UserAlbum> call(String profileId) async {
    final defaultAlbum = await _ensureDefaultUserAlbum(profileId);
    final activeAlbum = await _repo.getActiveUserAlbum(profileId);
    return activeAlbum ?? defaultAlbum!;
  }

  Stream<UserAlbum> watch(String profileId) =>
      _repo.watchActiveUserAlbum(profileId);
}
