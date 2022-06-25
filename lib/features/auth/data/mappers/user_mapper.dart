import 'package:flutter_dev_task/features/auth/data/models/user/user_model.dart';
import 'package:flutter_dev_task/features/auth/domain/entities/user/user.dart';

extension ToModel on User {
  UserModel get toModel => UserModel(
        id: id,
        firstName: firstName,
        lastName: lastName,
        email: email,
      );
}

extension ToEntity on UserModel {
  User get toEntity => User(
        id: id,
        firstName: firstName,
        lastName: lastName,
        email: email,
      );
}
