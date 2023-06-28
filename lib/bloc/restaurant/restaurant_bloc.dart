import 'package:bloc/bloc.dart';
import 'package:easy_eat_restaurant/data/model/restaurant_model.dart';
import 'package:easy_eat_restaurant/data/repository/easy_eat_repo.dart';
import 'package:equatable/equatable.dart';

part 'restaurant_event.dart';
part 'restaurant_state.dart';

class RestaurantBloc extends Bloc<RestaurantEvent, RestaurantState> {
  final EasyEatRepository _repo;
  late RestaurantModel restaurant;
  RestaurantBloc(this._repo) : super(RestaurantInitial()) {
    on<RestaurantEvent>((event, emit) {
      // TODO: implement event handler
    });

    on<GetRestaurantDetailsEvent>((event, emit) async {
      restaurant = await _repo.getRestaurantDetails();

      emit(RestaurantDetailsState(restaurant));
    });
  }
}
