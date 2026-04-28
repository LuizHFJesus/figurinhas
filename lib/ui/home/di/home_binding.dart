import 'package:get/get.dart';
import 'package:go_router/go_router.dart';
import 'package:sticker_manager_wc22/data/services/active_album_service.dart';
import 'package:sticker_manager_wc22/domain/repositories/catalog_repository.dart';
import 'package:sticker_manager_wc22/domain/repositories/stats_repository.dart';
import 'package:sticker_manager_wc22/domain/repositories/sticker_state_repository.dart';
import 'package:sticker_manager_wc22/domain/repositories/user_album_repository.dart';
import 'package:sticker_manager_wc22/domain/repositories/user_profile_repository.dart';
import 'package:sticker_manager_wc22/domain/usecases/clear_album_usecase.dart';
import 'package:sticker_manager_wc22/domain/usecases/create_user_album_usecase.dart';
import 'package:sticker_manager_wc22/domain/usecases/ensure_default_user_album_usecase.dart';
import 'package:sticker_manager_wc22/domain/usecases/fill_album_usecase.dart';
import 'package:sticker_manager_wc22/domain/usecases/get_active_user_album_usecase.dart';
import 'package:sticker_manager_wc22/domain/usecases/get_all_groups_and_sections_usecase.dart';
import 'package:sticker_manager_wc22/domain/usecases/rename_user_album_usecase.dart';
import 'package:sticker_manager_wc22/domain/usecases/update_catalog_if_needed_usecase.dart';
import 'package:sticker_manager_wc22/domain/usecases/watch_album_stats_usecase.dart';
import 'package:sticker_manager_wc22/domain/usecases/watch_section_stats_usecase.dart';
import 'package:sticker_manager_wc22/ui/home/controllers/home_controller.dart';
import 'package:sticker_manager_wc22/ui/settings/coordinators/more_options_coordinator.dart';
import 'package:sticker_manager_wc22/ui/share/coordinators/share_coordinator.dart';
import 'package:sticker_manager_wc22/ui/share/usecases/generate_share_stats_text_usecase.dart';
import 'package:sticker_manager_wc22/ui/share/usecases/generate_share_stickers_text_usecase.dart';

class HomeBinding extends Bindings {
  final GoRouterState state;

  HomeBinding(this.state);

  @override
  void dependencies() {
    Get.lazyPut(
      () => GetAllGroupsAndSectionsUseCase(Get.find<CatalogRepository>()),
    );

    Get.lazyPut(() => WatchAlbumStatsUseCase(Get.find<StatsRepository>()));
    Get.lazyPut(() => WatchSectionStatsUseCase(Get.find<StatsRepository>()));

    if (!Get.isRegistered<UpdateCatalogIfNeededUseCase>()) {
      Get.lazyPut(
        () => UpdateCatalogIfNeededUseCase(Get.find<CatalogRepository>()),
        fenix: true,
      );
    }
    
    if (!Get.isRegistered<EnsureDefaultUserAlbumUsecase>()) {
      Get.lazyPut(
        () => EnsureDefaultUserAlbumUsecase(
          Get.find<CatalogRepository>(),
          Get.find<CreateUserAlbumUseCase>(),
          Get.find<UpdateCatalogIfNeededUseCase>(),
        ),
        fenix: true,
      );
    }

    if (!Get.isRegistered<GetActiveUserAlbumUseCase>()) {
      Get.lazyPut(
        () => GetActiveUserAlbumUseCase(
          Get.find<UserAlbumRepository>(),
          Get.find<EnsureDefaultUserAlbumUsecase>(),
        ),
        fenix: true,
      );
    }

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

    Get.lazyPut(
      () => ShareCoordinator(
        Get.find<GenerateShareStickersTextUseCase>(),
        Get.find<GenerateShareStatsTextUseCase>(),
      ),
      fenix: true,
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

    Get.lazyPut(
      () => MoreOptionsCoordinator(
        Get.find<RenameUserAlbumUseCase>(),
        Get.find<ClearAlbumUseCase>(),
        Get.find<FillAlbumUseCase>(),
      ),
      fenix: true,
    );

    Get.put(
      HomeController(
        Get.find<UserProfileRepository>(),
        Get.find<GetActiveUserAlbumUseCase>(),
        Get.find<WatchSectionStatsUseCase>(),
        Get.find<GetAllGroupsAndSectionsUseCase>(),
        Get.find<ShareCoordinator>(),
        Get.find<MoreOptionsCoordinator>(),
        Get.find<ActiveAlbumService>(),
      ),
    );
  }
}
