import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:sticker_manager_wc22/domain/models/user_album.dart';
import 'package:sticker_manager_wc22/domain/repositories/catalog_repository.dart';
import 'package:sticker_manager_wc22/domain/usecases/create_user_album_usecase.dart';
import 'package:sticker_manager_wc22/domain/usecases/ensure_local_profile_usecase.dart';
import 'package:sticker_manager_wc22/domain/usecases/get_active_user_album_usecase.dart';

class BootstrapService extends GetxService {
  final CatalogRepository _catalogRepository;
  final EnsureLocalProfileUseCase _ensureProfile;
  final GetActiveUserAlbumUseCase _getActiveAlbum;
  final CreateUserAlbumUseCase _createAlbum;

  BootstrapService(
    this._catalogRepository,
    this._ensureProfile,
    this._getActiveAlbum,
    this._createAlbum,
  );

  Future<UserAlbum> execute() async {
    final stickerCount = await _catalogRepository.countStickers('2022FWC');
    if (stickerCount == 0) {
      final jsonString = await rootBundle.loadString(
        'assets/data/2022fwc-data.json',
      );
      await _catalogRepository.importCatalogFromJsonString(jsonString);
    }

    final profileId = await _ensureProfile();
    late final UserAlbum album;
    try {
      album = await _getActiveAlbum(profileId);
    } catch (_) {
      album = await _createAlbum(
        profileId: profileId,
        albumId: '2022FWC',
        name: 'Álbum Qatar 2022',
      );
    }
    return album;
  }
}
