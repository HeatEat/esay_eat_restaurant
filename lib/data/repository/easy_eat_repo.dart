import 'dart:developer';
import 'dart:io';

import 'package:easy_eat_restaurant/data/model/restaurant_model.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

abstract class EasyEatRepository {
  Future<RestaurantModel> getRestaurantDetails();
  Future changeRestaurantAvatar({required File file});
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

  @override
  Future changeRestaurantAvatar({required File file}) async {
    final String path = await supabase.storage.from('restaurantAvatars').upload(
          '${supabase.auth.currentUser!.id}/avatar1.png',
          file,
          fileOptions: const FileOptions(cacheControl: '3600', upsert: false),
        );
    final List<Bucket> bucke = await supabase.storage.listBuckets();
    final List<FileObject> objec =
        await supabase.storage.from('restaurantAvatars').list();
    log(objec.toString());
    log(bucke.toString());
  }
}
