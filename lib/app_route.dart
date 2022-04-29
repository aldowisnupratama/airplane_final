import 'package:airplane/ui/ui.dart';
import 'package:flutter/material.dart';
import 'package:airplane/utils/utils.dart';

class AppRoute {
  AppRoute();
  Route? generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case splashPagePath:
        return MaterialPageRoute(builder: (_) => SplashPage());
      case getStartedPath:
        return MaterialPageRoute(builder: (_) => GetStartedPage());
      case signUpPagePath:
        return MaterialPageRoute(builder: (_) => SignUpPage());
      case bonusPagePath:
        return MaterialPageRoute(builder: (_) => BonusPage());
      case mainPagePath:
        return MaterialPageRoute(builder: (_) => MainPage());

      case succesCheckoutPage:
        return MaterialPageRoute(builder: (_) => SuccessCheckoutPage());
      case homePagePath:
        return MaterialPageRoute(builder: (_) => HomePage());
      case signInPagePath:
        return MaterialPageRoute(builder: (_) => SignInPage());
      case transactionPagePath:
        return MaterialPageRoute(builder: (_) => TransactionPage());
    }
  }
}
