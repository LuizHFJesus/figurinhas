import 'package:get/get.dart';
import 'package:sticker_manager_wc22/domain/repositories/catalog_repository.dart';
import 'package:sticker_manager_wc22/domain/repositories/user_album_repository.dart';
import 'package:sticker_manager_wc22/domain/repositories/user_profile_repository.dart';
import 'package:sticker_manager_wc22/domain/usecases/create_user_album_usecase.dart';
import 'package:sticker_manager_wc22/domain/usecases/ensure_local_profile_usecase.dart';
import 'package:sticker_manager_wc22/domain/usecases/get_active_user_album_usecase.dart';
import 'package:sticker_manager_wc22/ui/splash/controllers/splash_controller.dart';

class SplashBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(
      () => EnsureLocalProfileUseCase(Get.find<UserProfileRepository>()),
    );
    Get.lazyPut(
      () => GetActiveUserAlbumUseCase(Get.find<UserAlbumRepository>()),
    );
    Get.lazyPut(
      () => CreateUserAlbumUseCase(Get.find<UserAlbumRepository>()),
    );

    Get.put(
      SplashController(
        Get.find<CatalogRepository>(),
        Get.find<EnsureLocalProfileUseCase>(),
        Get.find<GetActiveUserAlbumUseCase>(),
        Get.find<CreateUserAlbumUseCase>(),
      ),
    );
  }
}
