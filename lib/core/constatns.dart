import 'package:flutter/material.dart';

class K {
  static const appName = '';
  static const title = 'EasyEat\nRestaurants';
}

class AuthK extends K {
  static const passwordString = 'password';
  static const confirmPasswordString = 'confirmPassword';
  static const nameString = 'name';
  static const emailString = 'email';
  static const phoneNumberString = 'phone';
}

class HomeScreenK extends K {}

class VerificationScreenK extends K {
  static const firstDigitInput = 'firstDigit';
  static const secondDigitInput = 'secondDigit';
  static const thirdDigitInput = 'thirdDigit';
  static const fourthDigitInput = 'fourthDigit';
  static const fifthDigitInput = 'fifthDigit';
  static const sixthDigitInput = 'sixthDigit';

  static const otpInputs = [
    'firstDigit',
    'secondDigit',
    'thirdDigit',
    'fourthDigit',
    'fifthDigit',
    'sixthDigit'
  ];
}

class Ui extends K {
  static const double borderRadius20 = 20.0;
}

InputDecoration customInputDecoration({required String hintString}) {
  return InputDecoration(
    hintText: hintString,
    border: const OutlineInputBorder(
        borderRadius: BorderRadius.all(Radius.circular(Ui.borderRadius20))),
  );
}
