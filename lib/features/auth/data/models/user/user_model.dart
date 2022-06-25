import 'package:freezed_annotation/freezed_annotation.dart';
part 'user_model.freezed.dart';

@freezed
class UserModel with _$UserModel{
  factory UserModel({
    required String id,
    required String firstName,
    required String lastName,
    required String email,
    String? imageUrl,
}) = _UserModel;
}