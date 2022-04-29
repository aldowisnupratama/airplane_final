import 'package:airplane/models/destination_model.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import '../../shared/shared.dart';
import '../../utils/utils.dart';
import '../../ui/ui.dart';

class DetailPage extends StatelessWidget {
  final DestinationModel destination_model;
  const DetailPage(this.destination_model, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Widget backgroundImage() {
      return Container(
        width: double.infinity,
        height: SizeConfig.blockVertical(49.2),
        decoration: BoxDecoration(
            image: DecorationImage(
                fit: BoxFit.cover,
                image: NetworkImage(destination_model.imageUrl))),
      );
    }

    Widget costumeShadowImage() {
      return Container(
        margin: EdgeInsets.only(top: SizeConfig.blockVertical(25.75)),
        width: double.infinity,
        height: SizeConfig.blockVertical(23.4),
        decoration: BoxDecoration(
            gradient: LinearGradient(
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                colors: [
              kWhiteColor.withOpacity(0),
              Colors.black.withOpacity(0.75)
            ])),
      );
    }

    Widget content() {
      return Container(
        margin: EdgeInsets.only(
            left: SizeConfig.blockHorizontal(5.1),
            right: SizeConfig.blockHorizontal(5.1)),
        child: Column(
          children: [
            //note emblem
            Container(
              width: double.infinity,
              height: 24,
              margin: EdgeInsets.only(top: SizeConfig.blockVertical(4)),
              decoration: BoxDecoration(
                  image: DecorationImage(
                      image: AssetImage('assets/icons/icon_emblem.png'))),
            ),
            //note content
            Container(
              margin: EdgeInsets.only(
                top: SizeConfig.blockVertical(29),
              ),
              child: Row(
                children: [
                  Expanded(
                    child: Container(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            destination_model.name,
                            style: whiteTextStyle.copyWith(
                                fontWeight: semiBold, fontSize: 24),
                          ),
                          Text(
                            destination_model.city,
                            style: whiteTextStyle.copyWith(
                                fontWeight: light, fontSize: 16),
                          )
                        ],
                      ),
                    ),
                  ),
                  Container(
                    width: SizeConfig.blockHorizontal(14),
                    height: SizeConfig.blockVertical(3.4),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Container(
                          margin: EdgeInsets.only(right: 2),
                          height: 20,
                          width: 20,
                          decoration: BoxDecoration(
                              image: DecorationImage(
                                  image: AssetImage(
                                      "assets/icons/icon_star.png"))),
                        ),
                        Text(
                          destination_model.rating.toString(),
                          style: whiteTextStyle.copyWith(fontWeight: semiBold),
                        )
                      ],
                    ),
                  )
                ],
              ),
            ),
            //about,photos and interest
            Container(
              width: double.infinity,
              padding: EdgeInsets.only(
                  top: SizeConfig.blockVertical(3),
                  left: SizeConfig.blockHorizontal(5),
                  right: SizeConfig.blockHorizontal(5),
                  bottom: SizeConfig.blockVertical(3)),
              margin: EdgeInsets.only(top: SizeConfig.blockVertical(2)),
              decoration: BoxDecoration(
                  color: kWhiteColor,
                  borderRadius: BorderRadius.circular(defaultRadius)),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text('About',
                            style: blackTextStyle.copyWith(
                                fontWeight: semiBold, fontSize: 16)),
                        SizedBox(height: SizeConfig.blockVertical(1)),
                        Text(
                          destination_model.about,
                          style: blackTextStyle.copyWith(
                              fontSize: 14, fontWeight: medium, height: 2),
                        )
                      ],
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.only(top: SizeConfig.blockVertical(2)),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text('Photos',
                            style: blackTextStyle.copyWith(
                                fontWeight: semiBold, fontSize: 16)),
                        SizedBox(height: SizeConfig.blockVertical(1)),
                        Container(
                          child: Row(
                            children: [
                              PhotoItem(
                                  imageUrl:
                                      "assets/images/image_detailpage1.png"),
                              PhotoItem(
                                  imageUrl:
                                      "assets/images/image_detailpage3.png"),
                              PhotoItem(
                                  imageUrl:
                                      "assets/images/image_detailpage1.png")
                            ],
                          ),
                        )
                      ],
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.only(top: SizeConfig.blockVertical(2)),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text('Interest',
                            style: blackTextStyle.copyWith(
                                fontWeight: semiBold, fontSize: 16)),
                        SizedBox(height: SizeConfig.blockVertical(1)),
                        Row(children: [
                          CostumeInterest(interest: "Kids Park"),
                          CostumeInterest(interest: "Honor Bridge")
                        ]),
                        SizedBox(height: SizeConfig.blockVertical(1)),
                        Row(children: [
                          CostumeInterest(interest: "City Museum"),
                          CostumeInterest(interest: "Central Mall")
                        ])
                      ],
                    ),
                  )
                ],
              ),
            ),
            Container(
              margin:
                  EdgeInsets.symmetric(vertical: SizeConfig.blockVertical(3)),
              child: Row(
                children: [
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          NumberFormat.currency(
                                  locale: "id",
                                  symbol: "IDR ",
                                  decimalDigits: 0)
                              .format(destination_model.price),
                          style: blackTextStyle.copyWith(
                              fontWeight: semiBold, fontSize: 18),
                        ),
                        SizedBox(height: SizeConfig.blockVertical(0.5)),
                        Text(
                          "per orang",
                          style: greyTextStyle.copyWith(fontWeight: light),
                        )
                      ],
                    ),
                  ),
                  CostumeButton(
                    buttonName: "Book Now",
                    onPressed: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => ChooseSeatPage(
                                  destination: destination_model)));
                    },
                    width: SizeConfig.blockHorizontal(40),
                  )
                ],
              ),
            )
          ],
        ),
      );
    }

    return Scaffold(
      backgroundColor: kBackgroundColor,
      body: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: Stack(
          children: [
            backgroundImage(),
            costumeShadowImage(),
            content(),
          ],
        ),
      ),
    );
  }
}
