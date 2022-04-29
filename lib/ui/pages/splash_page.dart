import 'dart:async';

import 'package:airplane/cubit/cubit.dart';
import 'package:airplane/shared/shared.dart';
import 'package:airplane/utils/utils.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SplashPage extends StatefulWidget {
  const SplashPage({Key? key}) : super(key: key);

  @override
  _SplashPageState createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> {
  @override
  void initState() {
    Timer(Duration(seconds: 3), () {
      User? user = FirebaseAuth.instance.currentUser;
      if (user == null) {
        Navigator.pushNamedAndRemoveUntil(
            context, signUpPagePath, (route) => false);
      } else {
        print(user.email);
        context.read<AuthCubit>().getCurrentUser(user.uid);
        Navigator.pushNamedAndRemoveUntil(
            context, mainPagePath, (route) => false);
      }
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return Scaffold(
      backgroundColor: kPrimaryColor,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
                width: SizeConfig.blockHorizontal(25),
                height: SizeConfig.blockVertical(25),
                margin: EdgeInsets.only(bottom: SizeConfig.blockVertical(1)),
                decoration: BoxDecoration(
                  image: DecorationImage(
                      image: AssetImage("assets/icons/logo.png")),
                )),
            Text(
              'AIRPLANE',
              style: whiteTextStyle.copyWith(
                  fontSize: 32, fontWeight: medium, letterSpacing: 10),
            )
          ],
        ),
      ),
    );
  }
}
