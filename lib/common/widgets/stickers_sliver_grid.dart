import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:sticker_manager_wc22/common/widgets/sticker_grid_item.dart';
import 'package:sticker_manager_wc22/domain/models/sticker.dart';

class StickersSliverGrid extends StatelessWidget {
  final List<Sticker> stickers;
  final ValueListenable<int> Function(String code) quantityListenableOf;
  final void Function(Sticker sticker) onTap;
  final void Function(Sticker sticker) onLongPress;

  final EdgeInsets padding;
  final int crossAxisCount;
  final double mainAxisSpacing;
  final double crossAxisSpacing;

  const StickersSliverGrid({
    required this.stickers,
    required this.quantityListenableOf,
    required this.onTap,
    required this.onLongPress,
    this.padding = const EdgeInsets.symmetric(horizontal: 24),
    this.crossAxisCount = 4,
    this.mainAxisSpacing = 10,
    this.crossAxisSpacing = 10,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SliverPadding(
      padding: padding,
      sliver: SliverGrid(
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: crossAxisCount,
          mainAxisSpacing: mainAxisSpacing,
          crossAxisSpacing: crossAxisSpacing,
        ),
        delegate: SliverChildBuilderDelegate(
          childCount: stickers.length,
          (context, index) {
            final sticker = stickers[index];
            return ValueListenableBuilder<int>(
              valueListenable: quantityListenableOf(sticker.code),
              builder: (context, qty, _) {
                return RepaintBoundary(
                  child: StickerGridItem(
                    key: ValueKey(sticker.code),
                    sticker: sticker,
                    quantity: qty,
                    onTap: () => onTap(sticker),
                    onLongPress: () => onLongPress(sticker),
                  ),
                );
              },
            );
          },
        ),
      ),
    );
  }
}
