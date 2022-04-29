import 'package:flutter/material.dart';
import '../../shared/shared.dart';
import '../../utils/utils.dart';

class CostumeBookingDetailsTile extends StatelessWidget {
  final String itemName, itemDetails;
  final Color color;
  const CostumeBookingDetailsTile(
      {Key? key,
      required this.itemName,
      required this.itemDetails,
      required this.color})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(top: 16),
      child: Row(
        children: [
          Container(
            width: 16,
            height: 16,
            margin: EdgeInsets.only(right: SizeConfig.blockHorizontal(1.4)),
            decoration: BoxDecoration(
                image: DecorationImage(
                    image: AssetImage("assets/icons/icon_checked.png"))),
          ),
          Expanded(child: Text("$itemName")),
          Flexible(
            child: Text(
              "$itemDetails",
              style: blackTextStyle.copyWith(
                fontWeight: semiBold,
                color: color,
              ),
            ),
          ),
         
        ],
      ),
    );
  }
}
