import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class SectionIcon extends StatelessWidget {
  final double size;
  final String icon;
  final bool circular;
  final Color? backgroundColor;
  final String? semanticsLabel;

  const SectionIcon({
    required this.size,
    required this.icon,
    this.circular = true,
    this.backgroundColor,
    this.semanticsLabel,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final bg = backgroundColor ?? theme.colorScheme.surfaceContainer;

    Widget svgWidget(
      String asset, {
      BoxFit fit = BoxFit.contain,
      EdgeInsets? padding,
    }) {
      return Padding(
        padding: padding ?? EdgeInsets.zero,
        child: SvgPicture.asset(
          asset,
          width: size,
          height: size,
          fit: fit,
          semanticsLabel: semanticsLabel,
          placeholderBuilder: (context) => SizedBox(
            width: size,
            height: size,
            child: const Center(
              child: CircularProgressIndicator(strokeWidth: 1.6),
            ),
          ),
        ),
      );
    }

    final child = _isIcon
        ? svgWidget('assets/icons/$icon.svg', padding: const EdgeInsets.all(8))
        : svgWidget('assets/flags/$icon.svg', fit: BoxFit.cover);

    final clipped = circular
        ? ClipOval(child: child)
        : ClipRRect(borderRadius: BorderRadius.circular(8), child: child);

    return Material(
      color: bg,
      shape: const CircleBorder(),
      clipBehavior: Clip.antiAlias,
      child: SizedBox(width: size, height: size, child: clipped),
    );
  }

  bool get _isIcon => icon.startsWith('ic_');
}
