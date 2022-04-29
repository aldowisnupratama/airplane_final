import 'package:airplane/models/user_model.dart';
import 'package:airplane/services/service.dart';
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import '../services/user_service.dart';

part 'auth_state.dart';

class AuthCubit extends Cubit<AuthState> {
  AuthCubit() : super(AuthInitial());

  void signUp(
      {required String email,
      required String name,
      required String password,
      String hobby = ""}) async {
    try {
      emit(AuthLoading());
      UserModel user = await AuthService()
          .signUp(email: email, password: password, name: name, hobby: hobby);
      emit(AuthSuccess(userModel: user));
    } catch (e) {
      emit(AuthFailed(errorMessage: e.toString()));
    }
  }

  void signOut() async {
    try {
      await AuthService().signOut();
      emit(AuthInitial());
    } catch (e) {
      emit(AuthFailed(errorMessage: e.toString()));
    }
  }

  void getCurrentUser(String id) async {
    try {
      UserModel user_model = await UserService().getUserByID(id);
      emit(AuthSuccess(userModel: user_model));
    } catch (e) {
      emit(AuthFailed(errorMessage: e.toString()));
    }
  }

  void signIn({required String email, required String password}) async {
    try {
      emit(AuthLoading());
      UserModel userModel =
          await AuthService().signIn(email: email, password: password);
      emit(AuthSuccess(userModel: userModel));
    } catch (e) {
      emit(AuthFailed(errorMessage: e.toString()));
    }
  }
}
