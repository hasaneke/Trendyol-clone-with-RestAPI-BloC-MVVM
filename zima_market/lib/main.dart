import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:zima_market/product/constants/project_colors.dart';
import 'package:zima_market/product/init/product_init.dart';
import 'package:zima_market/product/navigator/app_router.dart';
import 'package:zima_market/product/theme/themes.dart';

void main() async {
  final productInit = ProductInit();
  await productInit.init();

  runApp(EasyLocalization(
      supportedLocales: const [Locale('en', 'US'), Locale('tr', 'TR')],
      path: 'assets/translations',
      child: MyApp(
        appRouter: productInit.appRouter,
      )));
}

class MyApp extends StatelessWidget {
  final AppRouter appRouter;
  const MyApp({Key? key, required this.appRouter}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(
        SystemUiOverlayStyle(statusBarColor: ProjectColors.algerianCoral));
    return MaterialApp.router(
      debugShowCheckedModeBanner: false,
      localizationsDelegates: context.localizationDelegates,
      supportedLocales: context.supportedLocales,
      locale: context.locale,
      routerDelegate: appRouter.delegate(),
      routeInformationParser: appRouter.defaultRouteParser(),
      title: 'Material App',
      theme: ProjectThemes.lightTheme,
    );
  }
}
