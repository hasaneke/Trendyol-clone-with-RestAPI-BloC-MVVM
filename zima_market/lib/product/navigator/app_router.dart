import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:zima_market/features/login/view/login_view.dart';
import 'package:zima_market/features/register/view/register_view.dart';

part 'app_router.gr.dart';

@MaterialAutoRouter(
  replaceInRouteName: 'View,Route',
  routes: <AutoRoute>[
    AutoRoute(page: LoginView, path: '/login'),
    AutoRoute(page: RegisterView, path: '/register'),
  ],
)
class AppRouter extends _$AppRouter {}
