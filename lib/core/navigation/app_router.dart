import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:go_router/go_router.dart';
import 'package:sticker_manager_wc22/core/navigation/app_routes.dart';
import 'package:sticker_manager_wc22/features/splash/di/splash_binding.dart';
import 'package:sticker_manager_wc22/features/splash/views/splash_page.dart';

class AppRouter {
  static final GoRouter router = GoRouter(
    initialLocation: AppRoutes.splash,
    routes: [
      GoRouteWithBinding(
        path: AppRoutes.splash,
        builder: (context, state) => const SplashPage(),
        binding: SplashBinding(),
      ),
      GoRoute(
        name: AppRoutes.home,
        path: AppRoutes.home,
        builder: (context, state) => const Scaffold(
          body: Center(child: Text('home')),
        ),
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
