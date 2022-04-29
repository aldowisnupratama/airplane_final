import 'package:flutter/material.dart';
import '../../shared/shared.dart';
import '../../utils/utils.dart';

class CostumeTextField extends StatelessWidget {
  final String textFieldName;
  final String hintText;
  final bool obsecureText;
  final TextEditingController controller;

  const CostumeTextField(
      {Key? key,
      required this.textFieldName,
      required this.hintText,
      required this.controller,
      this.obsecureText = false})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(bottom: SizeConfig.blockVertical(2)),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(textFieldName),
          SizedBox(
            height: 6,
          ),
          TextFormField(
            controller: controller,
            obscureText: obsecureText,
            cursorColor: kBlackColor,
            decoration: InputDecoration(
                hintText: hintText,
                border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(defaultRadius)),
                focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(defaultRadius),
                    borderSide: BorderSide(color: kPrimaryColor))),
          )
        ],
      ),
    );
  }
}
