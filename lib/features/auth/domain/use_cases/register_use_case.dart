import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';

import '../../../../core/domain/failures/app_failure.dart';
import '../../../../core/domain/use_case/use_case.dart';
import '../data/repository/auth_repository.dart';
import '../entities/register_param/register_param.dart';
import '../entities/user/user.dart';

@injectable
class RegisterUseCase extends UseCase<User, RegisterParam> {
  final AuthRepository _repository;

  RegisterUseCase(this._repository);

  @override
  Future<Either<AppFailure, User>> call(RegisterParam params) {
    return _repository.register(register: params);
  }
}

