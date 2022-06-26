import 'package:dartz/dartz.dart';
import 'package:flutter_dev_task/core/domain/failures/app_failure.dart';
import 'package:flutter_dev_task/features/auth/data/mappers/login_mapper.dart';
import 'package:flutter_dev_task/features/auth/data/mappers/register_mapper.dart';
import 'package:flutter_dev_task/features/auth/data/mappers/user_mapper.dart';
import 'package:flutter_dev_task/features/auth/domain/entities/login_params/login_params.dart';
import 'package:flutter_dev_task/features/auth/domain/entities/user/user.dart';
import 'package:injectable/injectable.dart';
import 'package:logger/logger.dart';

import '../../../../core/data/return_app_failure.dart';
import '../../../../core/domain/app_exception/app_exception.dart';
import '../../domain/data/data_sources/remote/auth_remote_datasource.dart';
import '../../domain/data/repository/auth_repository.dart';
import '../../domain/entities/register_param/register_param.dart';

@Injectable(as: AuthRepository)
class AuthRepoImpl extends AuthRepository {
  final Logger _logger;
  final AuthRemoteDatasource _authRemoteDatasource;

  AuthRepoImpl(this._logger, this._authRemoteDatasource);

  @override
  Future<Either<AppFailure, User>> login(
      {required LoginParam loginParam}) async {
    try {
      final userModel =
          await _authRemoteDatasource.login(loginModel: loginParam.toModel);
      _logger.v(userModel);
      return right(userModel.toEntity);
    } on AppException catch (e) {
      _logger.v(e.toString());
      return left(returnAppFailure(e));
    }
  }

  @override
  Future<Either<AppFailure, User?>> isLogin() async {
    try {
      final userModel = await _authRemoteDatasource.isLogin();
      _logger.v(userModel);
      return right(userModel?.toEntity);
    } on AppException catch (e) {
      _logger.v(e.toString());
      return left(returnAppFailure(e));
    }
  }

  @override
  Future<Either<AppFailure, Unit>> logout() async {
    try {
      final response = await _authRemoteDatasource.logout();
      _logger.v(response);
      return right(unit);
    } on AppException catch (e) {
      _logger.v(e.toString());
      return left(returnAppFailure(e));
    }
  }

  @override
  Future<Either<AppFailure, User>> register(
      {required RegisterParam register}) async {
    try {
      final userModel =
          await _authRemoteDatasource.register(registerModel: register.toModel);
      _logger.v(userModel);
      return right(userModel.toEntity);
    } on AppException catch (e) {
      _logger.v(e.toString());
      return left(returnAppFailure(e));
    }
  }
}
