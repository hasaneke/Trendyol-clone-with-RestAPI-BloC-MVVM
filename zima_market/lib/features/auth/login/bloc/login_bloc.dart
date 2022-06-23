import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:zima_market/features/auth/login/models/login_request_model/login_request_model.dart';
import 'package:zima_market/features/auth/login/models/login_response_model/login_response_model.dart';
import 'package:zima_market/features/auth/login/service/login_service.dart';

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
        if (response is LoginResponseModel) {
          emit(LoginComplete(response));
        } else {
          emit(LoginFailedState());
        }
        // RESPONSE FAİLED
      }
      // NAVIGATE TO REGISTER
      else if (event is NavigateToRegisterEvent) {
        emit(NavigateToRegiserState());
      }
    });
  }

  Future<LoginResponseModel?> _postUserModel(
      LoginRequestModel loginRequestModel) async {
    return await service.login(loginRequestModel: loginRequestModel);
  }
}
