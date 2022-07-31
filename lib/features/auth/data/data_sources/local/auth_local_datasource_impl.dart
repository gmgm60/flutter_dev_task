import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';

import '../../../../../core/data/throw_app_exception.dart';
import '../../../domain/data/data_sources/local/auth_local_datasource.dart';
import '../../models/user/user_model.dart';
import 'auth_firebase_local_service.dart';

@Injectable(as: AuthLocalDatasource)
class AuthLocalDatasourceImpl extends AuthLocalDatasource {
  final AuthFirebaseLocalService _authFirebaseLocalService;

  AuthLocalDatasourceImpl(this._authFirebaseLocalService);

  @override
  Future<Unit> logout() async {
    try {
      return await _authFirebaseLocalService.logout();
    } catch (e) {
      throw throwAppException(e);
    }
  }

  @override
  Future<UserModel?> isLogin() async{
    try {
      return await _authFirebaseLocalService.isLogin();
    } catch (e) {
      throw throwAppException(e);
    }
  }
  @override
  Future<Unit> saveUser({required UserModel userModel}) async{
    try {
      return await _authFirebaseLocalService.saveUser(userModel:userModel);
    } catch (e) {
      throw throwAppException(e);
    }
  }
}
