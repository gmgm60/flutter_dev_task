import 'package:dartz/dartz.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_dev_task/features/auth/data/data_sources/remote/auth_firebase_service.dart';
import 'package:flutter_dev_task/features/auth/data/models/register/register_model.dart';
import 'package:injectable/injectable.dart';

import '../../../../../core/data/throw_app_exception.dart';
import '../../../domain/data/data_sources/remote/auth_remote_datasource.dart';
import '../../models/login/login_model.dart';
import '../../models/user/user_model.dart';

@Injectable(as: AuthRemoteDatasource)
class AuthRemoteDatasourceImpl extends AuthRemoteDatasource {
  final AuthFirebaseService _authFirebaseService;

  AuthRemoteDatasourceImpl(this._authFirebaseService);

  @override
  Future<UserModel> login({required LoginModel loginModel}) async {
    try {
      return await _authFirebaseService.login(loginModel: loginModel);
    } catch (e) {
      debugPrint(e.toString());
      throw throwAppException(e);
    }
  }


  @override
  Future<UserModel> register({required RegisterModel registerModel}) async {
    try {
      return await _authFirebaseService.register(registerModel: registerModel);
    } catch (e) {
      throw throwAppException(e);
    }
  }
}
