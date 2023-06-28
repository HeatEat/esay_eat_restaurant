import 'dart:developer';

import 'package:supabase_flutter/supabase_flutter.dart';

abstract class EasyEatRepository {
  Future getRestaurantDetails();
}

class EasyEatRepositoryImpl implements EasyEatRepository {
  final supabase = Supabase.instance.client;

  @override
  Future getRestaurantDetails() async {
    final data = await supabase
        .from('restaurant')
        .select()
        .eq('id', supabase.auth.currentUser?.id);

    log(data);
  }
}
