import 'package:flutter_dev_task/features/auth/data/models/register/register_model.dart';

import '../../domain/entities/register_param/register_param.dart';

extension RegisterMapper on RegisterParam {
  RegisterModel get toModel =>
      RegisterModel(
        firstName: firstName,
        lastName: lastName,
        email: email,
        password: password,
        passwordConfirmation: passwordConfirmation,
      );

}
