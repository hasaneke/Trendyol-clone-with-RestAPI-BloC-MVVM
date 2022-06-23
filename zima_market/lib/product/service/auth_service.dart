import 'package:zima_market/features/auth/login/models/login_request_model/login_request_model.dart';
import 'package:zima_market/features/auth/login/models/login_response_model/login_response_model.dart';
import 'package:zima_market/product/network/network_manager.dart';

import 'package:zima_market/product/utility/service_paths.dart';

abstract class IAuthService {
  final ProjectNetworkManager networkManager;
  IAuthService(this.networkManager);
  Future<LoginResponseModel?> postUserLogin(LoginRequestModel model);
  Future<LoginResponseModel?> createUser(LoginRequestModel model);
}

class AuthService extends IAuthService {
  AuthService._() : super(ProjectNetworkManager.instance);
  static AuthService instance = AuthService._();
  @override
  Future<LoginResponseModel?> postUserLogin(LoginRequestModel model) async {
    try {
      final response = await networkManager.service
          .post(ServicePaths.login.path, data: model.toJson());
      if (response.statusCode == 200) {
        final jsonBody = response.data;
        if (jsonBody is Map<String, dynamic>) {
          return LoginResponseModel.fromJson(jsonBody);
        }
      } else {
        return null;
      }
    } catch (e) {
      return null;
    }

    return null;
  }

  @override
  Future<LoginResponseModel?> createUser(LoginRequestModel model) {
    // TODO: implement createUser
    throw UnimplementedError();
  }
}
