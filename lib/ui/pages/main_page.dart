import 'package:airplane/ui/ui.dart';
import 'package:airplane/utils/utils.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter/material.dart';
import '../../shared/shared.dart';
import '../../cubit/cubit.dart';

class MainPage extends StatefulWidget {
  const MainPage({Key? key}) : super(key: key);

  @override
  _MainPageState createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  @override
  Widget build(BuildContext context) {
    Widget buildContent(int currentIndex) {
      switch (currentIndex) {
        case 0:
          return HomePage();
        case 1:
          return TransactionPage();
        case 2:
          return WalletPage();
        case 3:
          return SettingsPage();
        default:
          return HomePage();
      }
    }

    Widget costumeBottomNavigation() {
      return Align(
          alignment: Alignment.bottomCenter,
          child: Container(
            width: double.infinity,
            height: SizeConfig.blockVertical(8),
            margin: EdgeInsets.only(
                bottom: SizeConfig.blockVertical(2.5),
                top: 50,
                left: SizeConfig.blockHorizontal(
                    defaultSizeConfigMarginLeftRight),
                right: SizeConfig.blockHorizontal(
                    defaultSizeConfigMarginLeftRight)),
            decoration: BoxDecoration(
                color: kWhiteColor,
                borderRadius: BorderRadius.circular(defaultRadius)),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                CostumeBottomNavigationItem(
                  index: 0,
                  assetsImagePath: "assets/icons/icon_home.png",
                ),
                CostumeBottomNavigationItem(
                    index: 1, assetsImagePath: "assets/icons/icon_booking.png"),
                CostumeBottomNavigationItem(
                    index: 2, assetsImagePath: "assets/icons/icon_card.png"),
                CostumeBottomNavigationItem(
                    index: 3,
                    assetsImagePath: "assets/icons/icon_setttings.png"),
              ],
            ),
          ));
    }

    return BlocBuilder<PageCubit, int>(
      builder: (context, state) {
        return Scaffold(
          body: Stack(
            children: [buildContent(state), costumeBottomNavigation()],
          ),
        );
      },
    );
  }
}
