part of 'login_bloc.dart';

abstract class LoginState {}

class LoginInitial extends LoginState {}

class LoginComplete extends LoginState {
  final User model;
  LoginComplete(this.model);
}

class LoginFailedState extends LoginState {
  ServiceError error;
  LoginFailedState(this.error);
  @override
  String toString() {
    return error.message;
  }
}

class LoginLoadingState extends LoginState {
  LoginLoadingState();
}

class NavigateToRegiserState extends LoginState {}
