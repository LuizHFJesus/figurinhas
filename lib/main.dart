import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_mobile_ads/google_mobile_ads.dart';
import 'package:isar_community/isar.dart';
import 'package:sticker_manager_wc22/common/di/initial_binding.dart';
import 'package:sticker_manager_wc22/common/di/isar_module.dart';
import 'package:sticker_manager_wc22/core/i18n/app_translations.dart';
import 'package:sticker_manager_wc22/core/navigation/app_router.dart';
import 'package:sticker_manager_wc22/core/theme/app_theme.dart';
import 'package:sticker_manager_wc22/data/services/bootstrap_service.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await MobileAds.instance.initialize();
  await MobileAds.instance.updateRequestConfiguration(
    RequestConfiguration(
      testDeviceIds: ['EA2E26836B6693FDE2B8F54C9B332AAB'],
    ),
  );

  final isar = await openIsar();
  Get.put<Isar>(isar, permanent: true);

  InitialBinding().dependencies();

  final bootstrap = Get.find<BootstrapService>();
  await bootstrap.execute();

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    final router = AppRouter.router;

    return GetMaterialApp.router(
      title: 'app_name'.tr,
      debugShowCheckedModeBanner: false,

      // Locale configuration
      fallbackLocale: const Locale('pt', 'BR'),
      locale: Get.deviceLocale,
      translations: AppTranslations(),

      // Router configuration
      routerDelegate: router.routerDelegate,
      routeInformationParser: router.routeInformationParser,
      routeInformationProvider: router.routeInformationProvider,

      // Theme configuration
      theme: AppTheme.light(),
      darkTheme: AppTheme.dark(),
    );
  }
}
