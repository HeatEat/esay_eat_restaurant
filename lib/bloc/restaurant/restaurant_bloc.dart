import 'dart:async';
import 'dart:developer';
import 'dart:io';

import 'package:bloc/bloc.dart';
import 'package:easy_eat_restaurant/cubit/image_cubit.dart';
import 'package:easy_eat_restaurant/data/model/restaurant_model.dart';
import 'package:easy_eat_restaurant/data/repository/easy_eat_repo.dart';
import 'package:equatable/equatable.dart';
import 'package:image_picker/image_picker.dart';

part 'restaurant_event.dart';
part 'restaurant_state.dart';

class RestaurantBloc extends Bloc<RestaurantEvent, RestaurantState> {
  final EasyEatRepository _repo;
  late RestaurantModel restaurant;

  final ImageCubit imageCubit;
  late StreamSubscription imageStreamSubscription;

  RestaurantBloc(this._repo, this.imageCubit) : super(RestaurantInitial()) {
    imageStreamSubscription = imageCubit.stream.listen((event) {
      if (event is ImagePickSuccess) {
        add(ChangeRestaurantAvatarEvent(event.pickedImage));
      }
    });

    on<GetRestaurantDetailsEvent>((event, emit) async {
      restaurant = await _repo.getRestaurantDetails();

      emit(RestaurantDetailsState(restaurant));
    });

    on<ChangeRestaurantAvatarEvent>((event, emit) async {
      log("Get event from ImageCubit");
      log(event.image.path);
      await _repo.changeRestaurantAvatar(file: File(event.image.path));
    });
  }
}
