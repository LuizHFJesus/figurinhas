import 'package:flutter/material.dart';
import 'package:sticker_manager_wc22/ui/common/widgets/dialog/content_alert_dialog.dart';
import 'package:sticker_manager_wc22/ui/common/widgets/dialog/dialog_action.dart';

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
    return ContentAlertDialog(
      title: title,
      primaryAction: primaryAction,
      secondaryAction: secondaryAction,
      content: description != null
          ? Text(
              description!,
              style: Theme.of(context).textTheme.bodyLarge,
            )
          : null,
    );
  }
}
