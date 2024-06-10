import 'dart:io';

import 'package:emart/common_widgets/bg.widget.dart';
import 'package:emart/common_widgets/customTextField.widget.dart';
import 'package:emart/common_widgets/ourButton.widget.dart';
import 'package:emart/consts/colors.dart';
import 'package:emart/consts/consts.dart';
import 'package:emart/consts/images.dart';
import 'package:emart/controllers/profile.controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:velocity_x/velocity_x.dart';

class EditProfileScreen extends StatelessWidget {
  const EditProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    var controller = Get.find<ProfileController>();
    return bgWidget(
        child: Scaffold(
      appBar: AppBar(),
      body: Obx(() => Column(mainAxisSize: MainAxisSize.min, children: [
                controller.profileImgPath.isEmpty
                    ? Image.asset(
                        imgProfile2,
                        width: 100,
                        fit: BoxFit.cover,
                      ).box.roundedFull.clip(Clip.antiAlias).make()
                    : Image.file(
                        File(controller.profileImgPath.value),
                        width: 100,
                        height: 100,
                        fit: BoxFit.cover,
                      ).box.roundedFull.clip(Clip.antiAlias).make(),
                ourButton(
                  title: "Change",
                  textColor: whiteColor,
                  color: primaryColor,
                  onPress: () {
                    controller.changeImage(context);
                  },
                ),
                const Divider(),
                20.heightBox,
                customTextField(
                  hint: nameHint,
                  title: name,
                  isPass: false,
                ),
                customTextField(
                  hint: passwordHint,
                  title: password,
                  isPass: false,
                ),
                SizedBox(
                  width: context.screenWidth - 50,
                  child: ourButton(
                    title: "Save",
                    textColor: whiteColor,
                    color: primaryColor,
                    onPress: () {},
                  ),
                ),
              ]))
          .box
          .color(whiteColor)
          .shadowSm
          .padding(const EdgeInsets.all(16))
          .margin(const EdgeInsets.only(top: 5, left: 12, right: 12))
          .rounded
          .make(),
    ));
  }
}
