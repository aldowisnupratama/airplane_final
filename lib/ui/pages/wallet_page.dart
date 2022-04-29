import 'package:airplane/cubit/cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../shared/shared.dart';
import '../../utils/utils.dart';

class WalletPage extends StatelessWidget {
  const WalletPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AuthCubit, AuthState>(
      builder: (context, state) {
        if (state is AuthSuccess) {
          return Center(
            child: Container(
              width: SizeConfig.blockHorizontal(80),
              height: SizeConfig.blockVertical(23),
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
                        margin: EdgeInsets.only(
                            right: SizeConfig.blockHorizontal(2)),
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
            ),
          );
        } else {
          return SizedBox();
        }
      },
    );
  }
}
