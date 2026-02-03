import 'package:get/get.dart';
import 'package:isar_community/isar.dart';
import 'package:sticker_manager_wc22/common/di/isar_module.dart';
import 'package:sticker_manager_wc22/data/datasources/catalog_local_datasource.dart';
import 'package:sticker_manager_wc22/data/datasources/isar/isar_catalog_local_datasource.dart';
import 'package:sticker_manager_wc22/data/datasources/isar/isar_user_local_datasource.dart';
import 'package:sticker_manager_wc22/data/datasources/user_local_datasource.dart';
import 'package:sticker_manager_wc22/data/repositories/catalog_repository_impl.dart';
import 'package:sticker_manager_wc22/data/repositories/stats_repository_impl.dart';
import 'package:sticker_manager_wc22/data/repositories/sticker_state_repository_impl.dart';
import 'package:sticker_manager_wc22/data/repositories/user_album_repository_impl.dart';
import 'package:sticker_manager_wc22/data/repositories/user_profile_repository_impl.dart';
import 'package:sticker_manager_wc22/domain/repositories/catalog_repository.dart';
import 'package:sticker_manager_wc22/domain/repositories/stats_repository.dart';
import 'package:sticker_manager_wc22/domain/repositories/sticker_state_repository.dart';
import 'package:sticker_manager_wc22/domain/repositories/user_album_repository.dart';
import 'package:sticker_manager_wc22/domain/repositories/user_profile_repository.dart';

class InitialBinding extends Bindings {
  @override
  void dependencies() {
    // Datasources (local)
    Get.lazyPut<CatalogLocalDataSource>(
      () => IsarCatalogLocalDataSource(Get.find<Isar>()),
      fenix: true,
    );

    Get.lazyPut<UserLocalDataSource>(
      () => IsarUserLocalDataSource(Get.find<Isar>()),
      fenix: true,
    );

    // Repositories (domain contracts)
    Get.lazyPut<CatalogRepository>(
      () => CatalogRepositoryImpl(Get.find<CatalogLocalDataSource>()),
      fenix: true,
    );

    Get.lazyPut<StatsRepository>(
      () => StatsRepositoryImpl(
        Get.find<UserLocalDataSource>(),
        Get.find<CatalogRepository>(),
      ),
      fenix: true,
    );

    Get.lazyPut<StatsRepository>(
      () => StatsRepositoryImpl(
        Get.find<UserLocalDataSource>(),
        Get.find<CatalogRepository>(),
      ),
      fenix: true,
    );

    Get.lazyPut<StickerStateRepository>(
      () => StickerStateRepositoryImpl(Get.find<UserLocalDataSource>()),
      fenix: true,
    );

    Get.lazyPut<UserAlbumRepository>(
      () => UserAlbumRepositoryImpl(Get.find<UserLocalDataSource>()),
      fenix: true,
    );

    Get.lazyPut<UserProfileRepository>(
      () => UserProfileRepositoryImpl(Get.find<UserLocalDataSource>()),
      fenix: true,
    );
  }
}
