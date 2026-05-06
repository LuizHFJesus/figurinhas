import 'package:flutter/services.dart';
import 'package:sticker_manager_wc22/common/utils/constants.dart';
import 'package:sticker_manager_wc22/domain/models/user_album.dart';
import 'package:sticker_manager_wc22/domain/repositories/catalog_repository.dart';
import 'package:sticker_manager_wc22/domain/repositories/user_album_repository.dart';
import 'package:sticker_manager_wc22/domain/usecases/create_user_album_usecase.dart';
import 'package:sticker_manager_wc22/domain/usecases/update_catalog_if_needed_usecase.dart';

class EnsureDefaultUserAlbumUsecase {
  final CatalogRepository _catalogRepository;
  final UserAlbumRepository _userAlbumRepository;
  final CreateUserAlbumUseCase _createAlbum;
  final UpdateCatalogIfNeededUseCase _updateCatalog;

  EnsureDefaultUserAlbumUsecase(
    this._catalogRepository,
    this._userAlbumRepository,
    this._createAlbum,
    this._updateCatalog,
  );

  Future<UserAlbum> call(String profileId) async {
    var album = await _catalogRepository.getAlbum(AppConstants.defaultAlbumId);

    if (album == null) {
      final json = await rootBundle.loadString(AppConstants.defaultAlbumJson);
      album = await _catalogRepository.importCatalogFromJsonString(json);
    } else {
      await _updateCatalog();
    }

    final activeAlbum =
        await _userAlbumRepository.getActiveUserAlbum(profileId);
    if (activeAlbum != null) return activeAlbum;

    final userAlbums = await _userAlbumRepository.listUserAlbums(profileId);
    if (userAlbums.isNotEmpty) {
      final first = userAlbums.first;
      await _userAlbumRepository.setActiveUserAlbum(
        profileId: profileId,
        userAlbumId: first.userAlbumId,
      );
      return first;
    }

    return _createAlbum(
      profileId: profileId,
      albumId: album.albumId,
      name: album.edition,
    );
  }
}
