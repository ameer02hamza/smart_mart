import 'package:emart/consts/consts.dart';
import 'package:flutter/material.dart';

Widget detailsCard({width, String? count, String? title}) {
  return Column(
    mainAxisAlignment: MainAxisAlignment.center,
    children: [
      count!.text.fontFamily(bold).color(darkFontGrey).make(),
      5.heightBox,
      title!.text.fontFamily(bold).make()
    ],
  )
      .box
      .color(whiteColor)
      .width(width)
      .height(60)
      .padding(const EdgeInsets.all(2))
      .rounded
      .make();
}
