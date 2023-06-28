import 'dart:developer';

import 'package:easy_eat_restaurant/data/model/restaurant_model.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

abstract class EasyEatRepository {
  Future<RestaurantModel> getRestaurantDetails();
}

class EasyEatRepositoryImpl implements EasyEatRepository {
  final supabase = Supabase.instance.client;

  @override
  Future<RestaurantModel> getRestaurantDetails() async {
    final data = await supabase
        .from('restaurant')
        .select()
        .eq('id', supabase.auth.currentUser?.id)
        .single();

    RestaurantModel resturant = RestaurantModel.fromJson(data);
    log(data.toString());
    log(resturant.toString());
    return resturant;
  }
}
