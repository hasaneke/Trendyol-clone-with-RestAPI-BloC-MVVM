import 'package:vexana/vexana.dart';
import 'package:zima_market/features/auth/login/models/login_request_model/login_request_model.dart';
import 'package:zima_market/features/auth/register/model/register_request_model/register_request_model.dart';
import 'package:zima_market/product/model/errors/service_error.dart';
import 'package:zima_market/product/model/user/user.dart';
import 'package:zima_market/product/network/network_manager.dart';

import 'package:zima_market/product/utility/service_paths.dart';

abstract class IAuthService {
  final ProjectNetworkManager networkManager;
  IAuthService(this.networkManager);
  Future<User?> postUserLogin(LoginRequestModel model);
  Future<User?> postUserRegister(RegisterRequestModel model);
}

class AuthService extends IAuthService {
  AuthService._() : super(ProjectNetworkManager.instance);
  static AuthService instance = AuthService._();
  @override
  Future<User?> postUserLogin(LoginRequestModel model) async {
    try {
      final response = await networkManager.service
          .post(ServicePaths.login.path, data: model.toJson());
      final jsonBody = response.data;
      if (jsonBody is Map<String, dynamic>) {
        return User.fromJson(jsonBody);
      }
    } on DioError {
      throw ServiceError("User not found or bad connection");
    }
    return null;
  }

  @override
  Future<User?> postUserRegister(RegisterRequestModel model) async {
    try {
      final response = await networkManager.service
          .post(ServicePaths.register.path, data: model.toJson());
      final jsonBody = response.data;
      if (jsonBody is Map<String, dynamic>) {
        return User.fromJson(jsonBody);
      }
    } on DioError {
      throw ServiceError("User not created");
    }
    return null;
  }
}
