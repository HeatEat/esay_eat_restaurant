import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

import '../../utlis/services/auth_service.dart';

part 'authentication_event.dart';
part 'authentication_state.dart';

class AuthenticationBloc
    extends Bloc<AuthenticationEvent, AuthenticationState> {
  final AuthService _authservice = AuthService();

  AuthenticationBloc() : super(AuthenticationInitial()) {
    on<EmailSignInAuthEvent>((event, emit) async {
      emit(AuthLoadingState());
      try {
        final response = await _authservice.signInWithEmail(
            email: event.email, password: event.password);

        if (response == SignInState.success) {
          emit(AuthSuccessState());
        } else if (response == SignInState.emailNotConfirmed) {
          emit(AuthEmailNotConfirmedState());
        } else if (response == SignInState.invalidCredentials) {
          emit(AuthInvalidCredentialState());
        } else {
          (emit(const AuthErrorState("Sign in problem")));
        }
      } catch (e) {
        emit(AuthErrorState(e.toString()));
      }
    });

    on<EmailSignUpAuthEvent>((event, emit) async {
      emit(AuthLoadingState());

      try {
        final accountState = await _authservice.signUpWithEmail(
            email: event.email,
            password: event.password,
            countryCode: event.countryCode,
            phone: event.phone,
            name: event.name,
            lastName: event.lastName);
        if (accountState == AccountState.createdNotVerify) {
          emit(AuthVerifiState());
        } else if (accountState == AccountState.createdVerify) {
          emit(AuthAccountExistState());
        }
      } catch (e) {
        emit(AuthErrorState(e.toString()));
      }
    });

    on<SignOutEvent>((event, emit) async {
      emit(AuthLoadingState());
      try {
        await _authservice.signOut();
        emit(const UnAuthenticatedState());
      } catch (e) {
        emit(AuthErrorState(e.toString()));
      }
    });

    on<VerificationAuthEvent>(
      (event, emit) {
        emit(AuthVerifiState());
      },
    );

    on<VerifiAccountEvent>((event, emit) async {
      try {
        await _authservice.otpVerify(email: event.email, token: event.token);

        emit(AuthVerifiSuccessState());
      } catch (e) {
        emit(AuthVerifiErrorState());
      }

      // emit(AuthVerifiSuccessState());
    });
  }
}
