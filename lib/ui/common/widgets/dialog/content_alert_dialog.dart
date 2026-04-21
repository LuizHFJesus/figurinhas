import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:sticker_manager_wc22/ui/common/widgets/button/outline_button.dart';
import 'package:sticker_manager_wc22/ui/common/widgets/button/primary_button.dart';
import 'package:sticker_manager_wc22/ui/common/widgets/dialog/dialog_action.dart';
import 'package:sticker_manager_wc22/ui/common/widgets/svg_icon.dart';

class ContentAlertDialog extends StatelessWidget {
  final String title;
  final Widget? content;
  final DialogAction primaryAction;
  final DialogAction? secondaryAction;

  const ContentAlertDialog({
    required this.title,
    required this.primaryAction,
    this.content,
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
          Expanded(
            child: Text(
              title,
              style: textTheme.headlineMedium,
              maxLines: 2,
            ),
          ),
          IconButton(
            icon: SvgIcon('close', color: colorScheme.onSurfaceVariant),
            padding: EdgeInsets.zero,
            visualDensity: VisualDensity.compact,
            onPressed: () => context.pop(),
          ),
        ],
      ),
      content: content,
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
