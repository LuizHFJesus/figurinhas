import 'package:get/get.dart';
import 'package:sticker_manager_wc22/data/services/active_album_service.dart';
import 'package:sticker_manager_wc22/domain/usecases/ensure_local_profile_usecase.dart';
import 'package:sticker_manager_wc22/domain/usecases/get_active_user_album_usecase.dart';

class BootstrapService extends GetxService {
  final EnsureLocalProfileUseCase _ensureProfile;
  final GetActiveUserAlbumUseCase _getActiveAlbum;
  final ActiveAlbumService _activeAlbumService;

  BootstrapService(
    this._ensureProfile,
    this._getActiveAlbum,
    this._activeAlbumService,
  );

  Future<void> execute() async {
    if (_activeAlbumService.activeAlbum.value != null) return;

    final profileId = await _ensureProfile();
    final activeAlbum = await _getActiveAlbum(profileId);

    _activeAlbumService.setActiveAlbum(activeAlbum);
  }
}
