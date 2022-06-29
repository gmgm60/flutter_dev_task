import 'dart:convert';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dartz/dartz.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_dev_task/features/auth/data/models/login/login_model.dart';
import 'package:flutter_dev_task/features/auth/data/models/register/register_model.dart';
import 'package:flutter_dev_task/features/auth/data/models/user/user_model.dart';
import 'package:injectable/injectable.dart';
import 'package:shared_preferences/shared_preferences.dart';

@injectable
class AuthFirebaseLocalService {
  Future<Unit> logout() async {
    await FirebaseAuth.instance.signOut();
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.remove('user');
    return unit;
  }

  Future<UserModel?> isLogin() async {
    final firebaseUser = FirebaseAuth.instance.currentUser;
    if (firebaseUser != null) {
      SharedPreferences prefs = await SharedPreferences.getInstance();
      String userPref = prefs.getString('user')!;
      Map<String, dynamic> userMap =
          jsonDecode(userPref) as Map<String, dynamic>;
      return UserModel.fromJson(userMap);
    }
    return null;
  }

  Future<Unit> saveUser({required UserModel userModel}) async {
      SharedPreferences prefs = await SharedPreferences.getInstance();
      await prefs.setString('user', jsonEncode(userModel.toJson()));
      return unit;

  }
}
