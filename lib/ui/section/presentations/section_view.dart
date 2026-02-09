import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:go_router/go_router.dart';
import 'package:sticker_manager_wc22/common/widgets/gradient_header_scaffold.dart';
import 'package:sticker_manager_wc22/common/widgets/svg_icon.dart';
import 'package:sticker_manager_wc22/core/theme/color_schemes.dart';
import 'package:sticker_manager_wc22/common/widgets/progress_card.dart';
import 'package:sticker_manager_wc22/ui/section/controllers/section_controller.dart';

class SectionView extends GetView<SectionController> {
  const SectionView({super.key});

  @override
  Widget build(BuildContext context) {
    final lightColorScheme = AppColorSchemes.light;
    final textTheme = Theme.of(context).textTheme;

    return GradientHeaderScaffold(
      leading: IconButton(
        icon: SvgIcon('back', color: lightColorScheme.onPrimary),
        padding: EdgeInsets.zero,
        visualDensity: VisualDensity.compact,
        onPressed: () => context.pop(),
      ),

      title: Obx(
        () => Text(
          controller.section.value?.name ?? '',
          style: textTheme.headlineSmall?.copyWith(
            color: lightColorScheme.onPrimary,
          ),
        ),
      ),

      subtitle: Obx(
        () => Text(
          controller.activeAlbum.value?.name ?? '',
          style: textTheme.titleSmall?.copyWith(
            color: lightColorScheme.onPrimary,
          ),
        ),
      ),

      progressCard: Obx(
        () {
          final sectionStats = controller.stats.value;
          return ProgressCard(
            obtained: sectionStats?.obtained ?? 0,
            total: sectionStats?.total ?? 0,
            missing: sectionStats?.missing ?? 0,
            progress: sectionStats?.progress ?? 0.0,
            icon: controller.section.value?.icon,
            isSection: true,
          );
        },
      ),

      body: const CustomScrollView(),
    );
  }
}
