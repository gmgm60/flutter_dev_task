// **************************************************************************
// AutoRouteGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AutoRouteGenerator
// **************************************************************************
//
// ignore_for_file: type=lint

import 'package:auto_route/auto_route.dart' as _i4;
import 'package:flutter/material.dart' as _i5;

import '../../../features/auth/presentation/pages/login_page.dart' as _i2;
import '../../../features/auth/presentation/pages/register_page.dart' as _i3;
import '../../../features/auth/presentation/pages/start_page.dart' as _i1;

class AppRouter extends _i4.RootStackRouter {
  AppRouter([_i5.GlobalKey<_i5.NavigatorState>? navigatorKey])
      : super(navigatorKey);

  @override
  final Map<String, _i4.PageFactory> pagesMap = {
    StartRoute.name: (routeData) {
      return _i4.MaterialPageX<dynamic>(
          routeData: routeData, child: const _i1.StartPage());
    },
    LoginRoute.name: (routeData) {
      return _i4.MaterialPageX<dynamic>(
          routeData: routeData, child: const _i2.LoginPage());
    },
    RegisterRoute.name: (routeData) {
      return _i4.MaterialPageX<dynamic>(
          routeData: routeData, child: const _i3.RegisterPage());
    }
  };

  @override
  List<_i4.RouteConfig> get routes => [
        _i4.RouteConfig(StartRoute.name, path: '/'),
        _i4.RouteConfig(LoginRoute.name, path: '/login-page'),
        _i4.RouteConfig(RegisterRoute.name, path: '/register-page')
      ];
}

/// generated route for
/// [_i1.StartPage]
class StartRoute extends _i4.PageRouteInfo<void> {
  const StartRoute() : super(StartRoute.name, path: '/');

  static const String name = 'StartRoute';
}

/// generated route for
/// [_i2.LoginPage]
class LoginRoute extends _i4.PageRouteInfo<void> {
  const LoginRoute() : super(LoginRoute.name, path: '/login-page');

  static const String name = 'LoginRoute';
}

/// generated route for
/// [_i3.RegisterPage]
class RegisterRoute extends _i4.PageRouteInfo<void> {
  const RegisterRoute() : super(RegisterRoute.name, path: '/register-page');

  static const String name = 'RegisterRoute';
}
