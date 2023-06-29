part of 'restaurant_bloc.dart';

abstract class RestaurantState extends Equatable {
  const RestaurantState();

  @override
  List<Object> get props => [];

  get restaurant => null;
}

class RestaurantInitial extends RestaurantState {}

class RestaurantDetailsState extends RestaurantState {
  @override
  final RestaurantModel restaurant;

  const RestaurantDetailsState(this.restaurant);
}

class RestaurantUpdatedDetailState extends RestaurantState {
  @override
  final RestaurantModel restaurant;

  const RestaurantUpdatedDetailState(this.restaurant);
}
