import 'package:auto_route/auto_route.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_dev_task/core/presentation/theme.dart';
import 'package:flutter_dev_task/di/injectable.dart';
import 'package:flutter_dev_task/features/auth/presentation/cubit/auth_cubit/auth_cubit.dart';
import 'package:flutter_dev_task/features/posts/presentation/cubit/posts_cubit.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'core/presentation/routes/router.gr.dart';
import 'firebase_options.dart';
import 'generated/codegen_loader.g.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
 await configureInjection();
 SharedPreferences preferences = await SharedPreferences.getInstance();
 String locale = preferences.getString('locale') ?? "ar";
  runApp( MyApp(locale: locale));
}


class MyApp extends StatefulWidget {
  final String locale;
  const MyApp({Key? key, required this.locale}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  final appRouter = AppRouter();
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (context) => getIt<AuthCubit>()),
        BlocProvider(create: (context) => getIt<PostsCubit>()),
      ],
      child: EasyLocalization(
        supportedLocales: const [Locale('en'), Locale('ar')],
        startLocale: Locale(widget.locale),
        path: 'assets/translations',
        fallbackLocale: const Locale('en'),
        assetLoader: const CodegenLoader(),
        child: Builder(
          builder: (context) {
            return MaterialApp.router(
              routerDelegate: AutoRouterDelegate(appRouter),
              routeInformationParser: appRouter.defaultRouteParser(),
              locale: context.locale,
              supportedLocales: context.supportedLocales,
              localizationsDelegates: context.localizationDelegates,
              title: 'Flutter Dev Task',
              theme: lightTheme,
             // home: const StartPage(),
            );
          }
        ),
      ),
    );
  }
}
