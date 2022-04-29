import 'package:flutter/material.dart';
import '../../shared/shared.dart';

class PhotoItem extends StatelessWidget {
  final String imageUrl;
  const PhotoItem({Key? key, required this.imageUrl}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(right: 11),
      width: 70,
      height: 70,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(defaultRadius),
          image:
              DecorationImage(fit: BoxFit.cover, image: AssetImage(imageUrl))),
    );
  }
}
