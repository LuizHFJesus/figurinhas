import 'package:get/get.dart';
import 'package:go_router/go_router.dart';
import 'package:sticker_manager_wc22/domain/models/album_stats.dart';
import 'package:sticker_manager_wc22/domain/repositories/stats_repository.dart';
import 'package:sticker_manager_wc22/domain/repositories/user_album_repository.dart';
import 'package:sticker_manager_wc22/domain/repositories/user_profile_repository.dart';
import 'package:sticker_manager_wc22/domain/usecases/get_active_user_album_usecase.dart';
import 'package:sticker_manager_wc22/domain/usecases/watch_album_stats_usecase.dart';
import 'package:sticker_manager_wc22/ui/stats/controllers/stats_controller.dart';

class StatsBinding extends Bindings {
  final GoRouterState state;

  StatsBinding(this.state);

  @override
  void dependencies() {
    final albumStats = state.extra as AlbumStats?;

    Get.lazyPut(() => WatchAlbumStatsUseCase(Get.find<StatsRepository>()));
    if (!Get.isRegistered<GetActiveUserAlbumUseCase>()) {
      Get.lazyPut(() => GetActiveUserAlbumUseCase(Get.find<UserAlbumRepository>()));
    }

    Get.put(StatsController(
      Get.find<UserProfileRepository>(),
      Get.find<GetActiveUserAlbumUseCase>(),
      Get.find<WatchAlbumStatsUseCase>(),
      albumStats: albumStats,
    ));
  }
}