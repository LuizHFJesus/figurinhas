import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:sticker_manager_wc22/ui/common/widgets/svg_icon.dart';

class CustomBottomSheet extends StatelessWidget {
  final String title;
  final List<Widget?> options;

  const CustomBottomSheet({
    required this.title,
    required this.options,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final colorScheme = theme.colorScheme;
    final textTheme = theme.textTheme;

    return Container(
      decoration: BoxDecoration(
        color: colorScheme.onPrimary,
        borderRadius: const BorderRadius.vertical(top: Radius.circular(16)),
      ),
      child: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(24),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
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
              const SizedBox(height: 24),
              ListView.separated(
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                itemCount: options.length,
                separatorBuilder: (_, _) => const SizedBox(height: 16),
                itemBuilder: (_, index) => options[index],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
