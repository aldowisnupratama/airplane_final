import 'package:equatable/equatable.dart';

class UserModel extends Equatable {
  final String ID;
  final String email;
  final String name;
  final String hobby;
  final double balance;


  UserModel({required this.ID, required this.email, required this.name , this.hobby='', this.balance=0.0});
  @override
  List<Object?> get props => [ID,email,name,hobby,balance];
}
