// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

import 'package:dio/dio.dart' as _i6;
import 'package:get_it/get_it.dart' as _i1;
import 'package:injectable/injectable.dart' as _i2;
import 'package:logger/logger.dart' as _i11;

import '../features/auth/data/data_sources/remote/auth_firebase_service.dart'
    as _i3;
import '../features/auth/data/data_sources/remote/auth_remote_datasource_impl.dart'
    as _i5;
import '../features/auth/data/repository/auth_repository_impl.dart' as _i17;
import '../features/auth/domain/data/data_sources/remote/auth_remote_datasource.dart'
    as _i4;
import '../features/auth/domain/data/repository/auth_repository.dart' as _i16;
import '../features/auth/domain/use_cases/is_login_use_case.dart' as _i18;
import '../features/auth/domain/use_cases/login_use_case.dart' as _i19;
import '../features/auth/domain/use_cases/logout_use_case.dart' as _i20;
import '../features/auth/domain/use_cases/register_use_case.dart' as _i21;
import '../features/auth/presentation/cubit/auth_cubit/auth_cubit.dart' as _i22;
import '../features/posts/data/data_sources/remote/post_firebase_service.dart'
    as _i13;
import '../features/posts/data/data_sources/remote/post_remote_data_source_impl.dart'
    as _i12;
import '../features/posts/data/repository/post_repository_impl.dart' as _i14;
import '../features/posts/domain/data/data_sources/remote/post_remore_data_source.dart'
    as _i15;
import '../features/posts/domain/data/repository/post_repository.dart' as _i8;
import '../features/posts/domain/use_cases/add_new_post_use_case.dart' as _i10;
import '../features/posts/domain/use_cases/get_fav_posts_use_case.dart' as _i7;
import '../features/posts/domain/use_cases/get_posts_use_case.dart' as _i9;
import 'module/dio.dart' as _i23; // ignore_for_file: unnecessary_lambdas

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
  gh.factory<_i7.GetFavPostsUseCase>(
      () => _i7.GetFavPostsUseCase(get<_i8.PostRepository>()));
  gh.factory<_i9.GetPostsUseCase>(
      () => _i9.GetPostsUseCase(get<_i8.PostRepository>()));
  gh.factory<_i10.GetPostsUseCase>(
      () => _i10.GetPostsUseCase(get<_i8.PostRepository>()));
  gh.factory<_i11.Logger>(() => myDioInject.logger);
  gh.factory<_i12.PostRemoteDataSourceImpl>(
      () => _i12.PostRemoteDataSourceImpl(get<_i13.PostFirebaseService>()));
  gh.factory<_i14.PostRepositoryImpl>(() => _i14.PostRepositoryImpl(
      get<_i11.Logger>(), get<_i15.PostRemoteDataSource>()));
  gh.factory<_i16.AuthRepository>(() =>
      _i17.AuthRepoImpl(get<_i11.Logger>(), get<_i4.AuthRemoteDatasource>()));
  gh.factory<_i18.IsLoginUseCase>(
      () => _i18.IsLoginUseCase(get<_i16.AuthRepository>()));
  gh.factory<_i19.LoginUseCase>(
      () => _i19.LoginUseCase(get<_i16.AuthRepository>()));
  gh.factory<_i20.LogoutUseCase>(
      () => _i20.LogoutUseCase(get<_i16.AuthRepository>()));
  gh.factory<_i21.RegisterUseCase>(
      () => _i21.RegisterUseCase(get<_i16.AuthRepository>()));
  gh.factory<_i22.AuthCubit>(() => _i22.AuthCubit(
      get<_i19.LoginUseCase>(),
      get<_i21.RegisterUseCase>(),
      get<_i20.LogoutUseCase>(),
      get<_i18.IsLoginUseCase>(),
      get<_i11.Logger>()));
  return get;
}

class _$MyDioInject extends _i23.MyDioInject {}
