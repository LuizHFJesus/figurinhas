import 'package:get/get.dart';
import 'package:go_router/go_router.dart';
import 'package:sticker_manager_wc22/data/services/active_album_service.dart';
import 'package:sticker_manager_wc22/domain/repositories/catalog_repository.dart';
import 'package:sticker_manager_wc22/domain/repositories/stats_repository.dart';
import 'package:sticker_manager_wc22/domain/repositories/sticker_state_repository.dart';
import 'package:sticker_manager_wc22/domain/repositories/user_album_repository.dart';
import 'package:sticker_manager_wc22/domain/repositories/user_profile_repository.dart';
import 'package:sticker_manager_wc22/domain/usecases/ensure_default_user_album_usecase.dart';
import 'package:sticker_manager_wc22/domain/usecases/get_active_user_album_usecase.dart';
import 'package:sticker_manager_wc22/domain/usecases/get_all_groups_and_sections_usecase.dart';
import 'package:sticker_manager_wc22/domain/usecases/watch_album_stats_usecase.dart';
import 'package:sticker_manager_wc22/domain/usecases/watch_section_stats_usecase.dart';
import 'package:sticker_manager_wc22/ui/ads/usecases/load_banner_ad_usecase.dart';
import 'package:sticker_manager_wc22/ui/home/controllers/home_controller.dart';
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

    Get.create(LoadBannerAdUseCase.new);

    Get.put(
      HomeController(
        Get.find<UserProfileRepository>(),
        Get.find<GetActiveUserAlbumUseCase>(),
        Get.find<WatchSectionStatsUseCase>(),
        Get.find<GetAllGroupsAndSectionsUseCase>(),
        Get.find<ShareCoordinator>(),
        Get.find<ActiveAlbumService>(),
        Get.find<LoadBannerAdUseCase>(),
      ),
    );
  }
}
