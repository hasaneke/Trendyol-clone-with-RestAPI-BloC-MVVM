import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:zima_market/features/auth/register/model/register_request_model/register_request_model.dart';
import 'package:zima_market/features/auth/register/service/register_service.dart';
import 'package:zima_market/product/model/errors/service_error.dart';
import 'package:zima_market/product/model/user/user.dart';

part 'register_event.dart';
part 'register_state.dart';

class RegisterBloc extends Bloc<RegisterEvent, RegisterState> {
  IRegisterService registerService;
  RegisterBloc(this.registerService) : super(RegisterInitial()) {
    on<RegisterEvent>((event, emit) async {
      if (event is NavigateToLoginEvent) {
        emit(NavigationToLogin());
      } else if (event is RegisterUserEvent) {
        emit(RegisterLoading());
        final response =
            await _register(RegisterRequestModel(event.email, event.password));
        if (response is User) {
          emit(RegisterSuccess(response));
        } else if (response is ServiceError) {
          emit(RegisterFailed(response));
        }
      }
    });
  }
  Future<dynamic> _register(RegisterRequestModel registerRequestModel) async {
    try {
      return await registerService.register(registerRequestModel);
    } on ServiceError catch (e) {
      return ServiceError(e.message);
    }
  }
}
