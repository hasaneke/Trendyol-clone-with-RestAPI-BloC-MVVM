import 'package:dio/dio.dart';
import 'package:zima_market/product/config/service_config.dart';

class ProjectNetworkManager {
  late final Dio _service;

  ProjectNetworkManager._() {
    _service = Dio(BaseOptions(baseUrl: ServiceConfig.baseUrl));
  }
  static ProjectNetworkManager instance = ProjectNetworkManager._();

  Dio get service => _service;
}
