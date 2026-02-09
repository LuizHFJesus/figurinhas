import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:sticker_manager_wc22/core/navigation/app_router.dart';
import 'package:sticker_manager_wc22/core/navigation/app_routes.dart';
import 'package:sticker_manager_wc22/domain/models/user_album.dart';
import 'package:sticker_manager_wc22/domain/repositories/catalog_repository.dart';
import 'package:sticker_manager_wc22/domain/usecases/create_user_album_usecase.dart';
import 'package:sticker_manager_wc22/domain/usecases/ensure_local_profile_usecase.dart';
import 'package:sticker_manager_wc22/domain/usecases/get_active_user_album_usecase.dart';
import 'package:sticker_manager_wc22/ui/home/models/home_route_args.dart';

class SplashController extends GetxController {
  final CatalogRepository _catalogRepository;
  final EnsureLocalProfileUseCase _ensureProfile;
  final GetActiveUserAlbumUseCase _getActiveAlbum;
  final CreateUserAlbumUseCase _createAlbum;

  SplashController(
    this._catalogRepository,
    this._ensureProfile,
    this._getActiveAlbum,
    this._createAlbum,
  );

  @override
  Future<void> onInit() async {
    super.onInit();
    await _bootstrap();
  }

  Future<void> _bootstrap() async {
    try {
      final minDelay = Future.delayed(const Duration(seconds: 2));

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

      await minDelay;

      AppRouter.router.go(AppRoutes.home, extra: HomeRouteArgs(album: album));
    } catch (e, s) {
      debugPrint('Bootstrap failed: $e\n$s');

      final retry = await Get.dialog<bool>(
        AlertDialog(
          title: Text('error_bootstrap_title'.tr),
          content: Text('error_bootstrap_content'.tr),
          actions: [
            TextButton(
              onPressed: () => Get.back(result: true),
              child: Text('error_retry'.tr),
            ),
          ],
        ),
        barrierDismissible: false,
      );

      if (retry ?? false) await _bootstrap();
    }
  }
}
