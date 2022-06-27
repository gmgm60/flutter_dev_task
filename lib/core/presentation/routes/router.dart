import 'package:auto_route/auto_route.dart';
import 'package:flutter_dev_task/features/auth/presentation/pages/login_page.dart';
import 'package:flutter_dev_task/features/auth/presentation/pages/register_page.dart';
import 'package:flutter_dev_task/features/auth/presentation/pages/start_page.dart';

@MaterialAutoRouter(replaceInRouteName: 'Page,Route', routes: [
  AutoRoute(path: '/', page: StartPage),
  AutoRoute(page: LoginPage,initial: true),
  AutoRoute(page: RegisterPage),
])
class $AppRouter {}
