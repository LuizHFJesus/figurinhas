import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sticker_manager_wc22/common/di/initial_binding.dart';
import 'package:sticker_manager_wc22/core/i18n/app_translations.dart';
import 'package:sticker_manager_wc22/core/navigation/app_router.dart';
import 'package:sticker_manager_wc22/core/theme/app_theme.dart';

void main() {
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

      // Dependency injection configuration
      initialBinding: InitialBinding(),

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
