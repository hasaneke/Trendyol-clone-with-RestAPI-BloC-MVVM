import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:zima_market/features/auth/login/models/login_request_model/login_request_model.dart';
import 'package:zima_market/features/auth/login/service/login_service.dart';
import 'package:zima_market/product/model/errors/service_error.dart';
import 'package:zima_market/product/model/user/user.dart';

part 'login_event.dart';
part 'login_state.dart';

class LoginBloc extends Bloc<LoginEvent, LoginState> {
  final ILoginService service;

  LoginBloc({required this.service}) : super(LoginInitial()) {
    on<LoginEvent>((event, emit) async {
      // SIGN IN EVENT
      if (event is SignInEvent) {
        emit(LoginLoadingState());
        //RESPONSE WAİTED
        final response = await _postUserModel(
            LoginRequestModel(username: event.email, password: event.password));
        // RESPONSE SUCCESS
        if (response is User) {
          emit(LoginComplete(response));
        } else if (response is ServiceError) {
          emit(LoginFailedState(response));
        }
        // RESPONSE FAİLED
      }
      // NAVIGATE TO REGISTER
      else if (event is NavigateToRegisterEvent) {
        emit(NavigateToRegiserState());
      }
    });
  }

  Future<dynamic> _postUserModel(LoginRequestModel loginRequestModel) async {
    try {
      return await service.login(loginRequestModel);
    } on ServiceError catch (e) {
      return e;
    }
  }
}
