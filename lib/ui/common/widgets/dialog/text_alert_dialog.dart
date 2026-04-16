import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:sticker_manager_wc22/ui/common/widgets/button/outline_button.dart';
import 'package:sticker_manager_wc22/ui/common/widgets/button/primary_button.dart';
import 'package:sticker_manager_wc22/ui/common/widgets/dialog/dialog_action.dart';
import 'package:sticker_manager_wc22/ui/common/widgets/svg_icon.dart';

class TextAlertDialog extends StatelessWidget {
  final String title;
  final String? description;
  final DialogAction primaryAction;
  final DialogAction? secondaryAction;

  const TextAlertDialog({
    required this.title,
    required this.primaryAction,
    this.description,
    this.secondaryAction,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final colorScheme = theme.colorScheme;
    final textTheme = theme.textTheme;

    return AlertDialog(
      backgroundColor: colorScheme.onPrimary,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(24)),
      title: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(title, style: textTheme.headlineMedium),
          IconButton(
            icon: SvgIcon('close', color: colorScheme.onSurfaceVariant),
            padding: EdgeInsets.zero,
            visualDensity: VisualDensity.compact,
            onPressed: () => context.pop(),
          ),
        ],
      ),
      content: description != null
          ? Text(
              description!,
              style: textTheme.bodyLarge,
            )
          : null,
      actions: [
        Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            PrimaryButton(
              label: primaryAction.label,
              onPressed: () => Navigator.pop(context, true),
            ),
            if (secondaryAction != null) ...[
              const SizedBox(height: 8),
              OutlineButton(
                label: secondaryAction!.label,
                onPressed: () => Navigator.pop(context, false),
              ),
            ],
          ],
        ),
      ],
    );
  }
}
