import 'package:easy_eat_restaurant/core/app_router.dart';
import 'package:easy_eat_restaurant/core/constatns.dart';
import 'package:easy_eat_restaurant/screens/account_screen.dart';
import 'package:easy_eat_restaurant/screens/menu_screen.dart';
import 'package:easy_eat_restaurant/screens/orders_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

import '../cubit/navigation_bar_cubit.dart';

class RootScreen extends StatelessWidget {
  const RootScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => NavigationBarCubit(),
      child: Scaffold(
        // appBar: AppBar(
        //   // title: const Text(
        //   //   K.appName,
        //   //   textAlign: TextAlign.center,
        //   // ),
        // ),
        body: SafeArea(
          child: BlocBuilder<NavigationBarCubit, NavigationBarState>(
            builder: (context, state) {
              if (state is NavigationBarOrders) {
                return const OrdersScreen();
              } else if (state is NavigationBarMenu) {
                return const MenuScreen();
              } else if (state is NavigationBarAccount) {
                return const AccountScreen();
              } else {
                return Container();
              }
            },
          ),
        ),
        bottomNavigationBar:
            BlocBuilder<NavigationBarCubit, NavigationBarState>(
          builder: (context, state) {
            return BottomNavigationBar(
              currentIndex: state.index,
              items: const [
                BottomNavigationBarItem(
                    icon: Icon(Icons.list_rounded), label: "Orders"),
                BottomNavigationBarItem(
                    icon: Icon(Icons.menu_book_outlined), label: "Menu"),
                BottomNavigationBarItem(
                    icon: Icon(Icons.account_circle), label: "Account"),
              ],
              onTap: (value) {
                BlocProvider.of<NavigationBarCubit>(context)
                    .getNavBarIndex(value);
              },
            );
          },
        ),
        floatingActionButton:
            BlocBuilder<NavigationBarCubit, NavigationBarState>(
          builder: (context, state) {
            return Visibility(
                visible: state is NavigationBarMenu ? true : false,
                child: FloatingActionButton.extended(
                  onPressed: () {
                    GoRouter.of(context).push(AppRouter.newDish);
                  },
                  label: const Text("Dodaj"),
                  icon: const Icon(Icons.add),
                ));
          },
        ),
      ),
    );
  }
}
