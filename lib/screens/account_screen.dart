import 'package:easy_eat_restaurant/cubit/image_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../bloc/restaurant/restaurant_bloc.dart';

class AccountScreen extends StatelessWidget {
  const AccountScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const SizedBox(height: 10),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                InkResponse(
                  onTap: () {
                    BlocProvider.of<ImageCubit>(context).getAvatarImage();
                    // context.read<ImageCubit>().getAvatarImage();
                  },
                  child: BlocBuilder<RestaurantBloc, RestaurantState>(
                    // buildWhen: (previous, current) {
                    //   if (current is RestaurantDetailsState) {
                    //     return true;
                    //   } else if (current is RestaurantUpdatedDetailState) {
                    //     return true;
                    //   } else {
                    //     return false;
                    //   }
                    // },
                    builder: (context, state) {
                      if (state.restaurant != null &&
                          state.restaurant.avatarUrl != null) {
                        return CircleAvatar(
                            radius: 30,
                            child: Image.network(state.restaurant.avatarUrl));
                      } else {
                        return const CircleAvatar(
                            radius: 30, child: Icon(Icons.add));
                      }
                    },
                  ),
                ),
                BlocBuilder<RestaurantBloc, RestaurantState>(
                  builder: (context, state) {
                    if (state is RestaurantDetailsState ||
                        state is RestaurantUpdatedDetailState) {
                      return Text(
                        state.restaurant.restaurantName,
                        style: const TextStyle(
                            fontSize: 19,
                            fontWeight: FontWeight.w400,
                            letterSpacing: 2),
                      );
                    }
                    return const CircularProgressIndicator();
                  },
                ),
              ],
            ),
            const SizedBox(height: 10),
            Padding(
              padding: const EdgeInsets.fromLTRB(8, 3, 8, 3),
              child: Card(
                child: ListTile(
                  title: const Text("Wyloguj"),
                  onTap: () {},
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(8, 3, 8, 3),
              child: Card(
                child: ListTile(
                  title: const Text("Zamówienia"),
                  onTap: () {},
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(8, 3, 8, 3),
              child: Card(
                child: ListTile(
                  title: const Text("Dane resturacji"),
                  onTap: () {},
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
