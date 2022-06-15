import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:zima_market/product/constants/project_colors.dart';
import 'package:zima_market/product/navigator/app_router.dart';
import 'package:zima_market/product/theme/themes.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  MyApp({Key? key}) : super(key: key);
  final _appRouter = AppRouter();
  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(const SystemUiOverlayStyle(
      statusBarColor: null,
    ));
    return MaterialApp.router(
      debugShowCheckedModeBanner: false,
      routerDelegate: _appRouter.delegate(),
      routeInformationParser: _appRouter.defaultRouteParser(),
      title: 'Material App',
      theme: ProjectThemes.lightTheme,
    );
  }
}
