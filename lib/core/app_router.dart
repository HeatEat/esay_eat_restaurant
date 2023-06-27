import 'package:easy_eat_restaurant/screens/new_dish_screen.dart';
import 'package:easy_eat_restaurant/screens/root_screen.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class AppRouter {
  static const root = "/";
  static const newDish = '/newDish';
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
      ),
      GoRoute(
        path: newDish,
        builder: (context, state) => const NewDishScreen(),
      ),
    ],
  );

  static GoRouter get router => _router;
}
