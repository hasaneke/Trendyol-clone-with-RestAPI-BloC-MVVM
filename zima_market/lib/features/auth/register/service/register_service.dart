import 'package:zima_market/features/auth/register/model/register_request_model.dart';
import 'package:zima_market/product/model/errors/service_error.dart';
import 'package:zima_market/product/model/user/user.dart';
import 'package:zima_market/product/service/auth_service.dart';

abstract class IRegisterService {
  Future<User?> register(RegisterRequestModel requestModel);
}

class RegisterService implements IRegisterService {
  final IAuthService _authService;
  RegisterService(this._authService);

  @override
  Future<User?> register(RegisterRequestModel requestModel) async {
    try {
      return await _authService.postUserRegister(requestModel);
    } on ServiceError {
      rethrow;
    }
  }
}
