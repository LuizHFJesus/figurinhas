import 'package:flutter/material.dart';

class GradientMask extends StatelessWidget {
  final Widget child;
  final Gradient gradient;
  final BlendMode blendMode;

  const GradientMask({
    required this.child,
    required this.gradient,
    this.blendMode = BlendMode.srcIn,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return ShaderMask(
      shaderCallback: (bounds) {
        return gradient.createShader(
          Rect.fromLTWH(0, 0, bounds.width, bounds.height),
        );
      },
      blendMode: blendMode,
      child: child,
    );
  }
}
