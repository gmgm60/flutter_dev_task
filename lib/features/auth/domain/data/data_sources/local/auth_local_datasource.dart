import 'package:dartz/dartz.dart';

import '../../../../data/models/user/user_model.dart';

abstract class AuthLocalDatasource {

  Future<Unit> logout();
  Future<Unit> saveUser({required UserModel userModel});

  Future<UserModel?> isLogin();

}
