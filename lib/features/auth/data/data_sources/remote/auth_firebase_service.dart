import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dartz/dartz.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_dev_task/features/auth/data/models/login/login_model.dart';
import 'package:flutter_dev_task/features/auth/data/models/register/register_model.dart';
import 'package:flutter_dev_task/features/auth/data/models/user/user_model.dart';
import 'package:injectable/injectable.dart';

@injectable
class AuthFirebaseService {
  Future<UserModel> login({required LoginModel loginModel}) async {
    UserCredential userCredential =
        await FirebaseAuth.instance.signInWithEmailAndPassword(
      email: loginModel.email,
      password: loginModel.password,
    );
    final uid = userCredential.user!.uid;
    final data =
        await FirebaseFirestore.instance.collection('users').doc(uid).get();
    final UserModel userModel = UserModel.fromJson(data.data()!);
    return userModel;
  }

  Future<UserModel> register({required RegisterModel registerModel}) async {
    UserCredential userCredential =
        await FirebaseAuth.instance.createUserWithEmailAndPassword(
      email: registerModel.email,
      password: registerModel.password,
    );

    final uid = userCredential.user!.uid;
    final UserModel userModel = UserModel(
      id: uid,
      firstName: registerModel.firstName,
      lastName: registerModel.lastName,
      email: registerModel.email,
    );
    await FirebaseFirestore.instance
        .collection('users')
        .doc(uid)
        .set(userModel.toJson());

    return userModel;
  }

  Future<Unit> logout() async {
    await FirebaseAuth.instance.signOut();
    return unit;
  }

  Future<UserModel?> isLogin() async {
    final firebaseUser = FirebaseAuth.instance.currentUser;
    if (firebaseUser != null) {
      //TODO
    }
    return null;

  }
}
