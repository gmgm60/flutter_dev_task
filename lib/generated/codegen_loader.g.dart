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
  "registerNewAccount": "Register New Account",
  "uploadImage": "Upload image",
  "addComment": "Add comment about the image",
  "postText": "This text is an example of text that can be replaced in the same space. This text was generated from the text generator",
  "profile": "my account",
  "home": "Home",
  "saved": "Saved",
  "favorites": "Favorite",
  "settings": "Settings",
  "editProfile": "modify my data",
  "publish": "Publish",
  "cancel": "Cancel"
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
  "registerNewAccount": "تسجيل حساب جديد",
  "uploadImage": "رفع صورة",
  "addComment": "أكتب تعليقا حول الصورة",
  "postText": "هذا النص هو مثال لنص يمكن أن يستبدل في نفس المساحة، لقد تم توليد هذا النص من مولد النص",
  "profile": "حسابى",
  "home": "الرئيسية",
  "saved": "المحفوظات",
  "favorites": "المفضلة",
  "settings": "الإعدادات",
  "editProfile": "تعديل بياناتي",
  "publish": "نشر",
  "cancel": "تجاهل"
};
static const Map<String, Map<String,dynamic>> mapLocales = {"en": en, "ar": ar};
}
