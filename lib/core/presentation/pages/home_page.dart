import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_dev_task/core/presentation/routes/router.gr.dart';
import 'package:flutter_dev_task/core/presentation/widgets/app_drawer.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {

    return AutoTabsRouter.tabBar(
      routes: const [
        PostsRoute(),
        ProfileRoute(),
      ],
      builder:
          (BuildContext context, Widget child, TabController tabController) {
        return Scaffold(
          appBar: AppBar(
            title: Text(tabController.index.toString()),
            bottom: TabBar(controller: tabController, tabs: const [
              Padding(
                padding: EdgeInsets.all(15.0),
                child: Text("الرئيسية"),
              ),
              Padding(
                padding: EdgeInsets.all(15.0),
                child: Text("حسابى"),
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
