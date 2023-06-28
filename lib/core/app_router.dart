import 'package:easy_eat_restaurant/screens/login_screen.dart';
import 'package:easy_eat_restaurant/screens/new_dish_screen.dart';
import 'package:easy_eat_restaurant/screens/register_screen.dart';
import 'package:easy_eat_restaurant/screens/root_screen.dart';
import 'package:easy_eat_restaurant/screens/verification_screen.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

class AppRouter {
  static const root = "/";
  static const newDish = '/newDish';
  static const login = '/login';
  static const register = '/register';
  static const verification = '/verification';
  static final GoRouter _router = GoRouter(
    initialLocation: root,
    errorBuilder: (context, state) => const Center(
      child: Text("This page does'nt exist!"),
    ),
    routes: [
      GoRoute(
        path: root,
        builder: (context, state) {
          if (Supabase.instance.client.auth.currentUser != null) {
            return const RootScreen();
          } else {
            return const LoginScreen();
          }
        },
      ),
      GoRoute(
        path: newDish,
        builder: (context, state) => const NewDishScreen(),
      ),
      GoRoute(
        path: register,
        builder: (context, state) => RegisterScreen(),
      ),
      GoRoute(
        path: verification,
        builder: (context, state) {
          String email = state.extra as String;
          return VerificationScreen(
            email: email,
          );
        },
      ),
    ],
  );

  static GoRouter get router => _router;
}
