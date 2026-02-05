import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:go_router/go_router.dart';
import 'package:sticker_manager_wc22/core/navigation/app_routes.dart';
import 'package:sticker_manager_wc22/ui/home/presentations/dashboard_shell.dart';
import 'package:sticker_manager_wc22/ui/splash/di/splash_binding.dart';
import 'package:sticker_manager_wc22/ui/splash/views/splash_page.dart';

class AppRouter {
  static final GoRouter router = GoRouter(
    initialLocation: AppRoutes.splash,
    routes: [
      GoRouteWithBinding(
        path: AppRoutes.splash,
        builder: (context, state) => const SplashPage(),
        binding: SplashBinding(),
      ),

      StatefulShellRoute.indexedStack(
        builder: (context, state, navigationShell) {
          return DashboardShell(navigationShell: navigationShell);
        },
        branches: [
          StatefulShellBranch(
            routes: [
              GoRoute(
                name: AppRoutes.home,
                path: AppRoutes.home,
                builder: (context, state) => const Scaffold(
                  body: Center(child: Text('Início')),
                ),
              ),
            ],
          ),
          StatefulShellBranch(
            routes: [
              GoRoute(
                name: AppRoutes.overview,
                path: AppRoutes.overview,
                builder: (context, state) => const Scaffold(
                  body: Center(child: Text('Visão Geral')),
                ),
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
    ],
  );
}

class GoRouteWithBinding extends GoRoute {
  GoRouteWithBinding({
    required super.path,
    required super.builder,
    Bindings? binding,
    bool useTransition = false,
  }) : super(
    pageBuilder: (context, state) {
      binding?.dependencies();
      if (useTransition) {
        return MaterialPage(
          child: builder!(context, state),
          key: state.pageKey,
        );
      }

      return NoTransitionPage(
        child: builder!(context, state),
        key: state.pageKey,
      );
    },
  );
}
