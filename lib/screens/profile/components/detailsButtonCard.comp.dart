import 'package:emart/consts/consts.dart';
import 'package:flutter/material.dart';

Widget detailsCard({width, String? count, String? title}) {
  return Column(
    mainAxisAlignment: MainAxisAlignment.center,
    children: [
      count!.text.fontFamily(bold).color(darkFontGrey).make(),
      5.heightBox,
      title!.text.fontFamily(bold).size(12).make()
    ],
  )
      .box
      .color(whiteColor)
      .width(width)
      .height(80)
      .margin(const EdgeInsets.only(right: 5))
      .padding(const EdgeInsets.all(2))
      .rounded
      .make();
}
