import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_dev_task/features/auth/data/models/login/login_model.dart';
import 'package:flutter_dev_task/features/auth/data/models/user/user_model.dart';

class AuthFirebaseService {
  Future<UserModel> login({required LoginModel loginModel}) async {
    UserCredential userCredential = await FirebaseAuth.instance
        .signInWithEmailAndPassword(
      email: loginModel.email,
      password: loginModel.password,
    );
    final user = userCredential.user!;
    return UserModel(id: user.uid,
        firstName: user.displayName ?? "",
        lastName: "",
        email: user.email!);
  }


  Future<UserModel> register({required UserModel userModel}) async {
    UserCredential userCredential = await FirebaseAuth.instance
        .createUserWithEmailAndPassword(
      email: userModel.email, password: userModel.,);

    final user = userCredential.user!;

    return UserModel(id: user.uid,
        firstName: user.displayName ?? "",
        lastName: "",
        email: user.email!);
  }

}
