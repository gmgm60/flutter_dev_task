import 'package:auto_route/auto_route.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_dev_task/core/constants/colors.dart';
import 'package:flutter_dev_task/core/presentation/routes/router.gr.dart';
import 'package:flutter_dev_task/core/presentation/widgets/custom_elevated_button.dart';
import 'package:flutter_dev_task/core/presentation/widgets/custom_form_field.dart';
import 'package:flutter_dev_task/core/presentation/widgets/or_divider.dart';
import 'package:flutter_dev_task/features/auth/presentation/cubit/auth_cubit/auth_cubit.dart';
import 'package:flutter_dev_task/generated/locale_keys.g.dart';

import '../validations/validations.dart';

class LoginPage extends StatelessWidget {
  LoginPage({Key? key}) : super(key: key);
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    debugPrint(context.read<AuthCubit>().user?.toString() ?? "null");
    return SafeArea(
        child: Scaffold(
          body: SingleChildScrollView(
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(25.0),
                      child: Center(
                          child: Text(LocaleKeys.login.tr(),
                              style: Theme.of(context).textTheme.headline6)),
                    ),
                    Form(
                      key: _formKey,
                      child: Column(
                        children: [
                          CustomFormField(
                            initValue: context.read<AuthCubit>().loginParam.email,
                            textLabel: LocaleKeys.email,
                            textType: TextInputType.emailAddress,
                            validation: validateEmailAddress,
                            radius: 10,
                            onChanged: (String? email) {
                              context.read<AuthCubit>().registerParam.email =
                                  email ?? "";
                              debugPrint(context.read<AuthCubit>().registerParam.email);
                            },
                          ),
                          CustomFormField(
                            initValue: context.read<AuthCubit>().loginParam.password,
                            textLabel: LocaleKeys.password,
                            textType: TextInputType.visiblePassword,
                            validation: validatePassword,
                            radius: 10,
                            isPassword: true,
                            showSuffix: true,
                            onChanged: (String? password) {
                              context.read<AuthCubit>().registerParam.password =
                                  password ?? "";
                              debugPrint(
                                  context.read<AuthCubit>().registerParam.password);
                            },
                          ),
                          CustomElevatedButton(
                              radios: 10,
                              onTap: () async {
                                if (_formKey.currentState!.validate()) {
                                  await context.read<AuthCubit>().login();
                                }
                              },
                              text: LocaleKeys.login,
                              backGroundColor: buttonBackground,
                              textColor: Colors.white),
                        ],
                      ),
                    ),
                    const OrDivider(),
                    const SizedBox(height: 30),
                    Text(LocaleKeys.ifYouDontHaveAnAccountRegisterNow.tr()),

                    CustomElevatedButton(
                        radios: 10,
                        onTap: () async {
                          AutoRouter.of(context).navigate(RegisterRoute());
                        },
                        text: LocaleKeys.registerNewAccount,
                        backGroundColor: mainBackground,
                        textColor: Colors.deepOrange),
                  ],
                ),
              )),
        ));
  }
}

