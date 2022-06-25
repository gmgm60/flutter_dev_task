import 'package:dartz/dartz.dart';

import '../../../../../core/domain/failures/app_failure.dart';
import '../../entities/login_params/login_params.dart';
import '../../entities/user/user.dart';

abstract class AuthRepository {
  Future<Either<AppFailure, User>> login({required LoginParam loginParam});

  Future<Either<AppFailure, User>> register({required User user});

  Future<Either<AppFailure, Unit>> logout();
}
