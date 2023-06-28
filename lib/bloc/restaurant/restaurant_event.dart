part of 'restaurant_bloc.dart';

abstract class RestaurantEvent extends Equatable {
  const RestaurantEvent();

  @override
  List<Object> get props => [];
}

class GetRestaurantDetailsEvent extends RestaurantEvent {}

class HasRestaurantDetailsEvent extends RestaurantEvent {}

class ChangeRestaurantDetailsEvent extends RestaurantEvent {}

class ChangeRestaurantAvatarEvent extends RestaurantEvent {}
