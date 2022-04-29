import 'package:airplane/models/model.dart';
import 'package:airplane/ui/ui.dart';
import 'package:airplane/utils/utils.dart';
import 'package:flutter/material.dart';
import '../../shared/shared.dart';

class CostumeDestinationtile extends StatelessWidget {
  final DestinationModel destination;
  const CostumeDestinationtile(
    this.destination, {
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(context,
            MaterialPageRoute(builder: (context) => DetailPage(destination)));
      },
      child: Container(
        margin: EdgeInsets.only(top: SizeConfig.blockVertical(2)),
        padding: EdgeInsets.all(10),
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(defaultRadius),
            color: kWhiteColor),
        child: Row(
          children: [
            Container(
              width: SizeConfig.blockHorizontal(18),
              height: SizeConfig.blockVertical(8.1),
              margin: EdgeInsets.only(right: SizeConfig.blockHorizontal(3.7)),
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(defaultRadius),
                  image: DecorationImage(
                      fit: BoxFit.cover,
                      image: NetworkImage(destination.imageUrl))),
            ),
            Expanded(
              child: Container(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      destination.name,
                      style: blackTextStyle.copyWith(
                          fontSize: 18, fontWeight: medium),
                    ),
                    SizedBox(
                      height: 5,
                    ),
                    Text(
                      destination.city,
                      style: greyTextStyle.copyWith(
                          fontSize: 14, fontWeight: light),
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
                            image: AssetImage("assets/icons/icon_star.png"))),
                  ),
                  Text(
                    destination.rating.toString(),
                    style: blackTextStyle.copyWith(fontWeight: semiBold),
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
