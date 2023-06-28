import 'dart:io';

import 'package:bloc/bloc.dart';
import 'package:easy_eat_restaurant/utlis/services/image_pick.dart';
import 'package:equatable/equatable.dart';
import 'package:image_picker/image_picker.dart';

part 'image_state.dart';

class ImageCubit extends Cubit<ImageState> {
  ImageCubit() : super(ImageInitial());

  void getAvatarImage() async {
    emit(ImageInitial());
    var img = await ImagePick().pickImage();

    if (img == null) {
      emit(ImageFail());
      return;
    }
    emit(ImagePickSuccess(img));
  }
}
