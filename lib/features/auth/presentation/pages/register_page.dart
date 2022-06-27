import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_dev_task/core/presentation/widgets/custom_form_field.dart';
import 'package:flutter_dev_task/generated/locale_keys.g.dart';

import '../validations/validations.dart';

class RegisterPage extends StatelessWidget {
  const RegisterPage({Key? key}) : super(key: key);

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
              IconButton(onPressed: () {}, icon: const Icon(Icons.arrow_back)),
              Expanded(
                  child: Center(
                      child: Text(LocaleKeys.createAccount.tr(),
                          style: Theme.of(context).textTheme.headline6))),
            ]),
            CustomFormField(
              textLabel: LocaleKeys.email,
              textType: TextInputType.emailAddress,
              validation: validateEmailAddress,
              radius: 10,
            ),
          ],
        ),
      )),
    ));
  }
}
