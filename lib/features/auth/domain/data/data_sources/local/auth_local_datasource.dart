import 'package:dartz/dartz.dart';
import 'package:flutter_dev_task/features/auth/data/models/register/register_model.dart';

import '../../../../data/models/login/login_model.dart';
import '../../../../data/models/user/user_model.dart';

abstract class AuthLocalDatasource {

  Future<Unit> logout();
  Future<Unit> saveUser({required UserModel userModel});

  Future<UserModel?> isLogin();

}
