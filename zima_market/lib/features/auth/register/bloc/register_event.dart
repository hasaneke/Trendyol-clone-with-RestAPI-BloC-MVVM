part of 'register_bloc.dart';

abstract class RegisterEvent extends Equatable {
  const RegisterEvent();

  @override
  List<Object> get props => [];
}

class RegisterUserEvent extends RegisterEvent {
  final String email;
  final String password;
  const RegisterUserEvent(this.email, this.password);
}

class NavigateToLoginEvent extends RegisterEvent {}
