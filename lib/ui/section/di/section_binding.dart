import 'package:get/get.dart';
import 'package:sticker_manager_wc22/data/repositories/stats_repository_impl.dart';
import 'package:sticker_manager_wc22/data/services/isar_stats_updater.dart';
import 'package:sticker_manager_wc22/domain/repositories/catalog_repository.dart';
import 'package:sticker_manager_wc22/domain/repositories/stats_repository.dart';
import 'package:sticker_manager_wc22/domain/repositories/sticker_state_repository.dart';
import 'package:sticker_manager_wc22/domain/repositories/user_profile_repository.dart';
import 'package:sticker_manager_wc22/domain/usecases/get_active_user_album_usecase.dart';
import 'package:sticker_manager_wc22/domain/usecases/get_stickers_by_section_usecase.dart';
import 'package:sticker_manager_wc22/domain/usecases/increment_sticker_quantity_usecase.dart';
import 'package:sticker_manager_wc22/domain/usecases/watch_section_stats_usecase.dart';
import 'package:sticker_manager_wc22/ui/section/controllers/section_controller.dart';

class SectionBinding extends Bindings {
  @override
  void dependencies() {
    // Services
    Get.lazyPut(() => IsarStatsUpdater(
      Get.find<CatalogRepository>(),
      Get.find<StatsRepository>() as StatsRepositoryImpl,
    ));

    // UseCases
    Get.lazyPut(() => GetStickersBySectionUseCase(Get.find<CatalogRepository>()));
    Get.lazyPut(() => WatchSectionStatsUseCase(Get.find<StatsRepository>()));
    Get.lazyPut(() => IncrementStickerQuantityUseCase(
      Get.find<StickerStateRepository>(),
      Get.find<IsarStatsUpdater>(),
    ));

    // Controller
    Get.put(SectionController(
      Get.find<UserProfileRepository>(),
      Get.find<CatalogRepository>(),
      Get.find<GetActiveUserAlbumUseCase>(),
      Get.find<GetStickersBySectionUseCase>(),
      Get.find<WatchSectionStatsUseCase>(),
      Get.find<StickerStateRepository>(),
      Get.find<IncrementStickerQuantityUseCase>(),
    ));
  }
}