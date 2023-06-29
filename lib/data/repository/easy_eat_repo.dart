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
    return resturant;
  }

  @override
  Future changeRestaurantAvatar({required File file}) async {
    //check if restuarant has Avatar
    final hasAvatar = await supabase.storage
        .from("restaurantAvatars")
        .list(path: supabase.auth.currentUser!.id);

    if (hasAvatar.isEmpty) {
      await supabase.storage.from('restaurantAvatars').upload(
            '${supabase.auth.currentUser!.id}/avatar1.png',
            file,
            fileOptions: const FileOptions(cacheControl: '3600', upsert: false),
          );

      //try to get url
      try {
        // ignore: await_only_futures
        final String publicUrl = await supabase.storage
            .from('restaurantAvatars/${supabase.auth.currentUser!.id}')
            .getPublicUrl('avatar1.png');
        //update restaurant avatar_url
        final data = await supabase
            .from('restaurant')
            .update({"avatar_url": publicUrl})
            .eq('id', supabase.auth.currentUser?.id)
            .select()
            .single();
        RestaurantModel resturant = RestaurantModel.fromJson(data);
        return resturant;
      } catch (e) {
        rethrow;
      }
    } else {
      await supabase.storage.from('restaurantAvatars').update(
            '${supabase.auth.currentUser!.id}/avatar1.png',
            file,
            fileOptions: const FileOptions(cacheControl: '3600', upsert: false),
          );
      final data = await supabase
          .from('restaurant')
          .select()
          .eq('id', supabase.auth.currentUser?.id)
          .single();
      RestaurantModel resturant = RestaurantModel.fromJson(data);
      return resturant;
    }
  }
}
