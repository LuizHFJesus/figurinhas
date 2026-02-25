import 'package:flutter/material.dart';
import 'package:sticker_manager_wc22/ui/common/widgets/bottom_sheet_tile.dart';

class CustomBottomSheet extends StatelessWidget {
  final String title;
  final List<BottomSheetTile> options;

  const CustomBottomSheet({
    required this.title,
    required this.options,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final textTheme = theme.textTheme;

    return Container(
      decoration: BoxDecoration(
        color: theme.colorScheme.onPrimary,
        borderRadius: const BorderRadius.vertical(top: Radius.circular(16)),
      ),
      child: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(24),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(title, style: textTheme.headlineMedium),
              const SizedBox(height: 24),
              ListView.separated(
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                itemCount: options.length,
                separatorBuilder: (_, __) => const SizedBox(height: 16),
                itemBuilder: (_, index) => options[index],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
