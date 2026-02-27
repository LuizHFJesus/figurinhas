import 'package:flutter/services.dart';
import 'package:sticker_manager_wc22/common/utils/constants.dart';
import 'package:sticker_manager_wc22/domain/models/user_album.dart';
import 'package:sticker_manager_wc22/domain/repositories/catalog_repository.dart';
import 'package:sticker_manager_wc22/domain/usecases/create_user_album_usecase.dart';

class EnsureDefaultUserAlbumUsecase {
  final CatalogRepository _catalogRepository;
  final CreateUserAlbumUseCase _createAlbum;

  EnsureDefaultUserAlbumUsecase(
    this._catalogRepository,
    this._createAlbum,
  );

  Future<UserAlbum> call(String profileId) async {
    var album = await _catalogRepository.getAlbum(AppConstants.defaultAlbumId);

    if (album == null) {
      final json = await rootBundle.loadString(AppConstants.defaultAlbumJson);
      album = await _catalogRepository.importCatalogFromJsonString(json);
    }

    return _createAlbum(
      profileId: profileId,
      albumId: album.albumId,
      name: album.edition,
    );
  }
}
