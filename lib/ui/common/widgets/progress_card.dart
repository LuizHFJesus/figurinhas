import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:sticker_manager_wc22/core/theme/palette.dart';
import 'package:sticker_manager_wc22/ui/section/widgets/section_icon.dart';

class ProgressCard extends StatelessWidget {
  final int obtained;
  final int total;
  final int missing;
  final double progress;
  final String? icon;
  final bool isSection;

  const ProgressCard({
    required this.obtained,
    required this.total,
    required this.missing,
    required this.progress,
    this.icon = 'stickers',
    this.isSection = false,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final percentage = (progress * 100).toStringAsFixed(0);
    final colorScheme = Theme.of(context).colorScheme;
    final textTheme = TextTheme.of(context);

    final Widget leading = (isSection && icon != null)
        ? SectionIcon(size: 56, icon: icon!)
        : SvgPicture.asset(
            'assets/icons/stickers.svg',
            height: 56,
          );

    return Container(
      margin: const EdgeInsets.only(top: 20),
      padding: const EdgeInsets.all(18),
      decoration: BoxDecoration(
        color: colorScheme.onPrimary,
        borderRadius: BorderRadius.circular(8),
        boxShadow: [
          BoxShadow(
            color: colorScheme.inverseSurface.withValues(alpha: 0.05),
            blurRadius: 5,
            offset: const Offset(0, 1),
            blurStyle: BlurStyle.inner,
          ),
        ],
      ),
      child: Row(
        children: [
          leading,
          const SizedBox(width: 24),
          Expanded(
            child: Column(
              children: [
                Align(
                  alignment: Alignment.centerLeft,
                  child: Text.rich(
                    TextSpan(
                      text: '$obtained',
                      style: textTheme.headlineSmall,
                      children: [
                        TextSpan(
                          text: ' / $total ${'lbl_stickers_progress'.tr}',
                          style: textTheme.headlineSmall?.copyWith(
                            fontWeight: FontWeight.w400,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                const SizedBox(height: 8),
                LinearProgressIndicator(
                  value: progress,
                  minHeight: 3,
                  borderRadius: BorderRadius.circular(15),
                  backgroundColor: colorScheme.inverseSurface.withValues(
                    alpha: 0.1,
                  ),
                  valueColor: const AlwaysStoppedAnimation(
                    AppPalette.successGreen,
                  ),
                ),
                const SizedBox(height: 8),
                Align(
                  alignment: Alignment.centerRight,
                  child: Text.rich(
                    TextSpan(
                      text: '$missing',
                      style: textTheme.labelSmall?.copyWith(
                        fontWeight: FontWeight.w600,
                      ),
                      children: [
                        TextSpan(
                          text: ' ${'lbl_missing_progress'.tr} | ',
                          style: textTheme.labelSmall,
                        ),
                        TextSpan(
                          text: '$percentage%',
                          style: textTheme.labelSmall?.copyWith(
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                        TextSpan(
                          text: ' ${'lbl_percentage_progress'.tr}',
                          style: textTheme.labelSmall,
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
