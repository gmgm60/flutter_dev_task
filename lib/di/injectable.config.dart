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
import '../features/auth/data/repository/auth_repository_impl.dart' as _i16;
import '../features/auth/domain/data/data_sources/remote/auth_remote_datasource.dart'
    as _i4;
import '../features/auth/domain/data/repository/auth_repository.dart' as _i15;
import '../features/auth/domain/use_cases/is_login_use_case.dart' as _i19;
import '../features/auth/domain/use_cases/login_use_case.dart' as _i20;
import '../features/auth/domain/use_cases/logout_use_case.dart' as _i21;
import '../features/auth/domain/use_cases/register_use_case.dart' as _i23;
import '../features/auth/presentation/cubit/auth_cubit/auth_cubit.dart' as _i24;
import '../features/posts/data/data_sources/remote/post_firebase_service.dart'
    as _i8;
import '../features/posts/data/data_sources/remote/post_remote_data_source_impl.dart'
    as _i10;
import '../features/posts/data/repository/post_repository_impl.dart' as _i12;
import '../features/posts/domain/data/data_sources/remote/post_remore_data_source.dart'
    as _i9;
import '../features/posts/domain/data/repository/post_repository.dart' as _i11;
import '../features/posts/domain/use_cases/add_new_post_use_case.dart' as _i14;
import '../features/posts/domain/use_cases/get_fav_posts_use_case.dart' as _i17;
import '../features/posts/domain/use_cases/get_posts_use_case.dart' as _i18;
import '../features/posts/domain/use_cases/update_post_use_case.dart' as _i13;
import '../features/posts/presentation/cubit/posts_cubit.dart' as _i22;
import 'module/dio.dart' as _i25; // ignore_for_file: unnecessary_lambdas

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
  gh.factory<_i8.PostFirebaseService>(() => _i8.PostFirebaseService());
  gh.factory<_i9.PostRemoteDataSource>(
      () => _i10.PostRemoteDataSourceImpl(get<_i8.PostFirebaseService>()));
  gh.factory<_i11.PostRepository>(() => _i12.PostRepositoryImpl(
      get<_i7.Logger>(), get<_i9.PostRemoteDataSource>()));
  gh.factory<_i13.UpdatePostUseCase>(
      () => _i13.UpdatePostUseCase(get<_i11.PostRepository>()));
  gh.factory<_i14.AddNewPostUseCase>(
      () => _i14.AddNewPostUseCase(get<_i11.PostRepository>()));
  gh.factory<_i15.AuthRepository>(() =>
      _i16.AuthRepoImpl(get<_i7.Logger>(), get<_i4.AuthRemoteDatasource>()));
  gh.factory<_i17.GetFavPostsUseCase>(
      () => _i17.GetFavPostsUseCase(get<_i11.PostRepository>()));
  gh.factory<_i18.GetPostsUseCase>(
      () => _i18.GetPostsUseCase(get<_i11.PostRepository>()));
  gh.factory<_i19.IsLoginUseCase>(
      () => _i19.IsLoginUseCase(get<_i15.AuthRepository>()));
  gh.factory<_i20.LoginUseCase>(
      () => _i20.LoginUseCase(get<_i15.AuthRepository>()));
  gh.factory<_i21.LogoutUseCase>(
      () => _i21.LogoutUseCase(get<_i15.AuthRepository>()));
  gh.factory<_i22.PostsCubit>(() => _i22.PostsCubit(
      get<_i7.Logger>(),
      get<_i18.GetPostsUseCase>(),
      get<_i17.GetFavPostsUseCase>(),
      get<_i14.AddNewPostUseCase>(),
      get<_i13.UpdatePostUseCase>()));
  gh.factory<_i23.RegisterUseCase>(
      () => _i23.RegisterUseCase(get<_i15.AuthRepository>()));
  gh.factory<_i24.AuthCubit>(() => _i24.AuthCubit(
      get<_i20.LoginUseCase>(),
      get<_i23.RegisterUseCase>(),
      get<_i21.LogoutUseCase>(),
      get<_i19.IsLoginUseCase>(),
      get<_i7.Logger>()));
  return get;
}

class _$MyDioInject extends _i25.MyDioInject {}
