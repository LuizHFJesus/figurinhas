import 'package:get/get.dart';
import 'package:go_router/go_router.dart';
import 'package:sticker_manager_wc22/data/repositories/stats_repository_impl.dart';
import 'package:sticker_manager_wc22/data/services/active_album_service.dart';
import 'package:sticker_manager_wc22/data/services/isar_stats_updater.dart';
import 'package:sticker_manager_wc22/domain/repositories/catalog_repository.dart';
import 'package:sticker_manager_wc22/domain/repositories/stats_repository.dart';
import 'package:sticker_manager_wc22/domain/repositories/sticker_state_repository.dart';
import 'package:sticker_manager_wc22/domain/repositories/user_profile_repository.dart';
import 'package:sticker_manager_wc22/domain/usecases/clear_album_usecase.dart';
import 'package:sticker_manager_wc22/domain/usecases/fill_album_usecase.dart';
import 'package:sticker_manager_wc22/domain/usecases/get_active_user_album_usecase.dart';
import 'package:sticker_manager_wc22/domain/usecases/get_all_sections_usecase.dart';
import 'package:sticker_manager_wc22/domain/usecases/get_all_stickers_usecase.dart';
import 'package:sticker_manager_wc22/domain/usecases/increment_sticker_quantity_usecase.dart';
import 'package:sticker_manager_wc22/domain/usecases/search_sections_usecase.dart';
import 'package:sticker_manager_wc22/domain/usecases/watch_album_stats_usecase.dart';
import 'package:sticker_manager_wc22/ui/overview/controllers/overview_controller.dart';
import 'package:sticker_manager_wc22/ui/settings/coordinators/more_options_coordinator.dart';
import 'package:sticker_manager_wc22/ui/share/coordinators/share_coordinator.dart';
import 'package:sticker_manager_wc22/ui/share/usecases/generate_share_stats_text_usecase.dart';
import 'package:sticker_manager_wc22/ui/share/usecases/generate_share_stickers_text_usecase.dart';

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
    Get.lazyPut(() => SearchSectionsUseCase(Get.find<CatalogRepository>()));
    Get.lazyPut(() => WatchAlbumStatsUseCase(Get.find<StatsRepository>()));
    Get.lazyPut(
      () => IncrementStickerQuantityUseCase(
        Get.find<StickerStateRepository>(),
        Get.find<IsarStatsUpdater>(),
      ),
    );

    if (!Get.isRegistered<GenerateShareStickersTextUseCase>()) {
      Get.lazyPut(
        () => GenerateShareStickersTextUseCase(
          Get.find<CatalogRepository>(),
          Get.find<StickerStateRepository>(),
        ),
        fenix: true,
      );
    }
    
    if (!Get.isRegistered<GenerateShareStatsTextUseCase>()) {
      Get.lazyPut(
        () => GenerateShareStatsTextUseCase(
          Get.find<CatalogRepository>(),
          Get.find<StatsRepository>(),
        ),
        fenix: true,
      );
    }

    if (!Get.isRegistered<ShareCoordinator>()) {
      Get.lazyPut(
        () => ShareCoordinator(
          Get.find<GenerateShareStickersTextUseCase>(),
          Get.find<GenerateShareStatsTextUseCase>(),
        ),
        fenix: true,
      );
    }

    if (!Get.isRegistered<MoreOptionsCoordinator>()) {
      Get.lazyPut(
        () => MoreOptionsCoordinator(
          Get.find<ClearAlbumUseCase>(),
          Get.find<FillAlbumUseCase>(),
        ),
        fenix: true,
      );
    }

    // Controller
    Get.put(
      OverviewController(
        Get.find<UserProfileRepository>(),
        Get.find<GetActiveUserAlbumUseCase>(),
        Get.find<GetAllSectionsUseCase>(),
        Get.find<GetAllStickersUseCase>(),
        Get.find<MoreOptionsCoordinator>(),
        Get.find<SearchSectionsUseCase>(),
        Get.find<IncrementStickerQuantityUseCase>(),
        Get.find<ShareCoordinator>(),
        Get.find<ActiveAlbumService>(),
      ),
    );
  }
}
