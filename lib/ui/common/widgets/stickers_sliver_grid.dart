import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:sticker_manager_wc22/domain/models/sticker.dart';
import 'package:sticker_manager_wc22/ui/common/widgets/sticker_grid_item.dart';

class StickersSliverGrid extends StatelessWidget {
  final List<Sticker> stickers;
  final ValueListenable<int> Function(String code) quantityListenableOf;
  final void Function(Sticker sticker) onTap;
  final void Function(Sticker sticker) onLongPress;

  final EdgeInsets padding;
  final double maxCrossAxisExtent;
  final double mainAxisSpacing;
  final double crossAxisSpacing;
  final double childAspectRatio;

  const StickersSliverGrid({
    required this.stickers,
    required this.quantityListenableOf,
    required this.onTap,
    required this.onLongPress,
    this.padding = const EdgeInsets.symmetric(horizontal: 24),
    this.maxCrossAxisExtent = 100,
    this.mainAxisSpacing = 10,
    this.crossAxisSpacing = 10,
    this.childAspectRatio = 1.0,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SliverPadding(
      padding: padding,
      sliver: SliverGrid(
        gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
          maxCrossAxisExtent: maxCrossAxisExtent,
          mainAxisSpacing: mainAxisSpacing,
          crossAxisSpacing: crossAxisSpacing,
          childAspectRatio: childAspectRatio,
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
