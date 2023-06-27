import 'package:easy_eat_restaurant/screens/root_screen.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class AppRouter {
  static const root = "/";
  static final GoRouter _router = GoRouter(
    initialLocation: root,
    errorBuilder: (context, state) => const Center(
      child: Text("This page does'nt exist!"),
    ),
    routes: [
      GoRoute(
        path: root,
        builder: (context, state) {
          return const RootScreen();
        },
      )
    ],
  );

  static GoRouter get router => _router;
}
