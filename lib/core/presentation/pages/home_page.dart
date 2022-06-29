import 'package:auto_route/auto_route.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_dev_task/core/presentation/routes/router.gr.dart';
import 'package:flutter_dev_task/core/presentation/widgets/app_drawer.dart';
import 'package:flutter_dev_task/generated/locale_keys.g.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final List<String> titles = [
      LocaleKeys.home,
      LocaleKeys.profile,
      LocaleKeys.saved
    ];
    return AutoTabsRouter.tabBar(
      routes: const [
        PostsRoute(),
        ProfileRoute(),
       // FavPostsRoute(),
      ],
      builder:
          (BuildContext context, Widget child, TabController tabController) {
        return Scaffold(
          appBar: AppBar(
            title: Text(titles[tabController.index].tr()),
            bottom:TabBar(
               // indicatorColor: Colors.green,
                controller: tabController, tabs:  [
              Padding(
                padding: const EdgeInsets.all(15.0),
                child: Text(LocaleKeys.home.tr()),
              ),
               Padding(
                padding: const EdgeInsets.all(15.0),
                child: Text(LocaleKeys.profile.tr()),
              ),
            ]),
          ),
          drawer: const AppDrawer(),
          body: child,
        );
      },
    );
  }
}
