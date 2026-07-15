import 'package:get/get.dart';
import 'package:sticker_manager_wc22/data/services/active_album_service.dart';
import 'package:sticker_manager_wc22/data/services/bootstrap_service.dart';
import 'package:sticker_manager_wc22/data/services/purchase_service.dart';
import 'package:sticker_manager_wc22/domain/repositories/catalog_repository.dart';
import 'package:sticker_manager_wc22/domain/repositories/stats_repository.dart';
import 'package:sticker_manager_wc22/domain/repositories/sticker_state_repository.dart';
import 'package:sticker_manager_wc22/domain/repositories/user_album_repository.dart';
import 'package:sticker_manager_wc22/domain/repositories/user_profile_repository.dart';
import 'package:sticker_manager_wc22/domain/usecases/create_user_album_usecase.dart';
import 'package:sticker_manager_wc22/domain/usecases/ensure_default_user_album_usecase.dart';
import 'package:sticker_manager_wc22/domain/usecases/ensure_local_profile_usecase.dart';
import 'package:sticker_manager_wc22/domain/usecases/get_active_user_album_usecase.dart';
import 'package:sticker_manager_wc22/domain/usecases/has_seen_how_it_works_usecase.dart';
import 'package:sticker_manager_wc22/domain/usecases/set_has_seen_how_it_works_usecase.dart';
import 'package:sticker_manager_wc22/domain/usecases/update_catalog_if_needed_usecase.dart';
import 'package:sticker_manager_wc22/domain/usecases/watch_album_stats_usecase.dart';

class BootstrapBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(
      () => EnsureLocalProfileUseCase(Get.find<UserProfileRepository>()),
      fenix: true,
    );
    Get.lazyPut(
      () => HasSeenHowItWorksUseCase(Get.find<UserProfileRepository>()),
      fenix: true,
    );
    Get.lazyPut(
      () => SetHasSeenHowItWorksUseCase(Get.find<UserProfileRepository>()),
      fenix: true,
    );
    Get.lazyPut(
      () => CreateUserAlbumUseCase(Get.find<UserAlbumRepository>()),
      fenix: true,
    );
    Get.lazyPut(
      () => UpdateCatalogIfNeededUseCase(Get.find<CatalogRepository>()),
      fenix: true,
    );
    Get.lazyPut(
      () => EnsureDefaultUserAlbumUsecase(
        Get.find<CatalogRepository>(),
        Get.find<UserAlbumRepository>(),
        Get.find<CreateUserAlbumUseCase>(),
        Get.find<UpdateCatalogIfNeededUseCase>(),
      ),
      fenix: true,
    );
    Get.lazyPut(
      () => GetActiveUserAlbumUseCase(
        Get.find<UserAlbumRepository>(),
        Get.find<EnsureDefaultUserAlbumUsecase>(),
      ),
      fenix: true,
    );

    Get.lazyPut(() => WatchAlbumStatsUseCase(Get.find<StatsRepository>()));

    Get.put(
      ActiveAlbumService(
        Get.find<UserAlbumRepository>(),
        Get.find<WatchAlbumStatsUseCase>(),
        Get.find<StickerStateRepository>(),
      ),
      permanent: true,
    );

    Get.put(
      PurchaseService(Get.find<UserProfileRepository>()),
      permanent: true,
    );

    Get.lazyPut(
      () => BootstrapService(
        Get.find<EnsureLocalProfileUseCase>(),
        Get.find<GetActiveUserAlbumUseCase>(),
        Get.find<ActiveAlbumService>(),
      ),
      fenix: true,
    );
  }
}
