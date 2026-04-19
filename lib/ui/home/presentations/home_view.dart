import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sticker_manager_wc22/core/ads/ad_unit_ids.dart';
import 'package:sticker_manager_wc22/core/theme/color_schemes.dart';
import 'package:sticker_manager_wc22/ui/common/widgets/gradient_header_scaffold.dart';
import 'package:sticker_manager_wc22/ui/common/widgets/progress_card.dart';
import 'package:sticker_manager_wc22/ui/common/widgets/svg_icon.dart';
import 'package:sticker_manager_wc22/ui/home/controllers/home_controller.dart';
import 'package:sticker_manager_wc22/ui/home/widgets/group_block.dart';

class HomeView extends GetView<HomeController> {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    final lightColorScheme = AppColorSchemes.light;
    final theme = Theme.of(context);
    final colorScheme = theme.colorScheme;
    final textTheme = theme.textTheme;

    return GradientHeaderScaffold(
      title: Text(
        'home_my_stickers'.tr,
        style: textTheme.headlineSmall?.copyWith(
          color: lightColorScheme.onPrimary,
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
          final albumStats = controller.albumStats.value;
          return ProgressCard(
            obtained: albumStats?.obtained ?? 0,
            total: albumStats?.total ?? 0,
            missing: albumStats?.missing ?? 0,
            progress: albumStats?.progress ?? 0.0,
          );
        },
      ),

      body: CustomScrollView(
        controller: controller.scrollController,
        slivers: [
          SliverPadding(
            padding: const EdgeInsets.symmetric(horizontal: 24),
            sliver: SliverList(
              delegate: SliverChildListDelegate.fixed([
                Text('home_summary'.tr, style: textTheme.headlineSmall),
              ]),
            ),
          ),

          Obx(() {
            return SliverMainAxisGroup(
              slivers: controller.catalogStructure.map((groupData) {
                return GroupBlock(
                  title: groupData.group.name,
                  sections: groupData.sections,
                  controller: controller,
                );
              }).toList(),
            );
          }),

          const SliverToBoxAdapter(child: SizedBox(height: 170)),
        ],
      ),

      floatingActionButton: Obx(
        () => AnimatedScale(
          scale: controller.showScrollToTop.value ? 1.0 : 0.0,
          duration: const Duration(milliseconds: 200),
          child: FloatingActionButton(
            heroTag: 'HOME_FAB',
            mini: true,
            backgroundColor: colorScheme.primary,
            onPressed: controller.scrollToTop,
            child: SvgIcon('chevron-up', color: colorScheme.onPrimary),
          ),
        ),
      ),

      bannerAdUnitId: AdUnitIds.homeBanner,
    );
  }
}
