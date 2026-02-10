import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:go_router/go_router.dart';
import 'package:sticker_manager_wc22/core/navigation/app_routes.dart';
import 'package:sticker_manager_wc22/ui/home/di/home_binding.dart';
import 'package:sticker_manager_wc22/ui/home/presentations/dashboard_shell.dart';
import 'package:sticker_manager_wc22/ui/home/presentations/home_view.dart';
import 'package:sticker_manager_wc22/ui/overview/di/overview_binding.dart';
import 'package:sticker_manager_wc22/ui/overview/presentations/overview_view.dart';
import 'package:sticker_manager_wc22/ui/section/di/section_binding.dart';
import 'package:sticker_manager_wc22/ui/section/presentations/section_view.dart';
import 'package:sticker_manager_wc22/ui/splash/di/splash_binding.dart';
import 'package:sticker_manager_wc22/ui/splash/views/splash_page.dart';

class AppRouter {
  static final GoRouter router = GoRouter(
    initialLocation: AppRoutes.splash,
    routes: [
      GoRouteWithBinding(
        path: AppRoutes.splash,
        builder: (context, state) => const SplashPage(),
        bindingBuilder: (_) => SplashBinding(),
      ),

      StatefulShellRoute.indexedStack(
        builder: (context, state, navigationShell) {
          return DashboardShell(navigationShell: navigationShell);
        },
        branches: [
          StatefulShellBranch(
            routes: [
              GoRouteWithBinding(
                path: AppRoutes.home,
                builder: (context, state) => const HomeView(),
                bindingBuilder: HomeBinding.new,
              ),
            ],
          ),
          StatefulShellBranch(
            routes: [
              GoRouteWithBinding(
                path: AppRoutes.overview,
                builder: (context, state) => const OverviewView(),
                bindingBuilder: OverviewBinding.new,
              ),
            ],
          ),
          StatefulShellBranch(
            routes: [
              GoRoute(
                name: AppRoutes.repeated,
                path: AppRoutes.repeated,
                builder: (context, state) => const Scaffold(
                  body: Center(child: Text('Repetidas')),
                ),
              ),
            ],
          ),
        ],
      ),

      GoRouteWithBinding(
        path: AppRoutes.section,
        builder: (context, state) => const SectionView(),
        bindingBuilder: SectionBinding.new,
        useTransition: true,
      ),
    ],
  );
}

class GoRouteWithBinding extends GoRoute {
  GoRouteWithBinding({
    required super.path,
    required super.builder,
    Bindings Function(GoRouterState state)? bindingBuilder,
    bool useTransition = false,
  }) : super(
    pageBuilder: (context, state) {
      final binding = bindingBuilder?.call(state);
      binding?.dependencies();

      final child = builder!(context, state);
      if (useTransition) return MaterialPage(key: state.pageKey, child: child);
      return NoTransitionPage(key: state.pageKey, child: child);
    },
  );
}
