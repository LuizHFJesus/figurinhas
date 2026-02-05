import 'package:get/get.dart';
import 'package:sticker_manager_wc22/domain/repositories/catalog_repository.dart';
import 'package:sticker_manager_wc22/domain/repositories/stats_repository.dart';
import 'package:sticker_manager_wc22/domain/repositories/user_album_repository.dart';
import 'package:sticker_manager_wc22/domain/repositories/user_profile_repository.dart';
import 'package:sticker_manager_wc22/domain/usecases/get_active_user_album_usecase.dart';
import 'package:sticker_manager_wc22/domain/usecases/get_album_groups_usecase.dart';
import 'package:sticker_manager_wc22/domain/usecases/get_sections_by_group_usecase.dart';
import 'package:sticker_manager_wc22/domain/usecases/watch_album_stats_usecase.dart';
import 'package:sticker_manager_wc22/domain/usecases/watch_section_stats_usecase.dart';
import 'package:sticker_manager_wc22/ui/home/controllers/home_controller.dart';

class HomeBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => GetAlbumGroupsUseCase(Get.find<CatalogRepository>()));
    Get.lazyPut(() => GetSectionsByGroupUseCase(Get.find<CatalogRepository>()));

    Get.lazyPut(() => WatchAlbumStatsUseCase(Get.find<StatsRepository>()));
    Get.lazyPut(() => WatchSectionStatsUseCase(Get.find<StatsRepository>()));

    if (!Get.isRegistered<GetActiveUserAlbumUseCase>()) {
      Get.lazyPut(
        () => GetActiveUserAlbumUseCase(Get.find<UserAlbumRepository>()),
      );
    }

    Get.put(
      HomeController(
        Get.find<UserProfileRepository>(),
        Get.find<GetActiveUserAlbumUseCase>(),
        Get.find<WatchAlbumStatsUseCase>(),
        Get.find<WatchSectionStatsUseCase>(),
        Get.find<GetAlbumGroupsUseCase>(),
        Get.find<GetSectionsByGroupUseCase>(),
      ),
    );
  }
}
