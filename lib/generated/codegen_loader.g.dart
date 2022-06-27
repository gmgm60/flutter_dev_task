// DO NOT EDIT. This is code generated via package:easy_localization/generate.dart

// ignore_for_file: prefer_single_quotes

import 'dart:ui';

import 'package:easy_localization/easy_localization.dart' show AssetLoader;

class CodegenLoader extends AssetLoader{
  const CodegenLoader();

  @override
  Future<Map<String, dynamic>> load(String fullPath, Locale locale ) {
    return Future.value(mapLocales[locale.toString()]);
  }

  static const Map<String,dynamic> en = {
  "createAccount": "Create Account",
  "email": "Email",
  "password": "Password",
  "passwordConfirmation": "Password Confirmation",
  "firstName": "First Name",
  "lastName": "Last Name",
  "login": "login",
  "forgetPassword": "Forget Password?",
  "or": "Or",
  "ifYouDontHaveAnAccountRegisterNow": "if you don't have an account register now",
  "registerNewAccount": "Register New Account"
};
static const Map<String,dynamic> ar = {
  "createAccount": "إنشاء حساب",
  "email": "البريد الالكترونى",
  "password": "كلمة المرور",
  "passwordConfirmation": "تأكيد كلمة المرور",
  "firstName": "الاسم الأول",
  "lastName": "الاسم الأخير",
  "login": "تسجيل دخول",
  "forgetPassword": "هل نسيت كلمة السر؟",
  "or": "أو",
  "ifYouDontHaveAnAccountRegisterNow": "إذا لم يكن لديك حسام قم بالتسجيل",
  "registerNewAccount": "تسجيل حساب جديد"
};
static const Map<String, Map<String,dynamic>> mapLocales = {"en": en, "ar": ar};
}
