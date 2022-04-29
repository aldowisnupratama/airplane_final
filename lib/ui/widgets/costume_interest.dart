import 'package:flutter/material.dart';
import '../../shared/shared.dart';
import '../../utils/utils.dart';

class CostumeInterest extends StatelessWidget {
  final String interest;
  const CostumeInterest({Key? key, required this.interest}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Row(
        children: [
          Container(
            width: 16,
            height: 16,
            margin: EdgeInsets.only(right: 6),
            decoration: BoxDecoration(
                image: DecorationImage(
                    image: AssetImage("assets/icons/icon_checked.png"))),
          ),
          Text(
            "$interest",
            style: blackTextStyle,
          )
        ],
      ),
    );
  }
}
