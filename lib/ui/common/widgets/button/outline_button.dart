import 'package:flutter/material.dart';

class OutlineButton extends StatelessWidget {
  final String label;
  final VoidCallback? onPressed;
  final double borderRadius;

  const OutlineButton({
    required this.label,
    this.onPressed,
    this.borderRadius = 8,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final colorScheme = theme.colorScheme;
    final textTheme = theme.textTheme;

    return OutlinedButton(
      onPressed: onPressed,
      style: OutlinedButton.styleFrom(
        shape: RoundedRectangleBorder(
          side: BorderSide(color: colorScheme.primary),
          borderRadius: BorderRadius.circular(borderRadius),
        ),
        padding: const EdgeInsets.all(10),
      ),
      child: Text(
        label,
        style: textTheme.titleSmall?.copyWith(
          color: colorScheme.primary,
          fontWeight: FontWeight.w500,
        ),
      ),
    );
  }
}
