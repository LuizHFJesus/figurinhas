import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sticker_manager_wc22/core/ads/ad_unit_ids.dart';
import 'package:sticker_manager_wc22/core/theme/color_schemes.dart';
import 'package:sticker_manager_wc22/ui/common/widgets/gradient_header_scaffold.dart';
import 'package:sticker_manager_wc22/ui/common/widgets/progress_card.dart';
import 'package:sticker_manager_wc22/ui/common/widgets/svg_icon.dart';
import 'package:sticker_manager_wc22/ui/stats/controllers/stats_controller.dart';
import 'package:sticker_manager_wc22/ui/stats/widgets/stat_card.dart';

class StatsView extends GetView<StatsController> {
  const StatsView({super.key});

  @override
  Widget build(BuildContext context) {
    final lightColorScheme = AppColorSchemes.light;
    final textTheme = Theme.of(context).textTheme;

    return GradientHeaderScaffold(
      title: Text(
        'nav_stats'.tr,
        style: textTheme.headlineSmall?.copyWith(
          color: lightColorScheme.onPrimary,
        ),
      ),

      subtitle: Obx(
        () => Text(
          controller.album.value?.name ?? '',
          style: textTheme.titleSmall?.copyWith(
            color: lightColorScheme.onPrimary,
          ),
        ),
      ),

      actions: [
        IconButton(
          icon: SvgIcon('share', color: lightColorScheme.onPrimary),
          padding: EdgeInsets.zero,
          visualDensity: VisualDensity.compact,
          onPressed: () => controller.showShareOptions(context),
        ),
        IconButton(
          icon: SvgIcon('more-vertical', color: lightColorScheme.onPrimary),
          padding: EdgeInsets.zero,
          visualDensity: VisualDensity.compact,
          onPressed: () => controller.showMoreOptions(context),
        ),
      ],

      progressCard: Obx(
        () {
          final albumStats = controller.stats.value;
          return ProgressCard(
            obtained: albumStats?.obtained ?? 0,
            total: albumStats?.total ?? 0,
            missing: albumStats?.missing ?? 0,
            progress: albumStats?.progress ?? 0.0,
          );
        },
      ),

      body: Obx(() {
        final stats = controller.stats.value;
        if (stats == null) {
          return const Center(child: CircularProgressIndicator());
        }

        return GridView.count(
          crossAxisCount: 3,
          padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 4),
          mainAxisSpacing: 8,
          crossAxisSpacing: 8,
          physics: const NeverScrollableScrollPhysics(),
          shrinkWrap: true,
          children: [
            StatCard(
              title: 'stats_total_stickers'.tr,
              value: '${stats.total}',
            ),
            StatCard(
              title: 'stats_obtained'.tr,
              value: '${stats.obtained}',
            ),
            StatCard(
              title: 'stats_missing'.tr,
              value: '${stats.missing}',
            ),
            StatCard(
              title: 'stats_repeated'.tr,
              value: '${stats.duplicates}',
            ),
            StatCard(
              title: 'stats_foils'.tr,
              value: '${stats.obtainedFoils}/${stats.totalFoils}',
            ),
            StatCard(
              title: 'stats_progress'.tr,
              value: '${(stats.progress * 100).toStringAsFixed(1)}%',
            ),
          ],
        );
      }),

      bannerAdUnitId: AdUnitIds.statsBanner,
    );
  }
}
