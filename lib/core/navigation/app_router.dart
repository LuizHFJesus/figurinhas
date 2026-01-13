import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:sticker_manager_wc22/core/navigation/app_routes.dart';

class AppRouter {
  static final GoRouter router = GoRouter(
    initialLocation: AppRoutes.home,
    routes: [
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
