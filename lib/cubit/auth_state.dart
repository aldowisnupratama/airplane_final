part of 'auth_cubit.dart';

abstract class AuthState extends Equatable {
  const AuthState();

  @override
  List<Object> get props => [];
}

class AuthInitial extends AuthState {}

class AuthLoading extends AuthState {}

class AuthSuccess extends AuthState {
  final UserModel userModel;
  AuthSuccess({required this.userModel});
  @override
  List<Object> get props => [userModel];
}

class AuthFailed extends AuthState {
  final String errorMessage;

  AuthFailed({required this.errorMessage});

  @override
  List<Object> get props => [errorMessage];
}
