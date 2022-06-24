part of 'register_bloc.dart';

abstract class RegisterState extends Equatable {
  const RegisterState();

  @override
  List<Object> get props => [];
}

class RegisterInitial extends RegisterState {}

class RegisterFailed extends RegisterState {
  final ServiceError error;
  const RegisterFailed(this.error);
}

class RegisterSuccess extends RegisterState {
  final User user;
  const RegisterSuccess(this.user);
}

class RegisterLoading extends RegisterState {}

class NavigationToLogin extends RegisterState {}
