import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';

import '../../../../core/domain/failures/app_failure.dart';
import '../../../../core/domain/use_case/use_case.dart';
import '../data/repository/auth_repository.dart';

@injectable
class LogoutUseCase extends UseCase<Unit, NoParams> {
  final AuthRepository _repository;

  LogoutUseCase(this._repository);

  @override
  Future<Either<AppFailure, Unit>> call(NoParams params) {
    return _repository.logout();
  }
}
