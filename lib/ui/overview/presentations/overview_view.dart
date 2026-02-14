import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sticker_manager_wc22/core/theme/color_schemes.dart';
import 'package:sticker_manager_wc22/ui/common/widgets/gradient_header_scaffold.dart';
import 'package:sticker_manager_wc22/ui/common/widgets/progress_card.dart';
import 'package:sticker_manager_wc22/ui/common/widgets/search_text_field.dart';
import 'package:sticker_manager_wc22/ui/common/widgets/sticker_filter_chips_bar.dart';
import 'package:sticker_manager_wc22/ui/common/widgets/svg_icon.dart';
import 'package:sticker_manager_wc22/ui/overview/controllers/overview_controller.dart';
import 'package:sticker_manager_wc22/ui/overview/widgets/overview_section_item.dart';

class OverviewView extends GetView<OverviewController> {
  const OverviewView({super.key});

  @override
  Widget build(BuildContext context) {
    final lightColorScheme = AppColorSchemes.light;
    final theme = Theme.of(context);
    final colorScheme = theme.colorScheme;
    final textTheme = theme.textTheme;

    return GradientHeaderScaffold(
      title: Text(
        'nav_overview'.tr,
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

      header: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          SearchTextField(
            controller: controller.searchController,
            onChanged: controller.updateSearch,
            onCleaned: controller.cleanSearch,
          ),
          const SizedBox(height: 16),
          Obx(
            () => StickerFilterChipsBar(
              selected: controller.currentFilter.value,
              onChanged: controller.setFilter,
            ),
          ),
          const SizedBox(height: 16),
        ],
      ),

      body: CustomScrollView(
        slivers: [
          Obx(() {
            if (controller.isLoading.value) {
              return const SliverFillRemaining(
                child: Center(child: CircularProgressIndicator()),
              );
            }

            if (controller.visibleSections.isEmpty) {
              return SliverFillRemaining(
                child: Container(
                  alignment: Alignment.center,
                  padding: const EdgeInsets.symmetric(horizontal: 48),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      SvgIcon(
                        'repeated',
                        size: 64,
                        color: colorScheme.outline,
                      ),
                      const SizedBox(height: 16),
                      Text(
                        'empty_search'.tr,
                        style: textTheme.titleMedium?.copyWith(
                          color: colorScheme.outline,
                        ),
                        textAlign: TextAlign.center,
                      ),
                    ],
                  ),
                ),
              );
            }

            return SliverMainAxisGroup(
              slivers: [
                for (final sectionData in controller.visibleSections)
                  OverviewSectionItem(
                    data: sectionData,
                    quantityListenableOf: controller.qtyStore.listenableOf,
                    onTap: (s) => controller.onStickerTap(s),
                    onLongPress: (s) => controller.onStickerLongPress(s),
                  ),
              ],
            );
          }),

          const SliverPadding(padding: EdgeInsets.only(bottom: 80)),
        ],
      ),
    );
  }
}
