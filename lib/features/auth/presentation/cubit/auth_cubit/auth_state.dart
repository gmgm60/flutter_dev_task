import 'package:freezed_annotation/freezed_annotation.dart';
part 'auth_state.freezed.dart';

@Freezed()
class AuthState with _$AuthState {
  factory AuthState.init() = Init;
  factory AuthState.loading() = Loading;
  factory AuthState.login() = Done;
  factory AuthState.logout() = Logout;
  factory AuthState.error(String error) = Error;
}