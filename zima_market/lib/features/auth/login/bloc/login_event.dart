part of 'login_bloc.dart';

abstract class LoginEvent extends Equatable {
  const LoginEvent();

  @override
  List<Object> get props => [];
}

class SignInEvent extends LoginEvent {
  final String email;
  final String password;

  const SignInEvent({required this.email, required this.password});
}

class NavigateToRegisterEvent extends LoginEvent {}
