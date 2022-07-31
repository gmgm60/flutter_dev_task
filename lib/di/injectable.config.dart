// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

import 'package:get_it/get_it.dart' as i1;
import 'package:injectable/injectable.dart' as i2;
import 'package:logger/logger.dart' as i9;

import '../features/auth/data/data_sources/local/auth_firebase_local_service.dart'
    as i3;
import '../features/auth/data/data_sources/local/auth_local_datasource_impl.dart'
    as i6;
import '../features/auth/data/data_sources/remote/auth_firebase_service.dart'
    as i4;
import '../features/auth/data/data_sources/remote/auth_remote_datasource_impl.dart'
    as i8;
import '../features/auth/data/repository/auth_repository_impl.dart' as i15;
import '../features/auth/domain/data/data_sources/local/auth_local_datasource.dart'
    as i5;
import '../features/auth/domain/data/data_sources/remote/auth_remote_datasource.dart'
    as i7;
import '../features/auth/domain/data/repository/auth_repository.dart' as i14;
import '../features/auth/domain/use_cases/is_login_use_case.dart' as i16;
import '../features/auth/domain/use_cases/login_use_case.dart' as i17;
import '../features/auth/domain/use_cases/logout_use_case.dart' as i18;
import '../features/auth/domain/use_cases/register_use_case.dart' as i21;
import '../features/auth/presentation/cubit/auth_cubit/auth_cubit.dart' as i22;
import '../features/posts/data/data_sources/local/posts_local_data_source_impl.dart'
    as i20;
import '../features/posts/data/data_sources/local/posts_local_service.dart'
    as i13;
import '../features/posts/data/data_sources/remote/post_firebase_service.dart'
    as i10;
import '../features/posts/data/data_sources/remote/post_remote_data_source_impl.dart'
    as i12;
import '../features/posts/data/repository/post_repository_impl.dart' as i24;
import '../features/posts/domain/data/data_sources/local/posts_local_data_source.dart'
    as i19;
import '../features/posts/domain/data/data_sources/remote/post_remore_data_source.dart'
    as i11;
import '../features/posts/domain/data/repository/post_repository.dart' as i23;
import '../features/posts/domain/use_cases/add_new_post_use_case.dart' as i26;
import '../features/posts/domain/use_cases/get_fav_posts_use_case.dart' as i27;
import '../features/posts/domain/use_cases/get_local_posts_use_case.dart'
    as i28;
import '../features/posts/domain/use_cases/get_posts_use_case.dart' as i29;
import '../features/posts/domain/use_cases/update_post_use_case.dart' as i25;
import '../features/posts/presentation/cubit/posts_cubit.dart' as i30;
import 'module/modules.dart' as i31; // ignore_for_file: unnecessary_lambdas

// ignore_for_file: lines_longer_than_80_chars
/// initializes the registration of provided dependencies inside of [GetIt]
i1.GetIt $initGetIt(i1.GetIt get,
    {String? environment, i2.EnvironmentFilter? environmentFilter}) {
  final gh = i2.GetItHelper(get, environment, environmentFilter);
  final myDioInject = _$MyDioInject();
  gh.factory<i3.AuthFirebaseLocalService>(
      () => i3.AuthFirebaseLocalService());
  gh.factory<i4.AuthFirebaseService>(() => i4.AuthFirebaseService());
  gh.factory<i5.AuthLocalDatasource>(
      () => i6.AuthLocalDatasourceImpl(get<i3.AuthFirebaseLocalService>()));
  gh.factory<i7.AuthRemoteDatasource>(
      () => i8.AuthRemoteDatasourceImpl(get<i4.AuthFirebaseService>()));
  gh.factory<i9.Logger>(() => myDioInject.logger);
  gh.factory<i10.PostFirebaseService>(() => i10.PostFirebaseService());
  gh.factory<i11.PostRemoteDataSource>(
      () => i12.PostRemoteDataSourceImpl(get<i10.PostFirebaseService>()));
  gh.factory<i13.PostsLocalService>(() => i13.PostsLocalService());
  gh.factory<i14.AuthRepository>(() => i15.AuthRepoImpl(get<i9.Logger>(),
      get<i7.AuthRemoteDatasource>(), get<i5.AuthLocalDatasource>()));
  gh.factory<i16.IsLoginUseCase>(
      () => i16.IsLoginUseCase(get<i14.AuthRepository>()));
  gh.factory<i17.LoginUseCase>(
      () => i17.LoginUseCase(get<i14.AuthRepository>()));
  gh.factory<i18.LogoutUseCase>(
      () => i18.LogoutUseCase(get<i14.AuthRepository>()));
  gh.factory<i19.PostsLocalDataSource>(
      () => i20.PostsLocalDataSourceImpl(get<i13.PostsLocalService>()));
  gh.factory<i21.RegisterUseCase>(
      () => i21.RegisterUseCase(get<i14.AuthRepository>()));
  gh.factory<i22.AuthCubit>(() => i22.AuthCubit(
      get<i17.LoginUseCase>(),
      get<i21.RegisterUseCase>(),
      get<i18.LogoutUseCase>(),
      get<i16.IsLoginUseCase>(),
      get<i9.Logger>()));
  gh.factory<i23.PostRepository>(() => i24.PostRepositoryImpl(
      get<i9.Logger>(),
      get<i11.PostRemoteDataSource>(),
      get<i19.PostsLocalDataSource>()));
  gh.factory<i25.UpdatePostUseCase>(
      () => i25.UpdatePostUseCase(get<i23.PostRepository>()));
  gh.factory<i26.AddNewPostUseCase>(
      () => i26.AddNewPostUseCase(get<i23.PostRepository>()));
  gh.factory<i27.GetFavPostsUseCase>(
      () => i27.GetFavPostsUseCase(get<i23.PostRepository>()));
  gh.factory<i28.GetLocalPostsUseCase>(
      () => i28.GetLocalPostsUseCase(get<i23.PostRepository>()));
  gh.factory<i29.GetPostsUseCase>(
      () => i29.GetPostsUseCase(get<i23.PostRepository>()));
  gh.factory<i30.PostsCubit>(() => i30.PostsCubit(
      get<i9.Logger>(),
      get<i29.GetPostsUseCase>(),
      get<i27.GetFavPostsUseCase>(),
      get<i26.AddNewPostUseCase>(),
      get<i25.UpdatePostUseCase>(),
      get<i28.GetLocalPostsUseCase>()));
  return get;
}

class _$MyDioInject extends i31.MyDioInject {}
