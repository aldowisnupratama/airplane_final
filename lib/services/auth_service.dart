import 'package:airplane/models/model.dart';
import 'package:airplane/services/user_service.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'service.dart';

class AuthService {
  FirebaseAuth auth = FirebaseAuth.instance;

  Future<UserModel> signIn(
      {required String email, required String password}) async {
    try {
      UserCredential userCredential = await auth.signInWithEmailAndPassword(
          email: email, password: password);
      UserModel model =
          await UserService().getUserByID(userCredential.user!.uid);
      return model;
    } catch (e) {
      throw e;
    }
  }

  Future<UserModel> signUp(
      {required String email,
      required String password,
      required String name,
      String hobby = ''}) async {
    try {
      UserCredential userCredential = await auth.createUserWithEmailAndPassword(
          email: email, password: password);

      UserModel userModel = UserModel(
          ID: userCredential.user!.uid,
          email: email,
          name: name,
          hobby: hobby,
          balance: 280000000);

      await UserService().setuUser(userModel);

      return userModel;
    } catch (e) {
      throw e;
    }
  }

  Future<void> signOut() async {
    try {
      await auth.signOut();
    } catch (e) {
      throw e;
    }
  }
}
