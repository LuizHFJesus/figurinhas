import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sticker_manager_wc22/ui/common/widgets/dialog/content_alert_dialog.dart';
import 'package:sticker_manager_wc22/ui/common/widgets/dialog/dialog_action.dart';

class RenameAlbumDialog extends StatefulWidget {
  final String initialName;

  const RenameAlbumDialog({required this.initialName, super.key});

  @override
  State<RenameAlbumDialog> createState() => RenameAlbumDialogState();
}

class RenameAlbumDialogState extends State<RenameAlbumDialog> {
  late final TextEditingController _controller;

  @override
  void initState() {
    super.initState();
    _controller = TextEditingController(text: widget.initialName);
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final colorScheme = theme.colorScheme;
    final textTheme = theme.textTheme;

    return ContentAlertDialog(
      title: 'more_options_rename_album_title'.tr,
      content: TextField(
        controller: _controller,
        autofocus: true,
        decoration: InputDecoration(
          hintText: 'more_options_rename_album_hint'.tr,
          hintStyle: textTheme.bodyLarge?.copyWith(
            color: colorScheme.outline,
          ),
          filled: true,
          fillColor: colorScheme.surface,
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(8),
            borderSide: BorderSide.none,
          ),
        ),
        maxLength: 20,
        textCapitalization: TextCapitalization.sentences,
      ),
      primaryAction: DialogAction(
        label: 'confirm'.tr,
        onPressed: () => Navigator.pop(context, _controller.text),
      ),
      secondaryAction: DialogAction(
        label: 'cancel'.tr,
        onPressed: () => Navigator.pop(context),
      ),
    );
  }
}