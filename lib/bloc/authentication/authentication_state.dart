part of 'authentication_bloc.dart';

abstract class AuthenticationState extends Equatable {
  const AuthenticationState();

  @override
  List<Object> get props => [];
}

class AuthenticationInitial extends AuthenticationState {}

class AuthLoadingState extends AuthenticationState {}

class AuthSuccessState extends AuthenticationState {}

class AuthErrorState extends AuthenticationState {
  final String error;

  const AuthErrorState(this.error);
}

class UnAuthenticatedState extends AuthenticationState {
  const UnAuthenticatedState();
}

class AuthAccountExistState extends AuthenticationState {}

class AuthVerifiState extends AuthenticationState {}

class AuthVerifiSuccessState extends AuthenticationState {}

class AuthVerifiErrorState extends AuthenticationState {}

class AuthEmailNotConfirmedState extends AuthenticationState {}

class AuthInvalidCredentialState extends AuthenticationState {}
