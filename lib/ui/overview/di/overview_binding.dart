import 'package:get/get.dart';
import 'package:go_router/go_router.dart';
import 'package:sticker_manager_wc22/data/repositories/stats_repository_impl.dart';
import 'package:sticker_manager_wc22/data/services/isar_stats_updater.dart';
import 'package:sticker_manager_wc22/domain/repositories/catalog_repository.dart';
import 'package:sticker_manager_wc22/domain/repositories/stats_repository.dart';
import 'package:sticker_manager_wc22/domain/repositories/sticker_state_repository.dart';
import 'package:sticker_manager_wc22/domain/repositories/user_profile_repository.dart';
import 'package:sticker_manager_wc22/domain/usecases/get_active_user_album_usecase.dart';
import 'package:sticker_manager_wc22/domain/usecases/get_all_sections_usecase.dart';
import 'package:sticker_manager_wc22/domain/usecases/get_all_stickers_usecase.dart';
import 'package:sticker_manager_wc22/domain/usecases/increment_sticker_quantity_usecase.dart';
import 'package:sticker_manager_wc22/domain/usecases/watch_album_stats_usecase.dart';
import 'package:sticker_manager_wc22/ui/overview/controllers/overview_controller.dart';

class OverviewBinding extends Bindings {
  final GoRouterState state;

  OverviewBinding(this.state);

  @override
  void dependencies() {
    if (!Get.isRegistered<IsarStatsUpdater>()) {
      Get.lazyPut(
        () => IsarStatsUpdater(
          Get.find<CatalogRepository>(),
          Get.find<StatsRepository>() as StatsRepositoryImpl,
        ),
      );
    }

    // UseCases
    Get.lazyPut(() => GetAllSectionsUseCase(Get.find<CatalogRepository>()));
    Get.lazyPut(() => GetAllStickersUseCase(Get.find<CatalogRepository>()));
    Get.lazyPut(() => WatchAlbumStatsUseCase(Get.find<StatsRepository>()));
    Get.lazyPut(
      () => IncrementStickerQuantityUseCase(
        Get.find<StickerStateRepository>(),
        Get.find<IsarStatsUpdater>(),
      ),
    );

    // Controller
    Get.put(
      OverviewController(
        Get.find<UserProfileRepository>(),
        Get.find<GetActiveUserAlbumUseCase>(),
        Get.find<WatchAlbumStatsUseCase>(),
        Get.find<GetAllSectionsUseCase>(),
        Get.find<GetAllStickersUseCase>(),
        Get.find<StickerStateRepository>(),
        Get.find<IncrementStickerQuantityUseCase>(),
      ),
    );
  }
}
