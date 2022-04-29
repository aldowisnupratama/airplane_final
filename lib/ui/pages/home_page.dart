import 'package:airplane/cubit/auth_cubit.dart';
import 'package:airplane/cubit/destination_cubit.dart';
import 'package:airplane/models/model.dart';
import 'package:airplane/shared/shared.dart';
import 'package:airplane/ui/ui.dart';
import 'package:airplane/utils/utils.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  void initState() {
    context.read<DestinationCubit>().fetchDestination();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    Widget header() {
      return BlocBuilder<AuthCubit, AuthState>(
        builder: (context, state) {
          if (state is AuthSuccess) {
            return Container(
              margin: EdgeInsets.only(
                  left: SizeConfig.blockHorizontal(5.8),
                  right: SizeConfig.blockHorizontal(5.8),
                  top: SizeConfig.blockVertical(1.4)),
              child: Row(
                children: [
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "Howdy,\n${state.userModel.name}",
                          style: blackTextStyle.copyWith(
                              fontSize: 24, fontWeight: semiBold),
                        ),
                        SizedBox(
                          height: 6,
                        ),
                        Text(
                          "Where to fly today?",
                          style: greyTextStyle.copyWith(
                              fontWeight: light, fontSize: 16),
                        )
                      ],
                    ),
                  ),
                  Container(
                    width: 60,
                    height: 60,
                    decoration: BoxDecoration(
                        image: DecorationImage(
                            image:
                                AssetImage("assets/images/image_profile.png"))),
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

    Widget popularDestionation(List<DestinationModel> destinations) {
      return Container(
        margin: EdgeInsets.only(
          top: SizeConfig.blockVertical(3.5),
        ),
        child: SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          child: Row(
            children: destinations.map((DestinationModel e) {
              return CostumeDestinationCard(e);
            }).toList(),
          ),
        ),
      );
    }

    Widget newThisYear(List<DestinationModel> destinations) {
      return Container(
        margin: EdgeInsets.only(
            top: SizeConfig.blockVertical(4),
            left: defaultMargin,
            right: defaultMargin,
            bottom: SizeConfig.blockVertical(20)),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "New This Year",
              style:
                  blackTextStyle.copyWith(fontSize: 18, fontWeight: semiBold),
            ),
            Column(
              children: destinations.map((DestinationModel e) {
                return CostumeDestinationtile(e);
              }).toList(),
            ),
          ],
        ),
      );
    }

    return SafeArea(
      child: BlocConsumer<DestinationCubit, DestinationState>(
        listener: (context, state) {
          if (state is DestinationFailed) {
            ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                backgroundColor: kRedColor, content: Text(state.errorMessage)));
          }
          // TODO: implement listener
        },
        builder: (context, state) {
          if (state is DestinationSuccess) {
            return ListView(
              children: [
                header(),
                popularDestionation(state.destination),
                newThisYear(state.destination),
              ],
            );
          }
          return Center(child: CircularProgressIndicator());
        },
      ),
    );
  }
}
