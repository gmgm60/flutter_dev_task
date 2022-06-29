import 'package:auto_route/auto_route.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_dev_task/core/presentation/routes/router.gr.dart';
import 'package:flutter_dev_task/features/auth/presentation/cubit/auth_cubit/auth_cubit.dart';
import 'package:flutter_dev_task/generated/assets.dart';

import '../../../generated/locale_keys.g.dart';

class AppDrawer extends StatelessWidget {
  final bool isHome;
  const AppDrawer({Key? key,this.isHome = false}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final userName = "${context.read<AuthCubit>().user!.firstName} ${context.read<AuthCubit>().user!.lastName}";
    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children:  [
          Container(width: double.infinity,
            color: Colors.blue,
            height: 126,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children:  [
                const  CircleAvatar(foregroundImage: AssetImage(Assets.imagesUser2),radius: 25),
                const SizedBox(height: 10),
                Text(userName),
              ],
            ),
          ),

          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Column(
              children: [
                ListTile(
                  leading: const Icon(
                    Icons.home,
                  ),
                  selected: true,
                  title: Text(
                    LocaleKeys.home.tr(),
                    style: const TextStyle(fontSize: 14),
                  ),
                  onTap: () {
                    AutoRouter.of(context).navigate(const HomeRoute(children: [PostsRoute()]));
                    AutoRouter.of(context).pop();
                  },
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 30,vertical: 3),
                  child: Container(height: 1,color: Colors.black26),
                ),
                ListTile(
                  leading: const Icon(
                    Icons.person,
                  ),
                  selected: true,
                  title: Text(
                    LocaleKeys.profile.tr(),
                    style: const TextStyle(fontSize: 14),
                  ),
                  onTap: () {
                    AutoRouter.of(context).navigate(const HomeRoute(children: [ProfileRoute()]));
                    AutoRouter.of(context).pop();
                  },
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 30,vertical: 3),
                  child: Container(height: 1,color: Colors.black26),
                ),
                ListTile(
                  leading: const Icon(
                    Icons.bookmark,
                  ),
                  selected: true,
                  title: Text(
                    LocaleKeys.saved.tr(),
                    style: const TextStyle(fontSize: 14),
                  ),
                  onTap: () {
                    AutoRouter.of(context).navigate(const FavPostsRoute());
                    AutoRouter.of(context).pop();
                  },
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 30,vertical: 3),
                  child: Container(height: 1,color: Colors.black26),
                ),
                ListTile(
                  leading: const Icon(
                    Icons.logout,
                  ),
                  selected: true,
                  title: Text(
                    LocaleKeys.logout.tr(),
                    style: const TextStyle(fontSize: 14),
                  ),
                  onTap: ()async {
                   await context.read<AuthCubit>().logout();
                    AutoRouter.of(context).popUntilRoot();
                  },
                ),
              ],
            ),
          ),

        ],
      ),
    );
  }
}
