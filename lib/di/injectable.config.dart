// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

import 'package:dio/dio.dart' as _i6;
import 'package:get_it/get_it.dart' as _i1;
import 'package:injectable/injectable.dart' as _i2;
import 'package:logger/logger.dart' as _i7;

import '../features/auth/data/data_sources/remote/auth_firebase_service.dart'
    as _i3;
import '../features/auth/data/data_sources/remote/auth_remote_datasource_impl.dart'
    as _i5;
import '../features/auth/data/repository/auth_repository_impl.dart' as _i9;
import '../features/auth/domain/data/data_sources/remote/auth_remote_datasource.dart'
    as _i4;
import '../features/auth/domain/data/repository/auth_repository.dart' as _i8;
import '../features/auth/domain/use_cases/is_login_use_case.dart' as _i10;
import '../features/auth/domain/use_cases/login_use_case.dart' as _i11;
import '../features/auth/domain/use_cases/logout_use_case.dart' as _i12;
import '../features/auth/domain/use_cases/register_use_case.dart' as _i13;
import '../features/auth/presentation/cubit/auth_cubit/auth_cubit.dart' as _i14;
import 'module/dio.dart' as _i15; // ignore_for_file: unnecessary_lambdas

// ignore_for_file: lines_longer_than_80_chars
/// initializes the registration of provided dependencies inside of [GetIt]
_i1.GetIt $initGetIt(_i1.GetIt get,
    {String? environment, _i2.EnvironmentFilter? environmentFilter}) {
  final gh = _i2.GetItHelper(get, environment, environmentFilter);
  final myDioInject = _$MyDioInject();
  gh.factory<_i3.AuthFirebaseService>(() => _i3.AuthFirebaseService());
  gh.factory<_i4.AuthRemoteDatasource>(
      () => _i5.AuthRemoteDatasourceImpl(get<_i3.AuthFirebaseService>()));
  gh.factory<_i6.Dio>(() => myDioInject.dio);
  gh.factory<_i7.Logger>(() => myDioInject.logger);
  gh.factory<_i8.AuthRepository>(() =>
      _i9.AuthRepoImpl(get<_i7.Logger>(), get<_i4.AuthRemoteDatasource>()));
  gh.factory<_i10.IsLoginUseCase>(
      () => _i10.IsLoginUseCase(get<_i8.AuthRepository>()));
  gh.factory<_i11.LoginUseCase>(
      () => _i11.LoginUseCase(get<_i8.AuthRepository>()));
  gh.factory<_i12.LogoutUseCase>(
      () => _i12.LogoutUseCase(get<_i8.AuthRepository>()));
  gh.factory<_i13.RegisterUseCase>(
      () => _i13.RegisterUseCase(get<_i8.AuthRepository>()));
  gh.factory<_i14.AuthCubit>(() => _i14.AuthCubit(
      get<_i11.LoginUseCase>(),
      get<_i13.RegisterUseCase>(),
      get<_i12.LogoutUseCase>(),
      get<_i10.IsLoginUseCase>(),
      get<_i7.Logger>()));
  return get;
}

class _$MyDioInject extends _i15.MyDioInject {}
