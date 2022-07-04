class LoginParam {
  String email;
  String password;

  LoginParam({
    required this.email,
    required this.password,
  });

  @override
  String toString() {
    return 'LoginParam{email: $email, password: $password}';
  }
}
