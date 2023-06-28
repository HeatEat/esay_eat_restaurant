import 'dart:developer';

import 'package:flutter/services.dart';
import 'package:image_picker/image_picker.dart';

class ImagePick {
  Future pickImage() async {
    try {
      final image = await ImagePicker().pickImage(source: ImageSource.gallery);

      if (image == null) return;

      return image;
    } on PlatformException catch (e) {
      log('Failed to pick image: $e');
    }
  }
}
