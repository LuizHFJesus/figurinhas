import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sticker_manager_wc22/ui/common/widgets/dialog/content_alert_dialog.dart';
import 'package:sticker_manager_wc22/ui/common/widgets/dialog/dialog_action.dart';
import 'package:sticker_manager_wc22/ui/common/widgets/sticker_grid_item.dart';
import 'package:sticker_manager_wc22/ui/common/widgets/svg_icon.dart';

class HowItWorksDialog extends StatelessWidget {
  const HowItWorksDialog({super.key});

  @override
  Widget build(BuildContext context) {
    return ContentAlertDialog(
      title: 'how_it_works_title'.tr,
      primaryAction: DialogAction(
        label: 'close'.tr,
        isDestructive: true,
        onPressed: () => Navigator.pop(context, true),
      ),
      content: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          _buildInfoRow(
            context,
            description: 'how_it_works_select'.tr,
            stickerBeforeAction: const DummyStickerGridItem(
              code: '00',
              isFoil: false,
              quantity: 0,
            ),
            stickerAfterAction: const DummyStickerGridItem(
              code: '00',
              isFoil: false,
              quantity: 1,
            ),
          ),
          const SizedBox(height: 16),
          _buildInfoRow(
            context,
            description: 'how_it_works_duplicate'.tr,
            stickerBeforeAction: const DummyStickerGridItem(
              code: '00',
              isFoil: false,
              quantity: 1,
            ),
            stickerAfterAction: const DummyStickerGridItem(
              code: '00',
              isFoil: false,
              quantity: 2,
            ),
          ),
          const SizedBox(height: 16),
          _buildInfoRow(
            context,
            description: 'how_it_works_unselect'.tr,
            stickerBeforeAction: const DummyStickerGridItem(
              code: '00',
              isFoil: false,
              quantity: 1,
            ),
            stickerAfterAction: const DummyStickerGridItem(
              code: '00',
              isFoil: false,
              quantity: 0,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildInfoRow(
    BuildContext context, {
    required String description,
    required Widget stickerBeforeAction,
    required Widget stickerAfterAction,
  }) {
    return Column(
      children: [
        Text(description, style: Theme.of(context).textTheme.bodyMedium),
        const SizedBox(height: 8),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SizedBox(width: 68, height: 68, child: stickerBeforeAction),
            const SizedBox(width: 16),
            const SvgIcon('forward'),
            const SizedBox(width: 16),
            SizedBox(width: 68, height: 68, child: stickerAfterAction),
          ],
        ),
      ],
    );
  }
}
