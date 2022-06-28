// **************************************************************************
// AutoRouteGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AutoRouteGenerator
// **************************************************************************
//
// ignore_for_file: type=lint

import 'package:auto_route/auto_route.dart' as _i8;
import 'package:flutter/material.dart' as _i9;

import '../../../features/auth/presentation/pages/login_page.dart' as _i2;
import '../../../features/auth/presentation/pages/profile_page.dart' as _i7;
import '../../../features/auth/presentation/pages/register_page.dart' as _i3;
import '../../../features/auth/presentation/pages/start_page.dart' as _i1;
import '../../../features/posts/presentation/pages/fav_posts_page.dart' as _i4;
import '../../../features/posts/presentation/pages/posts_page.dart' as _i6;
import '../pages/home_page.dart' as _i5;

class AppRouter extends _i8.RootStackRouter {
  AppRouter([_i9.GlobalKey<_i9.NavigatorState>? navigatorKey])
      : super(navigatorKey);

  @override
  final Map<String, _i8.PageFactory> pagesMap = {
    StartRoute.name: (routeData) {
      return _i8.MaterialPageX<dynamic>(
          routeData: routeData, child: const _i1.StartPage());
    },
    LoginRoute.name: (routeData) {
      final args = routeData.argsAs<LoginRouteArgs>(
          orElse: () => const LoginRouteArgs());
      return _i8.MaterialPageX<dynamic>(
          routeData: routeData, child: _i2.LoginPage(key: args.key));
    },
    RegisterRoute.name: (routeData) {
      final args = routeData.argsAs<RegisterRouteArgs>(
          orElse: () => const RegisterRouteArgs());
      return _i8.MaterialPageX<dynamic>(
          routeData: routeData, child: _i3.RegisterPage(key: args.key));
    },
    FavPostsRoute.name: (routeData) {
      return _i8.MaterialPageX<dynamic>(
          routeData: routeData, child: const _i4.FavPostsPage());
    },
    HomeRoute.name: (routeData) {
      return _i8.MaterialPageX<dynamic>(
          routeData: routeData, child: const _i5.HomePage());
    },
    PostsRoute.name: (routeData) {
      return _i8.MaterialPageX<dynamic>(
          routeData: routeData, child: const _i6.PostsPage());
    },
    ProfileRoute.name: (routeData) {
      return _i8.MaterialPageX<dynamic>(
          routeData: routeData, child: const _i7.ProfilePage());
    }
  };

  @override
  List<_i8.RouteConfig> get routes => [
        _i8.RouteConfig(StartRoute.name, path: '/'),
        _i8.RouteConfig(LoginRoute.name, path: '/'),
        _i8.RouteConfig(RegisterRoute.name, path: '/register-page'),
        _i8.RouteConfig(FavPostsRoute.name, path: '/fav-posts-page'),
        _i8.RouteConfig(HomeRoute.name, path: '/home-page', children: [
          _i8.RouteConfig(PostsRoute.name,
              path: 'posts-page', parent: HomeRoute.name),
          _i8.RouteConfig(ProfileRoute.name,
              path: 'profile-page', parent: HomeRoute.name)
        ])
      ];
}

/// generated route for
/// [_i1.StartPage]
class StartRoute extends _i8.PageRouteInfo<void> {
  const StartRoute() : super(StartRoute.name, path: '/');

  static const String name = 'StartRoute';
}

/// generated route for
/// [_i2.LoginPage]
class LoginRoute extends _i8.PageRouteInfo<LoginRouteArgs> {
  LoginRoute({_i9.Key? key})
      : super(LoginRoute.name, path: '/', args: LoginRouteArgs(key: key));

  static const String name = 'LoginRoute';
}

class LoginRouteArgs {
  const LoginRouteArgs({this.key});

  final _i9.Key? key;

  @override
  String toString() {
    return 'LoginRouteArgs{key: $key}';
  }
}

/// generated route for
/// [_i3.RegisterPage]
class RegisterRoute extends _i8.PageRouteInfo<RegisterRouteArgs> {
  RegisterRoute({_i9.Key? key})
      : super(RegisterRoute.name,
            path: '/register-page', args: RegisterRouteArgs(key: key));

  static const String name = 'RegisterRoute';
}

class RegisterRouteArgs {
  const RegisterRouteArgs({this.key});

  final _i9.Key? key;

  @override
  String toString() {
    return 'RegisterRouteArgs{key: $key}';
  }
}

/// generated route for
/// [_i4.FavPostsPage]
class FavPostsRoute extends _i8.PageRouteInfo<void> {
  const FavPostsRoute() : super(FavPostsRoute.name, path: '/fav-posts-page');

  static const String name = 'FavPostsRoute';
}

/// generated route for
/// [_i5.HomePage]
class HomeRoute extends _i8.PageRouteInfo<void> {
  const HomeRoute({List<_i8.PageRouteInfo>? children})
      : super(HomeRoute.name, path: '/home-page', initialChildren: children);

  static const String name = 'HomeRoute';
}

/// generated route for
/// [_i6.PostsPage]
class PostsRoute extends _i8.PageRouteInfo<void> {
  const PostsRoute() : super(PostsRoute.name, path: 'posts-page');

  static const String name = 'PostsRoute';
}

/// generated route for
/// [_i7.ProfilePage]
class ProfileRoute extends _i8.PageRouteInfo<void> {
  const ProfileRoute() : super(ProfileRoute.name, path: 'profile-page');

  static const String name = 'ProfileRoute';
}
