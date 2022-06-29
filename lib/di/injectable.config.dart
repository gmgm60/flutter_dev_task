// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

import 'package:get_it/get_it.dart' as _i1;
import 'package:injectable/injectable.dart' as _i2;
import 'package:logger/logger.dart' as _i9;

import '../features/auth/data/data_sources/local/auth_firebase_local_service.dart'
    as _i3;
import '../features/auth/data/data_sources/local/auth_local_datasource_impl.dart'
    as _i6;
import '../features/auth/data/data_sources/remote/auth_firebase_service.dart'
    as _i4;
import '../features/auth/data/data_sources/remote/auth_remote_datasource_impl.dart'
    as _i8;
import '../features/auth/data/repository/auth_repository_impl.dart' as _i15;
import '../features/auth/domain/data/data_sources/local/auth_local_datasource.dart'
    as _i5;
import '../features/auth/domain/data/data_sources/remote/auth_remote_datasource.dart'
    as _i7;
import '../features/auth/domain/data/repository/auth_repository.dart' as _i14;
import '../features/auth/domain/use_cases/is_login_use_case.dart' as _i16;
import '../features/auth/domain/use_cases/login_use_case.dart' as _i17;
import '../features/auth/domain/use_cases/logout_use_case.dart' as _i18;
import '../features/auth/domain/use_cases/register_use_case.dart' as _i21;
import '../features/auth/presentation/cubit/auth_cubit/auth_cubit.dart' as _i22;
import '../features/posts/data/data_sources/local/posts_local_data_source_impl.dart'
    as _i20;
import '../features/posts/data/data_sources/local/posts_local_service.dart'
    as _i13;
import '../features/posts/data/data_sources/remote/post_firebase_service.dart'
    as _i10;
import '../features/posts/data/data_sources/remote/post_remote_data_source_impl.dart'
    as _i12;
import '../features/posts/data/repository/post_repository_impl.dart' as _i24;
import '../features/posts/domain/data/data_sources/local/posts_local_data_source.dart'
    as _i19;
import '../features/posts/domain/data/data_sources/remote/post_remore_data_source.dart'
    as _i11;
import '../features/posts/domain/data/repository/post_repository.dart' as _i23;
import '../features/posts/domain/use_cases/add_new_post_use_case.dart' as _i26;
import '../features/posts/domain/use_cases/get_fav_posts_use_case.dart' as _i27;
import '../features/posts/domain/use_cases/get_local_posts_use_case.dart'
    as _i28;
import '../features/posts/domain/use_cases/get_posts_use_case.dart' as _i29;
import '../features/posts/domain/use_cases/update_post_use_case.dart' as _i25;
import '../features/posts/presentation/cubit/posts_cubit.dart' as _i30;
import 'module/modules.dart' as _i31; // ignore_for_file: unnecessary_lambdas

// ignore_for_file: lines_longer_than_80_chars
/// initializes the registration of provided dependencies inside of [GetIt]
_i1.GetIt $initGetIt(_i1.GetIt get,
    {String? environment, _i2.EnvironmentFilter? environmentFilter}) {
  final gh = _i2.GetItHelper(get, environment, environmentFilter);
  final myDioInject = _$MyDioInject();
  gh.factory<_i3.AuthFirebaseLocalService>(
      () => _i3.AuthFirebaseLocalService());
  gh.factory<_i4.AuthFirebaseService>(() => _i4.AuthFirebaseService());
  gh.factory<_i5.AuthLocalDatasource>(
      () => _i6.AuthLocalDatasourceImpl(get<_i3.AuthFirebaseLocalService>()));
  gh.factory<_i7.AuthRemoteDatasource>(
      () => _i8.AuthRemoteDatasourceImpl(get<_i4.AuthFirebaseService>()));
  gh.factory<_i9.Logger>(() => myDioInject.logger);
  gh.factory<_i10.PostFirebaseService>(() => _i10.PostFirebaseService());
  gh.factory<_i11.PostRemoteDataSource>(
      () => _i12.PostRemoteDataSourceImpl(get<_i10.PostFirebaseService>()));
  gh.factory<_i13.PostsLocalService>(() => _i13.PostsLocalService());
  gh.factory<_i14.AuthRepository>(() => _i15.AuthRepoImpl(get<_i9.Logger>(),
      get<_i7.AuthRemoteDatasource>(), get<_i5.AuthLocalDatasource>()));
  gh.factory<_i16.IsLoginUseCase>(
      () => _i16.IsLoginUseCase(get<_i14.AuthRepository>()));
  gh.factory<_i17.LoginUseCase>(
      () => _i17.LoginUseCase(get<_i14.AuthRepository>()));
  gh.factory<_i18.LogoutUseCase>(
      () => _i18.LogoutUseCase(get<_i14.AuthRepository>()));
  gh.factory<_i19.PostsLocalDataSource>(
      () => _i20.PostsLocalDataSourceImpl(get<_i13.PostsLocalService>()));
  gh.factory<_i21.RegisterUseCase>(
      () => _i21.RegisterUseCase(get<_i14.AuthRepository>()));
  gh.factory<_i22.AuthCubit>(() => _i22.AuthCubit(
      get<_i17.LoginUseCase>(),
      get<_i21.RegisterUseCase>(),
      get<_i18.LogoutUseCase>(),
      get<_i16.IsLoginUseCase>(),
      get<_i9.Logger>()));
  gh.factory<_i23.PostRepository>(() => _i24.PostRepositoryImpl(
      get<_i9.Logger>(),
      get<_i11.PostRemoteDataSource>(),
      get<_i19.PostsLocalDataSource>()));
  gh.factory<_i25.UpdatePostUseCase>(
      () => _i25.UpdatePostUseCase(get<_i23.PostRepository>()));
  gh.factory<_i26.AddNewPostUseCase>(
      () => _i26.AddNewPostUseCase(get<_i23.PostRepository>()));
  gh.factory<_i27.GetFavPostsUseCase>(
      () => _i27.GetFavPostsUseCase(get<_i23.PostRepository>()));
  gh.factory<_i28.GetLocalPostsUseCase>(
      () => _i28.GetLocalPostsUseCase(get<_i23.PostRepository>()));
  gh.factory<_i29.GetPostsUseCase>(
      () => _i29.GetPostsUseCase(get<_i23.PostRepository>()));
  gh.factory<_i30.PostsCubit>(() => _i30.PostsCubit(
      get<_i9.Logger>(),
      get<_i29.GetPostsUseCase>(),
      get<_i27.GetFavPostsUseCase>(),
      get<_i26.AddNewPostUseCase>(),
      get<_i25.UpdatePostUseCase>(),
      get<_i28.GetLocalPostsUseCase>()));
  return get;
}

class _$MyDioInject extends _i31.MyDioInject {}
