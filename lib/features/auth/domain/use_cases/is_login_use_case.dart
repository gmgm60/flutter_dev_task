import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';

import '../../../../core/domain/failures/app_failure.dart';
import '../../../../core/domain/use_case/use_case.dart';
import '../data/repository/auth_repository.dart';
import '../entities/user/user.dart';

@injectable
class IsLoginUseCase extends UseCase<User?, NoParams> {
  final AuthRepository _repository;

  IsLoginUseCase(this._repository);

  @override
  Future<Either<AppFailure, User?>> call(NoParams params) {
    return _repository.isLogin();
  }
}