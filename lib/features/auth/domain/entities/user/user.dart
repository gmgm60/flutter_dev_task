import 'package:freezed_annotation/freezed_annotation.dart';
part 'user.freezed.dart';

@freezed
class User with _$User{
  factory User({
    required String id,
    required String firstName,
    required String lastName,
    required String email,
    String? imageUrl,
}) = _User;
}