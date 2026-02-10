import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sticker_manager_wc22/domain/models/sticker_filter.dart';
import 'package:sticker_manager_wc22/ui/common/widgets/sticker_filter_chip.dart';

typedef StickerFilterItem = (StickerFilter filter, String labelKey);

class StickerFilterChipsBar extends StatelessWidget {
  final StickerFilter selected;
  final ValueChanged<StickerFilter> onChanged;

  final List<StickerFilterItem>? items;
  final EdgeInsets padding;
  final double spacing;

  const StickerFilterChipsBar({
    required this.selected,
    required this.onChanged,
    this.items,
    this.padding = const EdgeInsets.symmetric(horizontal: 24),
    this.spacing = 8,
    super.key,
  });

  static const List<StickerFilterItem> defaultItems = [
    (StickerFilter.all, 'filter_all'),
    (StickerFilter.missing, 'filter_missing'),
    (StickerFilter.obtained, 'filter_obtained'),
    (StickerFilter.repeated, 'filter_repeated'),
  ];

  @override
  Widget build(BuildContext context) {
    final resolvedItems = items ?? defaultItems;

    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      padding: padding,
      child: Row(
        children: List.generate(
          resolvedItems.length,
          (index) {
            final item = resolvedItems[index];

            return Padding(
              padding: EdgeInsets.only(
                right: index == resolvedItems.length - 1 ? 0 : spacing,
              ),
              child: StickerFilterChip(
                label: item.$2.tr,
                isSelected: selected == item.$1,
                onTap: () => onChanged(item.$1),
              ),
            );
          },
        ),
      ),
    );
  }
}
