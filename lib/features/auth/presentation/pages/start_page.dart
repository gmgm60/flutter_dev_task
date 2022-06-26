import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_dev_task/features/auth/presentation/pages/login_page.dart';
import 'package:flutter_dev_task/features/auth/presentation/pages/register_page.dart';

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
              Navigator.of(context).push(MaterialPageRoute(builder: (context)=>LoginPage()));
            });
            return const Scaffold(
              body: SizedBox(
                child: Text('login'),
              ),
            );
          },
          orElse: () {
            WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
              Navigator.of(context).push(MaterialPageRoute(builder: (context)=>RegisterPage()));
            });
            return const Scaffold(
              body: SizedBox(
                child: Text('not login'),
              ),
            );
          },
        );
        return Scaffold(
          body: Text('start'),
        );
      },
    );
  }
}
