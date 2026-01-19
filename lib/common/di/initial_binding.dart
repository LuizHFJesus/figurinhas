import 'package:get/get.dart';
import 'package:sticker_manager_wc22/common/data/services/isar_service.dart';

class InitialBinding implements Bindings {
  @override
  Future<void> dependencies() async {
    await Get.putAsync<IsarService>(() => IsarService().init());

  }
}
