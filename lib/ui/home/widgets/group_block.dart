import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:go_router/go_router.dart';
import 'package:sticker_manager_wc22/core/navigation/app_routes.dart';
import 'package:sticker_manager_wc22/core/theme/palette.dart';
import 'package:sticker_manager_wc22/domain/models/section.dart';
import 'package:sticker_manager_wc22/domain/models/section_stats.dart';
import 'package:sticker_manager_wc22/ui/common/widgets/svg_icon.dart';
import 'package:sticker_manager_wc22/ui/home/controllers/home_controller.dart';
import 'package:sticker_manager_wc22/ui/section/models/section_route_args.dart';
import 'package:sticker_manager_wc22/ui/section/widgets/section_icon.dart';

class GroupBlock extends StatelessWidget {
  final String title;
  final List<Section> sections;
  final HomeController controller;

  const GroupBlock({
    required this.title,
    required this.sections,
    required this.controller,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final textTheme = theme.textTheme;
    final colorScheme = theme.colorScheme;

    return SliverMainAxisGroup(
      slivers: [
        SliverPadding(
          padding: const EdgeInsets.fromLTRB(24, 24, 24, 8),
          sliver: SliverToBoxAdapter(
            child: Text(
              title,
              style: textTheme.labelLarge?.copyWith(color: colorScheme.outline),
            ),
          ),
        ),
        SliverPadding(
          padding: const EdgeInsets.symmetric(horizontal: 24),
          sliver: SliverList.separated(
            itemCount: sections.length,
            separatorBuilder: (_, _) => const SizedBox(height: 12),
            itemBuilder: (context, i) {
              final section = sections[i];
              return _SectionTile(section: section, controller: controller);
            },
          ),
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
                        '${section.tag} - ${section.name}',
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
