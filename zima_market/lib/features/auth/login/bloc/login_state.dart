part of 'login_bloc.dart';

abstract class LoginState {}

class LoginInitial extends LoginState {}

class LoginComplete extends LoginState {
  final LoginResponseModel model;
  LoginComplete(this.model);
}

class LoginFailedState extends LoginState {}

class LoginLoadingState extends LoginState {
  LoginLoadingState();
}

class NavigateToRegiserState extends LoginState {}
