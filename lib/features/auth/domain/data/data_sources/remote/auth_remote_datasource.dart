import 'package:dartz/dartz.dart';

import '../../../../data/models/login/login_model.dart';
import '../../../../data/models/user/user_model.dart';

abstract class AuthRemoteDatasource {
  Future<UserModel> register({required UserModel userModel});

  Future<UserModel> login({required LoginModel loginModel});

  Future<Unit> logout();

  Future<Unit> resetPassword({required String email});
}
