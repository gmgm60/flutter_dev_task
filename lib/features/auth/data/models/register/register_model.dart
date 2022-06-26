class RegisterModel {
  String firstName;
  String lastName;
  String email;
  String password;
  String passwordConfirmation;

  RegisterModel({
    required this.firstName,
    required this.lastName,
    required this.email,
    required this.password,
    required this.passwordConfirmation,
  });
}