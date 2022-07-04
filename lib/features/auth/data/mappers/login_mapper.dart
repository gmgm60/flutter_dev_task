import 'package:flutter/widgets.dart';

import '../../domain/entities/login_params/login_params.dart';
import '../models/login/login_model.dart';

extension LoginMapper on LoginParam {
  LoginModel get toModel {
    debugPrint("from mapper:${toString()}");
   return LoginModel(
      email: email,
      password: password,
    );
  }
}
