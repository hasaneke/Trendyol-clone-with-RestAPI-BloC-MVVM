import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:zima_market/features/auth/login/view/login_view.dart';
import 'package:zima_market/features/auth/register/view/register_view.dart';

import 'package:zima_market/features/splash/splash_view/splash_view.dart';

part 'app_router.gr.dart';

@MaterialAutoRouter(
  replaceInRouteName: 'View,Route',
  routes: <AutoRoute>[
    AutoRoute(page: SplashView, path: '/splash', initial: true),
    AutoRoute(
      page: LoginView,
      path: '/login',
    ),
    AutoRoute(page: RegisterView, path: '/register'),
  ],
)
class AppRouter extends _$AppRouter {}
