import 'package:auto_route/auto_route.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_dev_task/core/constants/colors.dart';
import 'package:flutter_dev_task/core/presentation/widgets/custom_elevated_button.dart';
import 'package:flutter_dev_task/core/presentation/widgets/custom_form_field.dart';
import 'package:flutter_dev_task/features/auth/presentation/cubit/auth_cubit/auth_cubit.dart';
import 'package:flutter_dev_task/generated/locale_keys.g.dart';

import '../validations/validations.dart';

class RegisterPage extends StatelessWidget {
  RegisterPage({Key? key}) : super(key: key);
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      body: SingleChildScrollView(
          child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            Row(mainAxisAlignment: MainAxisAlignment.start, children: [
              IconButton(onPressed: () {
                AutoRouter.of(context).pop();
              }, icon: const Icon(Icons.arrow_back)),
              Expanded(
                  child: Center(
                      child: Text(LocaleKeys.createAccount.tr(),
                          style: Theme.of(context).textTheme.headline6))),
            ]),
            Form(
              key: _formKey,
              child: Column(
                children: [
                  CustomFormField(
                    initValue: context.read<AuthCubit>().registerParam.email,
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
                    initValue: context.read<AuthCubit>().registerParam.password,
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
                  CustomFormField(
                    initValue: context
                        .read<AuthCubit>()
                        .registerParam
                        .passwordConfirmation,
                    textLabel: LocaleKeys.passwordConfirmation,
                    textType: TextInputType.visiblePassword,
                    validation: validatePassword,
                    radius: 10,
                    isPassword: true,
                    showSuffix: true,
                    onChanged: (String? passwordConfirmation) {
                      context
                          .read<AuthCubit>()
                          .registerParam
                          .passwordConfirmation = passwordConfirmation ?? "";
                      debugPrint(context
                          .read<AuthCubit>()
                          .registerParam
                          .passwordConfirmation);
                    },
                  ),
                  CustomFormField(
                    initValue:
                        context.read<AuthCubit>().registerParam.firstName,
                    textLabel: LocaleKeys.firstName,
                    textType: TextInputType.name,
                    validation: validateName,
                    radius: 10,
                    onChanged: (String? firstName) {
                      context.read<AuthCubit>().registerParam.firstName =
                          firstName ?? "";
                      debugPrint(
                          context.read<AuthCubit>().registerParam.firstName);
                    },
                  ),
                  CustomFormField(
                    initValue: context.read<AuthCubit>().registerParam.lastName,
                    textLabel: LocaleKeys.lastName,
                    textType: TextInputType.name,
                    validation: validateName,
                    radius: 10,
                    onChanged: (String? lastName) {
                      context.read<AuthCubit>().registerParam.lastName =
                          lastName ?? "";
                      debugPrint(
                          context.read<AuthCubit>().registerParam.lastName);
                    },
                  ),
                  CustomElevatedButton(
                      radios: 10,
                      onTap: () async {
                        if (_formKey.currentState!.validate()) {
                          await context.read<AuthCubit>().register();
                        }
                      },
                      text: LocaleKeys.createAccount,
                      backGroundColor: buttonBackground,
                      textColor: Colors.white),
                ],
              ),
            ),
          ],
        ),
      )),
    ));
  }
}
