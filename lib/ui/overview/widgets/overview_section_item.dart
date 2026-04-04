import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:sticker_manager_wc22/domain/models/sticker.dart';
import 'package:sticker_manager_wc22/ui/common/widgets/stickers_sliver_grid.dart';
import 'package:sticker_manager_wc22/ui/overview/models/overview_view_model.dart';
import 'package:sticker_manager_wc22/ui/section/widgets/section_icon.dart';

class OverviewSectionItem extends StatelessWidget {
  final OverviewSection data;
  final ValueListenable<int> Function(String code) quantityListenableOf;
  final Future<void> Function(Sticker sticker) onTap;
  final Future<void> Function(Sticker sticker) onLongPress;

  const OverviewSectionItem({
    required this.data,
    required this.quantityListenableOf,
    required this.onTap,
    required this.onLongPress,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;

    return SliverMainAxisGroup(
      slivers: [
        SliverToBoxAdapter(
          child: Padding(
            padding: const EdgeInsets.fromLTRB(24, 0, 24, 12),
            child: Row(
              children: [
                SectionIcon(size: 36, icon: data.section.icon),
                const SizedBox(width: 16),
                Text(
                  '${data.section.tag} - ${data.section.name}',
                  style: textTheme.titleMedium?.copyWith(
                    fontWeight: FontWeight.w600
                  ),
                ),
                const Spacer(),
                Text(
                  '${data.visibleStickers.length}',
                  style: textTheme.labelMedium?.copyWith(
                    fontWeight: FontWeight.w300,
                  ),
                ),
              ],
            ),
          ),
        ),

        StickersSliverGrid(
          stickers: data.visibleStickers,
          quantityListenableOf: quantityListenableOf,
          onTap: onTap,
          onLongPress: onLongPress,
        ),

        const SliverToBoxAdapter(child: SizedBox(height: 16)),
      ],
    );
  }
}
