import 'package:airplane/shared/shared.dart';
import 'package:flutter/material.dart';
import '../../utils/utils.dart';

class DestinationBookingDetails extends StatelessWidget {
  final String imageURL, destinationName, destinationLocation, rate;
  const DestinationBookingDetails(
      {Key? key,
      required this.imageURL,
      required this.destinationName,
      required this.destinationLocation,
      required this.rate})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Row(
        children: [
          Container(
            width: SizeConfig.blockHorizontal(18),
            height: SizeConfig.blockVertical(8.1),
            margin: EdgeInsets.only(right: SizeConfig.blockHorizontal(3.7)),
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(defaultRadius),
                image: DecorationImage(
                    fit: BoxFit.cover, image: NetworkImage("$imageURL"))),
          ),
          Expanded(
            child: Container(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text("${destinationName}",
                      style: blackTextStyle.copyWith(
                          fontWeight: medium, fontSize: 16)),
                  SizedBox(
                    height: 5,
                  ),
                  Text(
                    "$destinationLocation",
                    style: greyTextStyle.copyWith(fontWeight: light),
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
                  "${rate.toString()}",
                  style: blackTextStyle.copyWith(fontWeight: semiBold),
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}
