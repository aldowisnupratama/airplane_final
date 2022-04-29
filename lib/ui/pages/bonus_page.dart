import 'package:airplane/cubit/auth_cubit.dart';
import 'package:airplane/ui/widgets/costume_button.dart';
import 'package:airplane/utils/utils.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../shared/shared.dart';

class BonusPage extends StatelessWidget {
  const BonusPage({Key? key}) : super(key: key);

  Widget bonusCard() {
    return BlocBuilder<AuthCubit, AuthState>(
      builder: (context, state) {
        if (state is AuthSuccess) {
          return Container(
            margin: EdgeInsets.all(defaultMargin),
            padding: EdgeInsets.only(
                top: SizeConfig.blockVertical(3),
                left: SizeConfig.blockHorizontal(4.5),
                right: SizeConfig.blockHorizontal(4.5),
                bottom: SizeConfig.blockVertical(3)),
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(defaultRadius),
                image: DecorationImage(
                    fit: BoxFit.cover,
                    image: AssetImage('assets/images/image_cardPolosan.png')),
                boxShadow: [
                  BoxShadow(
                      color: kPrimaryColor.withOpacity(0.5),
                      blurRadius: 50,
                      offset: Offset(0, 20))
                ]),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Name',
                            style: whiteTextStyle.copyWith(
                                fontWeight: light, fontSize: 14),
                          ),
                          Text('${state.userModel.name}',
                              style: whiteTextStyle.copyWith(
                                  fontWeight: medium, fontSize: 20))
                        ],
                      ),
                    ),
                    Container(
                      margin:
                          EdgeInsets.only(right: SizeConfig.blockHorizontal(2)),
                      height: 24,
                      width: 24,
                      decoration: BoxDecoration(
                          image: DecorationImage(
                              image: AssetImage('assets/icons/logo.png'))),
                    ),
                    Text(
                      'Pay',
                      style: whiteTextStyle.copyWith(
                          fontWeight: medium, fontSize: 16),
                    )
                  ],
                ),
                Container(
                  margin: EdgeInsets.only(top: SizeConfig.blockVertical(3)),
                  child: Text(
                    "Balance",
                    style: whiteTextStyle.copyWith(
                        fontWeight: light, fontSize: 14),
                  ),
                ),
                Container(
                  child: Text(
                    "IDR 280.000.000",
                    style: whiteTextStyle.copyWith(
                        fontWeight: medium, fontSize: 26),
                  ),
                )
              ],
            ),
          );
        } else {
          return SizedBox();
        }
      },
    );
  }

  Widget title() {
    return Container(
      margin: EdgeInsets.only(top: SizeConfig.blockVertical(8)),
      child: Text(
        'Big Bonus 🎉',
        style: blackTextStyle.copyWith(fontWeight: semiBold, fontSize: 32),
      ),
    );
  }

  Widget subtitle() {
    return Container(
      margin: EdgeInsets.only(top: SizeConfig.blockVertical(1)),
      child: Text(
        'We give you early credit so that\nyou can buy a flight ticket ',
        style: greyTextStyle.copyWith(fontWeight: light, fontSize: 16),
        textAlign: TextAlign.center,
      ),
    );
  }

  Widget startFlyButton(context) {
    return CostumeButton(
        buttonName: "Start Fly Now",
        marginTop: SizeConfig.blockVertical(5),
        width: SizeConfig.blockHorizontal(53.4),
        onPressed: () {
          Navigator.restorablePushNamedAndRemoveUntil(
              context, mainPagePath, (route) => false);
        });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kBackgroundColor,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [bonusCard(), title(), subtitle(), startFlyButton(context)],
        ),
      ),
    );
  }
}
