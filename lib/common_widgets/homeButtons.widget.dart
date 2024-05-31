import 'package:emart/consts/consts.dart';
import 'package:flutter/material.dart';

Widget homeButtons({String? title, icon, height, width, onPress, }) {
  return Column(
    mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Image.asset(
          icon,
          width: 26,
        ),
        5.heightBox,
        title!.text.fontFamily(semibold).color(darkFontGrey).make()
      ],
    ).box.white.rounded.size(width, height).shadow.make();
}
