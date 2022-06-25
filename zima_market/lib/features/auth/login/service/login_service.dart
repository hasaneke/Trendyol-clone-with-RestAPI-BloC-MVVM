import 'package:zima_market/features/auth/login/models/login_request_model/login_request_model.dart';
import 'package:zima_market/product/model/errors/service_error.dart';
import 'package:zima_market/product/model/user/user.dart';
import 'package:zima_market/product/service/auth_service.dart';

abstract class ILoginService {
  final IAuthService authService;
  ILoginService(this.authService);
  Future<User?> login(LoginRequestModel loginRequestModel);
}

class LoginService extends ILoginService {
  LoginService() : super(AuthService.instance);

  @override
  Future<User?> login(LoginRequestModel loginRequestModel) async {
    try {
      return await authService.postUserLogin(loginRequestModel);
    } on ServiceError {
      rethrow;
    }
  }
}
