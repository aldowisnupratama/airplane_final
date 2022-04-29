import 'package:airplane/models/model.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class UserService {
  CollectionReference userReference =
      FirebaseFirestore.instance.collection('user ');

  Future<void> setuUser(UserModel userModel) async {
    try {
      userReference.doc(userModel.ID).set({
        'email': userModel.email,
        'name': userModel.name,
        'hobby': userModel.hobby,
        'balance': userModel.balance
      });
    } catch (e) {
      throw e;
    }
  }

  Future<UserModel> getUserByID(String id) async {
    try {
      DocumentSnapshot snapshot = await userReference.doc(id).get();
      return UserModel(
        ID: id,
        email: snapshot["email"],
        name: snapshot["name"],
        hobby: snapshot["hobby"],
        balance: snapshot["balance"],
      );
    } catch (e) {
      throw e;
    }
  }
}
