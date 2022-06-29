import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

import '../domain/app_exception/app_exception.dart';

AppException throwAppException(exception) {
  debugPrint(exception.toString());
  if (exception is FirebaseException) {
    return GeneralRemoteAppException.serverError(
        message: exception.message ?? "server Error");
  }
  if (exception is FirebaseAuthException) {
    return GeneralRemoteAppException.unAuth(
        message: exception.message ?? "cant Login");
  }
  return GeneralRemoteAppException.unKnown(message: "unknown error");
}
