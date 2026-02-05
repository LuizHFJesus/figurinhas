import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sticker_manager_wc22/common/widgets/gradient_header_scaffold.dart';
import 'package:sticker_manager_wc22/common/widgets/svg_icon.dart';
import 'package:sticker_manager_wc22/ui/home/controllers/home_controller.dart';
import 'package:sticker_manager_wc22/ui/home/widgets/progress_card.dart';

class HomeView extends GetView<HomeController> {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;

    return Obx(
      () => GradientHeaderScaffold(
        title: 'Minhas Figurinhas',
        subtitle: controller.activeAlbum.value?.name,
        actions: [
          IconButton(
            icon: SvgIcon('arrow-switch', color: colorScheme.onPrimary),
            padding: EdgeInsets.zero,
            visualDensity: VisualDensity.compact,
            onPressed: () {},
          ),
          IconButton(
            icon: SvgIcon('more-vertical', color: colorScheme.onPrimary),
            padding: EdgeInsets.zero,
            visualDensity: VisualDensity.compact,
            onPressed: () {},
          ),
        ],
        progressCard: ProgressCard(
          obtained: controller.albumStats.value?.obtained ?? 0,
          total: controller.albumStats.value?.total ?? 0,
          missing: controller.albumStats.value?.missing ?? 0,
          progress: controller.albumStats.value?.progress ?? 0.0,
        ),
        body: const CustomScrollView(),
      ),
    );
  }
}
