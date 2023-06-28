import 'package:flutter/material.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

enum AccountState {
  createdNotVerify,
  createdVerify,
}

enum SignInState {
  success,
  emailNotConfirmed,
  otherError,
  invalidCredentials,
  unauthorize
}

class AuthService {
  final GoTrueClient _auth = Supabase.instance.client.auth;

  AuthService();

  Future<SignInState> signInWithEmail(
      {required String email, required String password}) async {
    try {
      await _auth.signInWithPassword(email: email, password: password);
      if (_auth.currentUser?.userMetadata!["role"] == 4) {
        return SignInState.success;
      } else {
        return SignInState.unauthorize;
      }
    } on AuthException catch (e) {
      if (e.message == 'Email not confirmed') {
        return SignInState.emailNotConfirmed;
      } else if (e.message == 'Invalid login credentials') {
        return SignInState.invalidCredentials;
      }
      return SignInState.otherError;
    } catch (e) {
      throw e.toString();
    }
  }

  Future<AccountState> signUpWithEmail(
      {required String email,
      required String password,
      required String name,
      required String phone,
      required String countryCode}) async {
    try {
      // final response =
      //     await _auth.signUp(email: email, password: password, data: {
      //   'first_name': name,
      //   'last_name': lastName,
      //   'phone': phone,
      //   'country_phone': countryCode,
      //   'role': 1
      // });
      final response = await _auth.signUp(
          email: email,
          password: password,
          data: {
            'restaurant_name': name,
            'phone': phone,
            'country_phone': countryCode,
            'role': 4
          });
      // ignore: unrelated_type_equality_checks
      if (response.session == Null) {
        debugPrint("session is null");
      }
      if (response.user!.identities!.isEmpty) {
        return AccountState.createdVerify;
      } else {
        return AccountState.createdNotVerify;
      }
    } catch (e) {
      throw e.toString();
    }
  }

  Future<void> anounymousSignIn() async {
    try {
      await _auth.signInWithPassword(
          email: 'omar@gmail.com', password: '123456');
    } catch (e) {
      throw e.toString();
    }
  }

  Future<void> signInWithGoogle() async {
    try {
      await _auth.signInWithOAuth(Provider.google);
    } catch (e) {
      throw e.toString();
    }
  }

  Future<void> signOut() async {
    try {
      await _auth.signOut();
    } catch (e) {
      throw e.toString();
    }
  }

  Future<void> otpVerify({required String email, required String token}) async {
    try {
      await _auth.verifyOTP(token: token, type: OtpType.signup, email: email);
    } catch (e) {
      throw e.toString();
    }
  }
}
