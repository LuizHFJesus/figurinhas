import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:sticker_manager_wc22/core/theme/palette.dart';
import 'package:sticker_manager_wc22/domain/models/sticker.dart';

class StickerGridItem extends StatelessWidget {
  final Sticker sticker;
  final int quantity;
  final VoidCallback onTap;
  final VoidCallback onLongPress;

  const StickerGridItem({
    required this.sticker,
    required this.quantity,
    required this.onTap,
    required this.onLongPress,
    super.key,
  });

  bool get _isObtained => quantity > 0;

  bool get _isRepeated => quantity > 1;

  static const _radius = BorderRadius.all(Radius.circular(8));

  static const _foilBorderGradient = LinearGradient(
    begin: Alignment.bottomCenter,
    end: Alignment.topRight,
    colors: [AppPalette.accentGold, AppPalette.accentGoldLight],
  );

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final colorScheme = theme.colorScheme;
    final textTheme = theme.textTheme;

    final isFoil = sticker.isFoil;
    final isObtained = _isObtained;

    final Gradient bgGradient;
    var textColor = colorScheme.outline;

    if (isObtained) {
      if (isFoil) {
        bgGradient = const LinearGradient(
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
          colors: [AppPalette.accentGold, AppPalette.accentGoldLight],
        );
      } else {
        bgGradient = const LinearGradient(
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
          colors: [AppPalette.successGreen, AppPalette.successGreen],
        );
      }
      textColor = Colors.white;
    } else {
      bgGradient = LinearGradient(
        begin: Alignment.topCenter,
        end: Alignment.bottomCenter,
        colors: [colorScheme.surfaceContainer, colorScheme.surfaceContainer],
      );
    }

    final fontWeightCode = isObtained ? FontWeight.w600 : FontWeight.w400;
    final fontWeightName = isObtained ? FontWeight.w400 : FontWeight.w300;

    final starColor = colorScheme.outline.withValues(alpha: 0.5);

    Widget content = DecoratedBox(
      decoration: BoxDecoration(
        gradient: bgGradient,
        borderRadius: _radius,
      ),
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              sticker.code,
              style: textTheme.bodyLarge?.copyWith(
                color: textColor,
                fontWeight: fontWeightCode,
              ),
            ),

            if (sticker.displayName.isNotEmpty)
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 4),
                child: Text(
                  sticker.displayName,
                  textAlign: TextAlign.center,
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                  style: textTheme.labelSmall?.copyWith(
                    fontSize: 8,
                    color: textColor,
                    fontWeight: fontWeightName,
                  ),
                ),
              ),
          ],
        ),
      ),
    );

    if (isObtained && isFoil) {
      content = Padding(
        padding: const EdgeInsets.all(2),
        child: content,
      );

      content = DecoratedBox(
        decoration: const BoxDecoration(
          gradient: _foilBorderGradient,
          borderRadius: _radius,
        ),
        child: content,
      );
    }

    return GestureDetector(
      onTap: onTap,
      onLongPress: onLongPress,
      behavior: HitTestBehavior.opaque,
      child: Stack(
        clipBehavior: Clip.none,
        children: [
          ClipRRect(
            borderRadius: _radius,
            child: content,
          ),

          if (_isRepeated)
            Positioned(
              right: -4,
              top: -8,
              child: DecoratedBox(
                decoration: const BoxDecoration(
                  color: AppPalette.brand,
                  shape: BoxShape.circle,
                ),
                child: Padding(
                  padding: const EdgeInsets.all(6),
                  child: Text(
                    '${quantity - 1}',
                    style: const TextStyle(
                      color: Colors.white,
                      fontSize: 10,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),
            ),

          if (isFoil && !isObtained)
            Positioned(
              bottom: 4,
              right: 4,
              child: SvgPicture.asset(
                'assets/icons/star_shine.svg',
                width: 12,
                height: 12,
                colorFilter: ColorFilter.mode(starColor, BlendMode.srcIn),
              ),
            ),
        ],
      ),
    );
  }
}

class DummyStickerGridItem extends StatelessWidget {
  final String code;
  final String displayName;
  final bool isFoil;
  final int quantity;

  const DummyStickerGridItem({
    required this.code,
    required this.isFoil,
    required this.quantity,
    this.displayName = '',
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return StickerGridItem(
      sticker: Sticker(
        code: code,
        albumId: '',
        groupId: '',
        sectionId: '',
        displayName: displayName,
        isFoil: isFoil,
        order: 0,
      ),
      quantity: quantity,
      onTap: () {},
      onLongPress: () {},
    );
  }
}
