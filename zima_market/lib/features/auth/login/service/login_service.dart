import 'package:zima_market/features/auth/login/models/login_request_model/login_request_model.dart';
import 'package:zima_market/features/auth/login/models/login_response_model/login_response_model.dart';
import 'package:zima_market/product/service/auth_service.dart';

abstract class ILoginService {
  Future<LoginResponseModel?> login(
      {required LoginRequestModel loginRequestModel});
}

class LoginService implements ILoginService {
  final IAuthService authService;
  LoginService(this.authService);
  @override
  Future<LoginResponseModel?> login(
      {required LoginRequestModel loginRequestModel}) async {
    return await authService.postUserLogin(loginRequestModel);
  }
}
