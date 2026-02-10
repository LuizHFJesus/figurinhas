import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class SvgIcon extends StatelessWidget {
  final String assetName;
  final double? size;
  final Color? color;
  final String? semanticLabel;
  final AlignmentGeometry alignment;
  final BlendMode colorBlendMode;
  final bool matchTextDirection;

  const SvgIcon(
    this.assetName, {
    super.key,
    this.size,
    this.color,
    this.semanticLabel,
    this.alignment = Alignment.center,
    this.colorBlendMode = BlendMode.srcIn,
    this.matchTextDirection = false,
  });

  @override
  Widget build(BuildContext context) {
    final effectiveSize = size ?? IconTheme.of(context).size ?? 24.0;
    final effectiveColor = color ?? IconTheme.of(context).color;

    return SvgPicture.asset(
      'assets/icons/$assetName.svg',
      width: effectiveSize,
      height: effectiveSize,
      colorFilter: effectiveColor != null
          ? ColorFilter.mode(effectiveColor, colorBlendMode)
          : null,
      alignment: alignment,
      matchTextDirection: matchTextDirection,
      semanticsLabel: semanticLabel,
    );
  }
}
