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
  "changeLang": "عربى",
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
  "cancel": "Cancel",
  "logout": "Logout",
  "forget_password": "Forget password?",
  "validation": {
    "invalid_password": "Invalid password.",
    "invalid_login_info": "Invalid Login info!",
    "invalid_register_email": "The email has already been taken",
    "password_miss_match": "Passwords do not match!",
    "password_short": "Password is too short!",
    "password_long": "Password is too long!",
    "invalid_email": "Invalid email",
    "invalid_phone": "Invalid phone",
    "required": "This field is required",
    "short": "This {value} is too short!",
    "long": "This {value} is too long!",
    "min_length": {
      "1": "Field can't be less than 1 letter",
      "2": "Field can't be less than 2 letters",
      "else": "Field can't be less than {{{value}} letters"
    },
    "max_length": {
      "1": "Field can't be more than 1 letter",
      "2": "Field can't be mor than 2 letters",
      "else": "Field can't be ore than {{{value}} letters"
    }
  }
};
static const Map<String,dynamic> ar = {
  "changeLang": "English",
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
  "cancel": "تجاهل",
  "logout": "تسجيل خروج",
  "forget_password": "نسيت كلمة المرور؟",
  "validation": {
    "invalid_password": "خطأ بكلمة المرور",
    "invalid_login_info": "بيانات الدخول خاطئة",
    "invalid_register_email": "البريد الإلكتروني مستخدم مسبقاً",
    "password_miss_match": "كلمة المرور ليست متطابقة",
    "password_short": "كلمة المرور قصيرة جداً",
    "password_long": "كلمة المرور كبيرة جداً",
    "invalid_email": "البريد الإلكترونى غير صحيح",
    "invalid_phone": "رقم الهاتف غير صحيح",
    "required": "هذا الحقل مطلوب",
    "short": "{value} قصير للغاية",
    "long": "{value} طويل للغاية",
    "min_length": {
      "1": "الحقل لا يجب أن يكون أقل من حرف",
      "2": "الحقل لا يجب أن يكون أقل من حرفين",
      "else": "الحقل لا يجب أن يكون أقل من {value} حرف"
    },
    "max_length": {
      "1": "الحقل لا يجب أن يكون أكثر من حرف",
      "2": "الحقل لا يجب أن يكون أكثر من حرفين",
      "else": "الحقل لا يجب أن يكون أكثر من {value} حرف"
    }
  }
};
static const Map<String, Map<String,dynamic>> mapLocales = {"en": en, "ar": ar};
}
