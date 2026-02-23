import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sticker_manager_wc22/ui/common/widgets/svg_icon.dart';

class SearchTextField extends StatelessWidget {
  final TextEditingController controller;
  final FocusNode focusNode;
  final void Function(String) onChanged;
  final VoidCallback onCleaned;

  const SearchTextField({
    required this.controller,
    required this.focusNode,
    required this.onChanged,
    required this.onCleaned,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final colorScheme = theme.colorScheme;
    final textTheme = theme.textTheme;

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 24),
      child: ValueListenableBuilder<TextEditingValue>(
        valueListenable: controller,
        builder: (context, value, _) {
          final hasText = value.text.isNotEmpty;

          return TextField(
            controller: controller,
            focusNode: focusNode,
            onChanged: onChanged,
            onTapOutside: (_) => FocusScope.of(context).unfocus(),
            decoration: InputDecoration(
              hintText: 'search_hint'.tr,
              hintStyle: textTheme.bodyLarge?.copyWith(
                color: colorScheme.outline,
              ),
              filled: true,
              fillColor: colorScheme.onPrimary,
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(8),
                borderSide: BorderSide.none,
              ),
              suffixIcon: hasText
                  ? IconButton(
                      onPressed: onCleaned,
                      icon: const SvgIcon('close'),
                    )
                  : null,
            ),
          );
        },
      ),
    );
  }
}
