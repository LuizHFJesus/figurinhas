import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:go_router/go_router.dart';
import 'package:sticker_manager_wc22/common/widgets/gradient_header_scaffold.dart';
import 'package:sticker_manager_wc22/common/widgets/svg_icon.dart';
import 'package:sticker_manager_wc22/core/navigation/app_routes.dart';
import 'package:sticker_manager_wc22/core/theme/color_schemes.dart';
import 'package:sticker_manager_wc22/core/theme/palette.dart';
import 'package:sticker_manager_wc22/domain/models/section.dart';
import 'package:sticker_manager_wc22/domain/models/section_stats.dart';
import 'package:sticker_manager_wc22/ui/home/controllers/home_controller.dart';
import 'package:sticker_manager_wc22/ui/home/widgets/progress_card.dart';
import 'package:sticker_manager_wc22/ui/home/widgets/section_icon.dart';
import 'package:sticker_manager_wc22/ui/section/models/section_route_args.dart';

class HomeView extends GetView<HomeController> {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    final lightColorScheme = AppColorSchemes.light;
    final textTheme = Theme.of(context).textTheme;

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
          icon: SvgIcon('arrow-switch', color: lightColorScheme.onPrimary),
          padding: EdgeInsets.zero,
          visualDensity: VisualDensity.compact,
          onPressed: () {},
        ),
        IconButton(
          icon: SvgIcon('more-vertical', color: lightColorScheme.onPrimary),
          padding: EdgeInsets.zero,
          visualDensity: VisualDensity.compact,
          onPressed: () {},
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
        slivers: [
          SliverPadding(
            padding: const EdgeInsets.symmetric(horizontal: 24),
            sliver: SliverList(
              delegate: SliverChildListDelegate.fixed([
                const SizedBox(height: 4),
                Text('home_summary'.tr, style: textTheme.headlineSmall),
                const SizedBox(height: 16),
              ]),
            ),
          ),

          Obx(
            () => SliverPadding(
              padding: const EdgeInsets.symmetric(horizontal: 24),
              sliver: SliverList.separated(
                itemCount: controller.catalogStructure.length,
                separatorBuilder: (_, _) => const SizedBox(height: 24),
                itemBuilder: (context, index) {
                  final groupData = controller.catalogStructure[index];
                  return _GroupBlock(
                    title: groupData.group.name,
                    sections: groupData.sections,
                    controller: controller,
                  );
                },
              ),
            ),
          ),

          const SliverToBoxAdapter(child: SizedBox(height: 80)),
        ],
      ),
    );
  }
}

class _GroupBlock extends StatelessWidget {
  final String title;
  final List<Section> sections;
  final HomeController controller;

  const _GroupBlock({
    required this.title,
    required this.sections,
    required this.controller,
  });

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final textTheme = theme.textTheme;
    final colorScheme = theme.colorScheme;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.only(bottom: 8),
          child: Text(
            title,
            style: textTheme.labelLarge?.copyWith(color: colorScheme.outline),
          ),
        ),

        ListView.separated(
          shrinkWrap: true,
          physics: const NeverScrollableScrollPhysics(),
          padding: EdgeInsets.zero,
          itemCount: sections.length,
          separatorBuilder: (_, _) => const SizedBox(height: 12),
          itemBuilder: (context, i) {
            final section = sections[i];
            return _SectionTile(section: section, controller: controller);
          },
        ),
      ],
    );
  }
}

class _SectionTile extends StatelessWidget {
  final Section section;
  final HomeController controller;

  const _SectionTile({required this.section, required this.controller});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final colorScheme = theme.colorScheme;
    final textTheme = theme.textTheme;

    final chevronIcon = SvgIcon('chevron-right', color: colorScheme.outline);

    return StreamBuilder<SectionStats>(
      stream: controller.watchSectionStat(section.sectionId),
      builder: (context, snapshot) {
        final obtained = snapshot.data?.obtained ?? 0;
        final total = snapshot.data?.total ?? 0;
        final done = total != 0 && obtained == total;

        return RepaintBoundary(
          child: InkWell(
            onTap: () async {
              await context.push(
                AppRoutes.sectionPath(section.sectionId),
                extra: SectionRouteArgs(
                  sectionId: section.sectionId,
                  album: controller.activeAlbum.value,
                  section: section,
                  stats: snapshot.data,
                ),
              );
            },
            child: Row(
              spacing: 16,
              children: [
                SectionIcon(size: 48, icon: section.icon),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        section.name,
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                        style: textTheme.titleMedium?.copyWith(
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                      Text(
                        '$obtained ${'lbl_of'.tr} $total',
                        style: textTheme.bodyMedium?.copyWith(
                          color: done
                              ? AppPalette.successGreen
                              : colorScheme.outline,
                        ),
                      ),
                    ],
                  ),
                ),
                chevronIcon,
              ],
            ),
          ),
        );
      },
    );
  }
}
