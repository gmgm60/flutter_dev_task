import 'package:dartz/dartz.dart';
import 'package:flutter_dev_task/features/auth/data/models/register/register_model.dart';

import '../../../../data/models/login/login_model.dart';
import '../../../../data/models/user/user_model.dart';

abstract class AuthRemoteDatasource {
  Future<UserModel> register({required RegisterModel registerModel});

  Future<UserModel> login({required LoginModel loginModel});

  Future<Unit> logout();

  Future<UserModel?> isLogin();
}
