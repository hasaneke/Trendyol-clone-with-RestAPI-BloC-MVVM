import 'package:flutter/material.dart';
import 'package:zima_market/features/login/view/login_view.dart';
import 'package:zima_market/product/theme/themes.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Material App',
      theme: ProjectThemes.lightTheme,
      //darkTheme: ThemeData.dark(),
      home: const LoginView(),
    );
  }
}
