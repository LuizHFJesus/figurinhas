import 'package:flutter/material.dart';
import 'package:get/get_state_manager/src/simple/get_view.dart';
import 'package:sticker_manager_wc22/core/theme/palette.dart';
import 'package:sticker_manager_wc22/features/splash/controllers/splash_controller.dart';

class SplashPage extends GetView<SplashController> {
  const SplashPage({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      backgroundColor: AppPalette.brand,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(
              Icons.collections_bookmark_rounded, // Placeholder icon
              size: 80,
              color: AppPalette.accentGold,
            ),
            SizedBox(height: 24),
            SizedBox(
              width: 32,
              height: 32,
              child: CircularProgressIndicator(
                color: AppPalette.accentGold,
                strokeWidth: 3,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
