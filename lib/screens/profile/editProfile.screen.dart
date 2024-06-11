import 'dart:io';

import 'package:emart/common_widgets/bg.widget.dart';
import 'package:emart/common_widgets/customTextField.widget.dart';
import 'package:emart/common_widgets/ourButton.widget.dart';
import 'package:emart/consts/consts.dart';
import 'package:emart/controllers/profile.controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class EditProfileScreen extends StatelessWidget {
  final dynamic profileData;
  const EditProfileScreen({super.key, required this.profileData});

  @override
  Widget build(BuildContext context) {
    var controller = Get.find<ProfileController>();
    GlobalKey<FormState> formKey = GlobalKey<FormState>();
    controller.nameController.text = profileData['name'];
    return bgWidget(
        child: Scaffold(
      appBar: AppBar(),
      body: Obx(() => Form(
              key: formKey,
              child: Column(mainAxisSize: MainAxisSize.min, children: [
                controller.profileImgPath.isEmpty &&
                        profileData['profileUrl'] == ""
                    ? Image.asset(
                        imgProfile2,
                        width: 100,
                        fit: BoxFit.cover,
                      ).box.roundedFull.clip(Clip.antiAlias).make()
                    : profileData['profileUrl'] != "" &&
                            controller.profileImgPath.isEmpty
                        ? Image.network(
                            profileData['profileUrl'],
                            width: 100,
                            height: 100,
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
                  controller: controller.nameController,
                ),
                5.heightBox,
                Row(
                  children: [
                    Checkbox(
                        checkColor: primaryColor,
                        fillColor: WidgetStateProperty.all(lightPrimary),
                        side: const BorderSide(color: primaryColor),
                        value: controller.isChnagePaswd.value,
                        onChanged: (newValue) {
                          controller.isChnagePaswd(newValue);
                        }),
                    10.widthBox,
                    Expanded(
                        child: RichText(
                            text: TextSpan(children: [
                      TextSpan(
                          text: "Change Password".toUpperCase(),
                          style: const TextStyle(
                              color: primaryColor, fontFamily: regular)),
                    ])))
                  ],
                ),
                if (controller.isChnagePaswd.value) ...[
                  10.heightBox,
                  customTextField(
                    hint: passwordHint,
                    title: oldPassword,
                    isPass: true,
                    controller: controller.oldPswdController,
                  ),
                  10.heightBox,
                  customTextField(
                    hint: password,
                    title: password,
                    isPass: true,
                    controller: controller.pswdController,
                  ),
                ],
                controller.isLoading.value
                    ? const CircularProgressIndicator(
                        semanticsLabel: String.fromEnvironment("Loading..."),
                        valueColor: AlwaysStoppedAnimation<Color>(primaryColor),
                      )
                    : SizedBox(
                        width: context.screenWidth - 50,
                        child: ourButton(
                          title: "Save",
                          textColor: whiteColor,
                          color: primaryColor,
                          onPress: () async {
                            if (formKey.currentState!.validate()) {
                              // if (controller.profileImgPath.value.isEmpty) {
                              //   controller.profileImgPath.value =
                              //       profileData['profileUrl'];
                              // }
                              // await controller.updateProfile(context);
                            }
                          },
                        ),
                      ),
              ])))
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
