import 'package:flutter_test/flutter_test.dart';
import 'package:zima_market/features/auth/login/models/login_request_model/login_request_model.dart';
import 'package:zima_market/product/model/user/user.dart';
import 'package:zima_market/product/service/auth_service.dart';

void main() {
  late IAuthService authService;
  setUp(() {
    authService = AuthService();
  });
  group("Auth Service Test", () {
    test('Auth Service Test - Login Test', () async {
      final response = await authService.postUserLogin(
          LoginRequestModel(username: "kminchelle", password: "0lelplR"));
      expect(response.runtimeType, User);
    });
  });
}
