import 'dart:async';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_dev_task/features/auth/domain/entities/register_param/register_param.dart';
import 'package:flutter_dev_task/features/auth/domain/use_cases/is_login_use_case.dart';
import 'package:injectable/injectable.dart';
import 'package:logger/logger.dart';

import '../../../../../core/domain/use_case/use_case.dart';
import '../../../domain/entities/login_params/login_params.dart';
import '../../../domain/entities/user/user.dart';
import '../../../domain/use_cases/login_use_case.dart';
import '../../../domain/use_cases/logout_use_case.dart';
import '../../../domain/use_cases/register_use_case.dart';
import 'auth_state.dart';

@Injectable()
class AuthCubit extends Cubit<AuthState> {
  final Logger _logger;
  final LoginUseCase _loginUseCase;
  final LoginParam loginParam = const LoginParam(email: 'gmgm@gm.gm', password: '123456');
  final RegisterUseCase _registerUseCase;
  final RegisterParam registerParam = RegisterParam(
    firstName: 'Mohamed',
    lastName: 'Gamal',
    email: 'gmgm@gm.gm',
    password: '123456',
    passwordConfirmation: '123456',
  );
  final LogoutUseCase _logoutUseCase;
  final IsLoginUseCase _isLoginUseCase;
  User? user;

  AuthCubit(this._loginUseCase, this._registerUseCase, this._logoutUseCase,
      this._isLoginUseCase, this._logger)
      : super(AuthState.init());

  Future<void> isLogin() async {
    emit(AuthState.loading());
    final result = await _isLoginUseCase(NoParams());
    result.fold((error) {
      emit(AuthState.error(error.toString()));
    }, (user) {
      if (user != null) {
        _logger.v("saved user is : $user");
        emit(AuthState.login());
      } else {
        _logger.v("not login");
        emit(AuthState.logout());
      }
    });
  }

  Future<void> logout() async {
    emit(AuthState.loading());
    final result = await _logoutUseCase(NoParams());
    result.fold(
      (error) => emit(AuthState.error(error.toString())),
      (unit) => emit(AuthState.logout()),
    );
  }

  Future<void> login() async {
    _logger.v("cubit login");
    emit(AuthState.loading());
    _logger.v(state);

    final result = await _loginUseCase(loginParam);

    result.fold((failure) {
      _logger.v("failed to Login: ${failure.message}");
      emit(AuthState.error(failure.message));
    }, (user) {
      this.user = user;
      emit(AuthState.login());
    });
  }

  Future<void> register() async {
    _logger.v("cubit start register $state");
    emit(AuthState.loading());
    _logger.v("cubit start $state");

    final result = await _registerUseCase(registerParam);

    result.fold((failure) {
      emit(AuthState.error(failure.message));
    }, (user) {
      this.user = user;
      emit(AuthState.login());
    });
    _logger.v("cubit start $state");
  }
}
