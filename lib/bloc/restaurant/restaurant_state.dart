part of 'restaurant_bloc.dart';

abstract class RestaurantState extends Equatable {
  const RestaurantState();

  @override
  List<Object> get props => [];
}

class RestaurantInitial extends RestaurantState {}

class RestaurantDetailsState extends RestaurantState {
  final RestaurantModel restaurant;

  const RestaurantDetailsState(this.restaurant);
}
