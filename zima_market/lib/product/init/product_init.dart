import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:zima_market/product/init/localization_init.dart';
import 'package:zima_market/product/navigator/app_router.dart';

class ProductInit {
  final LocalizationInit localizationInit = LocalizationInit();
  final AppRouter appRouter = AppRouter();
  Future<void> init() async {
    WidgetsFlutterBinding.ensureInitialized();
    await EasyLocalization.ensureInitialized();
  }
}
