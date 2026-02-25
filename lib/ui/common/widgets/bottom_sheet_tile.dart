import 'package:flutter/material.dart';
import 'package:sticker_manager_wc22/ui/common/widgets/svg_icon.dart';

class BottomSheetTile extends StatelessWidget {
  final String icon;
  final String label;
  final VoidCallback onTap;

  const BottomSheetTile({
    required this.icon,
    required this.label,
    required this.onTap,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final colorScheme = theme.colorScheme;
    final textTheme = theme.textTheme;

    return InkWell(
      onTap: onTap,
      child: Row(
        children: [
          SvgIcon(icon, color: colorScheme.onSurfaceVariant, size: 36),
          const SizedBox(width: 18),
          Text(
            label,
            style: textTheme.titleMedium?.copyWith(fontWeight: FontWeight.w400),
          ),
        ],
      ),
    );
  }
}
