import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:go_router/go_router.dart';
import 'package:sticker_manager_wc22/ui/common/widgets/svg_icon.dart';

class DashboardShell extends StatelessWidget {
  final StatefulNavigationShell navigationShell;

  const DashboardShell({required this.navigationShell, super.key});

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;

    return Scaffold(
      body: navigationShell,
      bottomNavigationBar: Container(
        padding: const EdgeInsets.symmetric(horizontal: 10),
        decoration: BoxDecoration(
          color: colorScheme.onPrimary,
          borderRadius: const BorderRadius.only(
            topLeft: Radius.circular(16),
            topRight: Radius.circular(16),
          ),
          boxShadow: [
            BoxShadow(
              color: colorScheme.inverseSurface.withValues(alpha: 0.15),
              blurRadius: 5,
              offset: const Offset(0, -1),
              blurStyle: BlurStyle.inner,
            ),
          ],
        ),
        child: NavigationBar(
          selectedIndex: navigationShell.currentIndex,
          onDestinationSelected: _onItemTapped,
          backgroundColor: Colors.transparent,
          elevation: 0,
          indicatorColor: Colors.transparent,
          labelPadding: EdgeInsets.zero,
          labelTextStyle: WidgetStateProperty.resolveWith((states) {
            final textTheme = TextTheme.of(context);

            if (states.contains(WidgetState.selected)) {
              return textTheme.labelLarge?.copyWith(
                fontWeight: FontWeight.w500,
                color: colorScheme.primary,
              );
            }
            return textTheme.labelLarge?.copyWith(color: colorScheme.outline);
          }),
          destinations: [
            NavigationDestination(
              icon: SvgIcon('home', color: colorScheme.outline),
              selectedIcon: SvgIcon('home', color: colorScheme.primary),
              label: 'nav_home'.tr,
            ),
            NavigationDestination(
              icon: SvgIcon('stack-vertical', color: colorScheme.outline),
              selectedIcon: SvgIcon(
                'stack-vertical',
                color: colorScheme.primary,
              ),
              label: 'nav_overview'.tr,
            ),
            NavigationDestination(
              icon: SvgIcon('repeated2', color: colorScheme.outline),
              selectedIcon: SvgIcon('repeated2', color: colorScheme.primary),
              label: 'nav_repeated'.tr,
            ),
          ],
        ),
      ),
    );
  }

  void _onItemTapped(int index) {
    navigationShell.goBranch(
      index,
      initialLocation: index == navigationShell.currentIndex,
    );
  }
}
