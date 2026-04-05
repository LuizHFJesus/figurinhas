import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:go_router/go_router.dart';
import 'package:sticker_manager_wc22/core/ads/ad_unit_ids.dart';
import 'package:sticker_manager_wc22/core/theme/color_schemes.dart';
import 'package:sticker_manager_wc22/ui/common/widgets/gradient_header_scaffold.dart';
import 'package:sticker_manager_wc22/ui/common/widgets/progress_card.dart';
import 'package:sticker_manager_wc22/ui/common/widgets/sticker_filter_chips_bar.dart';
import 'package:sticker_manager_wc22/ui/common/widgets/stickers_sliver_grid.dart';
import 'package:sticker_manager_wc22/ui/common/widgets/svg_icon.dart';
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
        () {
          final name = controller.section.value?.name ?? '';
          final tag = controller.section.value?.tag ?? '';

          return Text(
          '$tag - $name',
          style: textTheme.headlineSmall?.copyWith(
            color: lightColorScheme.onPrimary,
          ),
        );
        },
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

      body: CustomScrollView(
        slivers: [
          SliverToBoxAdapter(
            child: Obx(
              () => StickerFilterChipsBar(
                selected: controller.currentFilter.value,
                onChanged: controller.setFilter,
              ),
            ),
          ),

          const SliverPadding(padding: EdgeInsets.only(bottom: 16)),

          Obx(() {
            final stickers = controller.visibleStickers.toList(growable: false);
            return StickersSliverGrid(
              stickers: stickers,
              quantityListenableOf: controller.stickerQtyStore.listenableOf,
              onTap: controller.onStickerTap,
              onLongPress: controller.onStickerLongPress,
            );
          }),

          const SliverPadding(padding: EdgeInsets.only(bottom: 40)),
        ],
      ),

      bannerAdUnitId: AdUnitIds.sectionBanner,
    );
  }
}
