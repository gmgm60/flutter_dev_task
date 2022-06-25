import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';

import '../../../../core/domain/failures/app_failure.dart';
import '../../../../core/domain/use_case/use_case.dart';
import '../data/repository/auth_repository.dart';
import '../entities/login_params/login_params.dart';
import '../entities/user/user.dart';

@injectable
class LoginUseCase extends UseCase<User, LoginParam> {
  final AuthRepository _repository;

  LoginUseCase(this._repository);

  @override
  Future<Either<AppFailure, User>> call(LoginParam params) {
    return _repository.login(loginParam: params);
  }
}
