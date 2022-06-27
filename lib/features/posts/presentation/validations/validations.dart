import '../../../../generated/locale_keys.g.dart';

String? validateEmailAddress(String? input) {
  const emailRegex =
      r"""^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+""";
  if (input != null && RegExp(emailRegex).hasMatch(input)) {
    return null;
  } else {
    return 'LocaleKeys.validation_invalid_email.tr()';
  }
}

String? validatePassword(String? input) {
  if (input != null && input.length >= 6) {
    return null;
  } else {
    return "LocaleKeys.validation_max_length_else.tr(namedArgs: {'value':'6'})";
  }
}

String? validatePasswordConfirmation(String? password, String? confirmation) {
  if (password == confirmation) {
    return null;
  } else {
    return "LocaleKeys.validation_password_miss_match.tr()";
  }
}

String? validateName (String? input){

  if(input != null && input.length > 3){
    return null;
  } else {

    return "LocaleKeys.validation_min_length_else.tr(namedArgs: {'value':'6'})";
  }
}