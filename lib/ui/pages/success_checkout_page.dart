import 'package:airplane/shared/shared.dart';
import 'package:flutter/material.dart';
import '../../utils/utils.dart';
import '../../ui/ui.dart';

class SuccessCheckoutPage extends StatelessWidget {
  const SuccessCheckoutPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kBackgroundColor,
      body: Center(
          child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            width: SizeConfig.blockHorizontal(75),
            height: SizeConfig.blockVertical(20),
            margin: EdgeInsets.only(bottom: 80),
            decoration: BoxDecoration(
                image: DecorationImage(
                    image: AssetImage("assets/images/image_succes.png"))),
          ),
          Text(
            "Well Booked 😍",
            style: purpleTextStyle.copyWith(fontWeight: semiBold, fontSize: 32),
          ),
          SizedBox(
            height: SizeConfig.blockVertical(1.5),
          ),
          Text(
            "Are you ready to explore the new\nworld of experiences?",
            textAlign: TextAlign.center,
            style: greyTextStyle.copyWith(
              fontWeight: light,
              fontSize: 16,
            ),
          ),
          SizedBox(
            height: SizeConfig.blockVertical(5.5),
          ),
          CostumeButton(
            buttonName: "My Bookings",
            onPressed: () {
              Navigator.pushNamedAndRemoveUntil(
                  context, mainPagePath, (route) => false);
            },
            width: SizeConfig.blockHorizontal(50),
          )
        ],
      )),
    );
  }
}
