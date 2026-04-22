import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:go_router/go_router.dart';
import 'package:sticker_manager_wc22/domain/models/sticker.dart';
import 'package:sticker_manager_wc22/ui/common/widgets/dialog/content_alert_dialog.dart';
import 'package:sticker_manager_wc22/ui/common/widgets/dialog/dialog_action.dart';
import 'package:sticker_manager_wc22/ui/common/widgets/sticker_grid_item.dart';
import 'package:sticker_manager_wc22/ui/common/widgets/svg_icon.dart';

class StickerQuantityDialog extends StatefulWidget {
  final Sticker sticker;
  final int initialQuantity;

  const StickerQuantityDialog({
    required this.sticker,
    required this.initialQuantity,
    super.key,
  });

  @override
  State<StickerQuantityDialog> createState() => _StickerQuantityDialogState();
}

class _StickerQuantityDialogState extends State<StickerQuantityDialog> {
  late int _quantity;

  @override
  void initState() {
    super.initState();
    _quantity = widget.initialQuantity;
  }

  void _increment() {
    setState(() {
      _quantity++;
    });
  }

  void _decrement() {
    if (_quantity > 0) {
      setState(() {
        _quantity--;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final colorScheme = theme.colorScheme;
    final textTheme = theme.textTheme;

    return ContentAlertDialog(
      title: 'sticker_quantity_title'.tr,
      primaryAction: DialogAction(
        label: 'confirm'.tr,
        onPressed: () => Navigator.pop(context, _quantity),
      ),
      secondaryAction: DialogAction(
        label: 'cancel'.tr,
        onPressed: () => context.pop(),
      ),
      content: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        children: [
          Text.rich(
            TextSpan(
              text: 'sticker_quantity_description'.tr,
              style: textTheme.bodyLarge,
              children: [
                TextSpan(
                  text: widget.sticker.code,
                  style: textTheme.bodyLarge?.copyWith(
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(height: 16),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              SizedBox(
                width: 80,
                height: 80,
                child: DummyStickerGridItem(
                  code: widget.sticker.code,
                  displayName: widget.sticker.displayName,
                  isFoil: widget.sticker.isFoil,
                  quantity: _quantity,
                ),
              ),
              Row(
                children: [
                  _QuantityButton(
                    icon: 'remove',
                    onPressed: _decrement,
                    enabled: _quantity > 0,
                  ),
                  Container(
                    constraints: const BoxConstraints(minWidth: 48),
                    padding: const EdgeInsets.symmetric(horizontal: 12),
                    alignment: Alignment.center,
                    child: Text(
                      '$_quantity',
                      style: textTheme.headlineMedium?.copyWith(
                        fontWeight: FontWeight.bold,
                        color: colorScheme.primary,
                      ),
                    ),
                  ),
                  _QuantityButton(icon: 'add', onPressed: _increment),
                ],
              ),
            ],
          ),
        ],
      ),
    );
  }
}

class _QuantityButton extends StatelessWidget {
  final String icon;
  final VoidCallback onPressed;
  final bool enabled;

  const _QuantityButton({
    required this.icon,
    required this.onPressed,
    this.enabled = true,
  });

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;

    return IconButton(
      onPressed: enabled ? onPressed : null,
      icon: SvgIcon(
        icon,
        color: enabled ? colorScheme.primary : colorScheme.outlineVariant,
      ),
      style: IconButton.styleFrom(
        backgroundColor:
            (enabled ? colorScheme.primary : colorScheme.outlineVariant)
                .withValues(alpha: 0.1),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      ),
    );
  }
}
