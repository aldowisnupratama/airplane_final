import 'package:airplane/models/destination_model.dart';
import 'package:airplane/ui/ui.dart';
import 'package:airplane/utils/utils.dart';
import 'package:flutter/material.dart';
import '../../shared/theme.dart';

class CostumeDestinationCard extends StatelessWidget {
  final DestinationModel destination_model;

  const CostumeDestinationCard(
    this.destination_model, {
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
            context,
            MaterialPageRoute(
                builder: (context) => DetailPage(destination_model)));
      },
      child: Container(
        width: SizeConfig.blockHorizontal(50),
        height: SizeConfig.blockVertical(38),
        margin: EdgeInsets.only(left: defaultMargin),
        padding: EdgeInsets.all(10),
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(defaultRadius),
            color: kWhiteColor),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              width: SizeConfig.blockHorizontal(50),
              height: SizeConfig.blockVertical(25),
              margin: EdgeInsets.only(bottom: SizeConfig.blockVertical(2)),
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(defaultRadius),
                  image: DecorationImage(
                      image: NetworkImage(destination_model.imageUrl),
                      fit: BoxFit.cover)),
              child: Align(
                alignment: Alignment.topRight,
                child: Container(
                  width: SizeConfig.blockHorizontal(14),
                  height: SizeConfig.blockVertical(3.4),
                  decoration: BoxDecoration(
                      color: kWhiteColor,
                      borderRadius: BorderRadius.only(
                          bottomLeft: Radius.circular(defaultRadius))),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Container(
                        height: 20,
                        width: 20,
                        decoration: BoxDecoration(
                            image: DecorationImage(
                                image:
                                    AssetImage("assets/icons/icon_star.png"))),
                      ),
                      Text(
                        destination_model.rating.toString(),
                        style: blackTextStyle.copyWith(fontWeight: semiBold),
                      )
                    ],
                  ),
                ),
              ),
            ),
            Container(
              margin: EdgeInsets.only(
                left: SizeConfig.blockHorizontal(3),
              ),
              child: Text(
                destination_model.name,
                style:
                    blackTextStyle.copyWith(fontWeight: semiBold, fontSize: 14),
              ),
            ),
            Container(
              margin: EdgeInsets.only(
                left: SizeConfig.blockHorizontal(3),
              ),
              child: Text(
                destination_model.city,
                style: greyTextStyle.copyWith(fontWeight: light),
              ),
            )
          ],
        ),
      ),
    );
  }
}
