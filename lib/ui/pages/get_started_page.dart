import 'package:airplane/shared/shared.dart';
import 'package:airplane/ui/ui.dart';
import 'package:airplane/utils/utils.dart';
import 'package:flutter/material.dart';

class GetStartedPage extends StatelessWidget {
  const GetStartedPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Container(
            width: double.infinity,
            height: double.infinity,
            decoration: BoxDecoration(
                color: kPrimaryColor,
                image: DecorationImage(
                    fit: BoxFit.fill,
                    image: AssetImage("assets/images/image_get_started.png"))),
          ),
          Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Container(
                  child: Text(
                    "Fly Like a Bird",
                    style: whiteTextStyle.copyWith(
                        fontSize: 32, fontWeight: semiBold),
                  ),
                ),
                Container(
                  margin: EdgeInsets.only(top: SizeConfig.blockVertical(0.5)),
                  child: Text(
                    "Explore new world with us and let\nyourself get an amazing experiences",
                    style: whiteTextStyle.copyWith(
                        fontSize: 16, fontWeight: light),
                    textAlign: TextAlign.center,
                  ),
                ),
                CostumeButton(
                    buttonName: "Get Started",
                    width: SizeConfig.blockHorizontal(53.8),
                    marginTop: SizeConfig.blockVertical(5.5),
                    marginBottom: SizeConfig.blockVertical(8.5),
                    onPressed: () {
                      Navigator.pushNamed(context, signUpPagePath);
                    })
              ],
            ),
          )
        ],
      ),
    );
  }
}
