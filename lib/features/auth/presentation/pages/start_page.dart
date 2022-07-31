import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_dev_task/core/presentation/routes/router.gr.dart';

import '../cubit/auth_cubit/auth_cubit.dart';
import '../cubit/auth_cubit/auth_state.dart';

class StartPage extends StatelessWidget {
  const StartPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AuthCubit, AuthState>(
      builder: (context, state) {
        state.maybeMap(
          init: (init) {
            WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
              context.read<AuthCubit>().isLogin();
            });

            return const Scaffold(
              body: SizedBox(
                child: CircularProgressIndicator(),
              ),
            );
          },
          loading: (loading) {
            return const Scaffold(
              body: SizedBox(
                child: CircularProgressIndicator(),
              ),
            );
          },
          login: (login) {
            WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
              AutoRouter.of(context).navigate(const HomeRoute());
            });
            return const Scaffold(
              body: SizedBox(
                child: Text('login'),
              ),
            );
          },
          orElse: () {
            WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
              AutoRouter.of(context).navigate(LoginRoute());
            });
            return const Scaffold(
              body: SizedBox(
                child: Text('not login'),
              ),
            );
          },
        );
        return const Scaffold(
          body: Text('start'),
        );
      },
    );
  }
}
