class RegisterParam {
  String firstName;
  String lastName;
  String email;
  String password;
  String passwordConfirmation;

  RegisterParam({
    required this.firstName,
    required this.lastName,
    required this.email,
    required this.password,
    required this.passwordConfirmation,
  });

  @override
  String toString() {
    return 'RegisterParam{firstName: $firstName, lastName: $lastName, email: $email, password: $password, passwordConfirmation: $passwordConfirmation}';
  }
}