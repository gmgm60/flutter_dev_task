import 'package:auto_route/auto_route.dart';
import 'package:flutter_dev_task/features/auth/presentation/pages/login_page.dart';
import 'package:flutter_dev_task/features/auth/presentation/pages/profile_page.dart';
import 'package:flutter_dev_task/features/auth/presentation/pages/register_page.dart';
import 'package:flutter_dev_task/features/auth/presentation/pages/start_page.dart';
import 'package:flutter_dev_task/features/posts/presentation/pages/posts_page.dart';

import '../../../features/posts/presentation/pages/fav_posts_page.dart';
import '../pages/home_page.dart';

@MaterialAutoRouter(replaceInRouteName: 'Page,Route', routes: [
  AutoRoute(path: '/', page: StartPage),
  AutoRoute(page: LoginPage, initial: true),
  AutoRoute(page: RegisterPage),
  AutoRoute(page: FavPostsPage),
  AutoRoute(
    page: HomePage,
    children: [
      AutoRoute(page: PostsPage),
      AutoRoute(page: ProfilePage),
    ],
  ),
])
class $AppRouter {}
