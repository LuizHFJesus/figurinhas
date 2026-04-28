import 'package:get/get.dart';
import 'package:go_router/go_router.dart';
import 'package:sticker_manager_wc22/data/repositories/stats_repository_impl.dart';
import 'package:sticker_manager_wc22/data/services/active_album_service.dart';
import 'package:sticker_manager_wc22/data/services/isar_stats_updater.dart';
import 'package:sticker_manager_wc22/domain/repositories/catalog_repository.dart';
import 'package:sticker_manager_wc22/domain/repositories/stats_repository.dart';
import 'package:sticker_manager_wc22/domain/repositories/sticker_state_repository.dart';
import 'package:sticker_manager_wc22/domain/repositories/user_album_repository.dart';
import 'package:sticker_manager_wc22/domain/repositories/user_profile_repository.dart';
import 'package:sticker_manager_wc22/domain/usecases/clear_album_usecase.dart';
import 'package:sticker_manager_wc22/domain/usecases/fill_album_usecase.dart';
import 'package:sticker_manager_wc22/domain/usecases/get_active_user_album_usecase.dart';
import 'package:sticker_manager_wc22/domain/usecases/get_stickers_by_section_usecase.dart';
import 'package:sticker_manager_wc22/domain/usecases/has_seen_how_it_works_usecase.dart';
import 'package:sticker_manager_wc22/domain/usecases/increment_sticker_quantity_usecase.dart';
import 'package:sticker_manager_wc22/domain/usecases/rename_user_album_usecase.dart';
import 'package:sticker_manager_wc22/domain/usecases/set_has_seen_how_it_works_usecase.dart';
import 'package:sticker_manager_wc22/domain/usecases/set_sticker_quantity_usecase.dart';
import 'package:sticker_manager_wc22/domain/usecases/watch_section_stats_usecase.dart';
import 'package:sticker_manager_wc22/ui/section/controllers/section_controller.dart';
import 'package:sticker_manager_wc22/ui/section/models/section_route_args.dart';
import 'package:sticker_manager_wc22/ui/settings/coordinators/more_options_coordinator.dart';

class SectionBinding extends Bindings {
  final GoRouterState state;

  SectionBinding(this.state);

  @override
  void dependencies() {
    final sectionId = state.pathParameters['sectionId'] ?? '';
    final sectionArgs = state.extra as SectionRouteArgs?;

    // Services
    Get.lazyPut(
      () => IsarStatsUpdater(
        Get.find<CatalogRepository>(),
        Get.find<StatsRepository>() as StatsRepositoryImpl,
      ),
    );

    // UseCases
    Get.lazyPut(
      () => GetStickersBySectionUseCase(Get.find<CatalogRepository>()),
    );
    Get.lazyPut(() => WatchSectionStatsUseCase(Get.find<StatsRepository>()));
    Get.lazyPut(
      () => IncrementStickerQuantityUseCase(
        Get.find<StickerStateRepository>(),
        Get.find<IsarStatsUpdater>(),
      ),
    );
    Get.lazyPut(
      () => SetStickerQuantityUseCase(
        Get.find<StickerStateRepository>(),
        Get.find<IsarStatsUpdater>(),
      ),
    );

    if (!Get.isRegistered<ClearAlbumUseCase>()) {
      Get.lazyPut(
        () => ClearAlbumUseCase(
          Get.find<StickerStateRepository>(),
          Get.find<StatsRepository>(),
        ),
        fenix: true,
      );
    }

    if (!Get.isRegistered<FillAlbumUseCase>()) {
      Get.lazyPut(
        () => FillAlbumUseCase(
          Get.find<StickerStateRepository>(),
          Get.find<StatsRepository>(),
          Get.find<CatalogRepository>(),
        ),
        fenix: true,
      );
    }

    if (!Get.isRegistered<RenameUserAlbumUseCase>()) {
      Get.lazyPut(
        () => RenameUserAlbumUseCase(Get.find<UserAlbumRepository>()),
        fenix: true,
      );
    }

    if (!Get.isRegistered<MoreOptionsCoordinator>()) {
      Get.lazyPut(
        () => MoreOptionsCoordinator(
          Get.find<RenameUserAlbumUseCase>(),
          Get.find<ClearAlbumUseCase>(),
          Get.find<FillAlbumUseCase>(),
        ),
        fenix: true,
      );
    }

    // Controller
    Get.delete<SectionController>(force: true);
    Get.put(
      SectionController(
        Get.find<UserProfileRepository>(),
        Get.find<CatalogRepository>(),
        Get.find<GetActiveUserAlbumUseCase>(),
        Get.find<GetStickersBySectionUseCase>(),
        Get.find<WatchSectionStatsUseCase>(),
        Get.find<IncrementStickerQuantityUseCase>(),
        Get.find<SetStickerQuantityUseCase>(),
        Get.find<HasSeenHowItWorksUseCase>(),
        Get.find<SetHasSeenHowItWorksUseCase>(),
        Get.find<MoreOptionsCoordinator>(),
        Get.find<ActiveAlbumService>(),
        sectionId: sectionId,
        sectionArgs: sectionArgs,
      ),
    );
  }
}
