import 'package:flutter/material.dart';
import 'package:sticker_manager_wc22/core/theme/palette.dart';
import 'package:sticker_manager_wc22/ui/common/widgets/svg_icon.dart';

enum AppSnackBarType {
  success,
  error,
  info,
}

void showSnackBar(
  BuildContext context, {
  required String message,
  AppSnackBarType type = AppSnackBarType.info,
}) {
  final colorScheme = Theme.of(context).colorScheme;
  final isDark = Theme.of(context).brightness == Brightness.dark;

  Color backgroundColor;
  const icon = 'circle-information';

  switch (type) {
    case AppSnackBarType.success:
      backgroundColor = isDark
          ? AppPalette.successGreenDark
          : AppPalette.successGreen;
    case AppSnackBarType.error:
      backgroundColor = colorScheme.error;
    case AppSnackBarType.info:
      backgroundColor = colorScheme.primary;
  }

  final snackBar = SnackBar(
    behavior: SnackBarBehavior.floating,
    backgroundColor: backgroundColor,
    margin: const EdgeInsets.only(left: 20, right: 20, bottom: 90),
    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
    content: Row(
      children: [
        SvgIcon(
          icon,
          color: colorScheme.onPrimary,
        ),
        const SizedBox(width: 12),
        Expanded(
          child: Text(message, style: TextStyle(color: colorScheme.onPrimary)),
        ),
      ],
    ),
  );

  ScaffoldMessenger.of(context)
    ..hideCurrentSnackBar()
    ..showSnackBar(snackBar);
}
