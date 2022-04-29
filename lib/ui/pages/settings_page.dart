import 'package:airplane/cubit/auth_cubit.dart';
import 'package:airplane/cubit/page_cubit.dart';
import 'package:airplane/shared/shared.dart';
import 'package:airplane/utils/ui_path_name.dart';
import 'package:flutter/material.dart';
import '../../ui/ui.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SettingsPage extends StatelessWidget {
  const SettingsPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kBackgroundColor,
      body: BlocConsumer<AuthCubit, AuthState>(
        listener: (context, state) {
          if (state is AuthFailed) {
            ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                backgroundColor: kRedColor, content: Text(state.errorMessage)));
          } else if (state is AuthInitial) {
            context.read<PageCubit>().changePage(0);
            Navigator.pushNamedAndRemoveUntil(
                context, signInPagePath, (route) => false);
          }
        },
        builder: (context, state) {
          if (state is AuthLoading) {
            return Center(
              child: CircularProgressIndicator(
                backgroundColor: kPrimaryColor,
              ),
            );
          }
          return Center(
            child: CostumeButton(
              buttonName: "Sign Out",
              onPressed: () {
                context.read<AuthCubit>().signOut();
              },
              width: 220,
            ),
          );
        },
      ),
    );
  }
}
