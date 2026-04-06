import 'dart:ui';

class DialogAction {
  final String label;
  final VoidCallback? onPressed;
  final bool isDestructive;

  const DialogAction({
    required this.label,
    this.onPressed,
    this.isDestructive = false,
  });
}