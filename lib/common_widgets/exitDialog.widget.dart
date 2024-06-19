import 'package:emart/common_widgets/ourButton.widget.dart';
import 'package:emart/consts/consts.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';

Widget showDialogWidget(BuildContext context) {
  return Dialog(
    child: Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        sureText.text.bold.size(18).color(darkFontGrey).make(),
        const Divider(),
        10.heightBox,
        exitMessage.text.bold.size(18).color(darkFontGrey).make(),
        10.heightBox,
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            ourButton(
              color: primaryColor,
              title: "Yes",
              onPress: () {
                SystemNavigator.pop();
              },
              textColor: whiteColor,
            ).box.roundedSM.make(),
            10.widthBox,
            ourButton(
              color: primaryColor,
              title: "NO",
              onPress: () {
                Navigator.pop(context);
              },
              textColor: whiteColor,
            ).box.roundedSM.make(),
          ],
        )
      ],
    ).box.color(lightGrey).padding(const EdgeInsets.all(15)).roundedSM.make(),
  );
}
