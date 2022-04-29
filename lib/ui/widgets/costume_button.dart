import 'package:flutter/material.dart';
import '../../utils/utils.dart';
import '../../shared/shared.dart';

class CostumeButton extends StatelessWidget {
  final double marginLeft, marginRight, marginTop, marginBottom;
  final String buttonName;
  final double width;

  final Function() onPressed;

  const CostumeButton(
      {Key? key,
      required this.buttonName,
      this.width = double.infinity,
      required this.onPressed,
      this.marginLeft = 0,
      this.marginRight = 0,
      this.marginTop = 0,
      this.marginBottom = 0})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width,
      height: 55,
      margin: EdgeInsets.only(top: marginTop, bottom: marginBottom),
      child: TextButton(
        style: TextButton.styleFrom(
            backgroundColor: kPrimaryColor,
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(defaultRadius))),
        onPressed: onPressed,
        child: Text(
          buttonName,
          style: whiteTextStyle.copyWith(fontSize: 18, fontWeight: medium),
        ),
      ),
    );
  }
}
