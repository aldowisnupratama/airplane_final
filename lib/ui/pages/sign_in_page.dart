import 'package:airplane/cubit/auth_cubit.dart';

import '../../utils/utils.dart';
import 'package:flutter/material.dart';
import '../../shared/theme.dart';
import '../ui.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SignInPage extends StatelessWidget {
  SignInPage({Key? key}) : super(key: key);

  final TextEditingController emailController = TextEditingController(text: "");
  final TextEditingController passwordController =
      TextEditingController(text: "");

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kBackgroundColor,
      body: SafeArea(
        child: ListView(
          padding:
              EdgeInsets.symmetric(horizontal: SizeConfig.blockHorizontal(5.8)),
          children: [title(), inputSection(context), signUpButton(context)],
        ),
      ),
    );
  }

  Widget title() {
    return Container(
      margin: EdgeInsets.only(top: SizeConfig.blockHorizontal(10)),
      child: Text(
        "Sign In with your\nexisting account",
        style: purpleTextStyle.copyWith(fontWeight: semiBold, fontSize: 24),
      ),
    );
  }

  Widget inputSection(context) {
    return Container(
      margin: EdgeInsets.only(top: SizeConfig.blockVertical(5)),
      padding: EdgeInsets.only(
          top: SizeConfig.blockVertical(3),
          right: SizeConfig.blockHorizontal(2),
          left: SizeConfig.blockHorizontal(2),
          bottom: SizeConfig.blockVertical(3)),
      decoration: BoxDecoration(
          color: kWhiteColor,
          borderRadius: BorderRadius.circular(defaultRadius)),
      child: Column(
        children: [
          CostumeTextField(
            textFieldName: "Email",
            hintText: "Email here",
            controller: emailController,
          ),
          CostumeTextField(
            textFieldName: "Password",
            hintText: "Password Here",
            obsecureText: true,
            controller: passwordController,
          ),
          BlocConsumer<AuthCubit, AuthState>(
            listener: (context, state) {
              if (state is AuthSuccess) {
                Navigator.pushNamedAndRemoveUntil(
                    context, mainPagePath, (route) => false);
              } else if (state is AuthFailed) {
                ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                    backgroundColor: kRedColor,
                    content: Text(state.errorMessage)));
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
              return CostumeButton(
                  buttonName: "Sign In",
                  width: SizeConfig.blockHorizontal(72),
                  marginBottom: SizeConfig.blockVertical(3.5),
                  onPressed: () {
                    context.read<AuthCubit>().signIn(
                        email: emailController.text,
                        password: passwordController.text);
                  });
            },
          )
        ],
      ),
    );
  }

  Widget signUpButton(context) {
    return Center(
      child: Container(
        margin: EdgeInsets.only(
            top: SizeConfig.blockVertical(7),
            bottom: SizeConfig.blockVertical(2)),
        child: TextButton(
          onPressed: () {
            Navigator.pushNamed(context, signUpPagePath);
          },
          child: Text(
            'Don\'t an account? Sign Up here',
            style: greyTextStyle.copyWith(
              fontSize: 16,
              fontWeight: light,
            ),
          ),
        ),
      ),
    );
  }
}
