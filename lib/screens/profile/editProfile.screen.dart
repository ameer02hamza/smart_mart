import 'dart:io';

import 'package:emart/common_widgets/bg.widget.dart';
import 'package:emart/common_widgets/customTextField.widget.dart';
import 'package:emart/common_widgets/loading.widget.dart';
import 'package:emart/common_widgets/ourButton.widget.dart';
import 'package:emart/consts/consts.dart';
import 'package:emart/controllers/profile.controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';

class EditProfileScreen extends StatelessWidget {
  final dynamic profileData;
  const EditProfileScreen({super.key, required this.profileData});
  updateProfile(context) async {
    if (Get.find<ProfileController>().profileImgPath.value.isEmpty) {
      Get.find<ProfileController>().profileImageLink =
          profileData['profileUrl'];
    }
    if (Get.find<ProfileController>().isChnagePaswd.value) {
      Get.find<ProfileController>().changePassword(
          email: profileData['email'],
          oldPswd: Get.find<ProfileController>().oldPswdController.text,
          newPassword: Get.find<ProfileController>().pswdController.text,
          context: context);
      return;
    }
    await Get.find<ProfileController>().updateProfile(context);
  }

  @override
  Widget build(BuildContext context) {
    var controller = Get.find<ProfileController>();
    GlobalKey<FormState> formKey = GlobalKey<FormState>();
    controller.nameController.text = profileData['name'];
    return bgWidget(
        child: Scaffold(
      // resizeToAvoidBottomInset: false,
      appBar: AppBar(
        iconTheme: const IconThemeData(color: whiteColor),
        title: profileData['name']
            .toString()
            .text
            .white
            .fontFamily(semibold)
            .make(),
        centerTitle: true,
      ),
      body: Obx(() => SingleChildScrollView(
              child: Form(
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
                        ? loadingIndicator()
                        : SizedBox(
                            width: context.screenWidth - 50,
                            child: ourButton(
                              title: "Save",
                              textColor: whiteColor,
                              color: primaryColor,
                              onPress: () async {
                                if (formKey.currentState!.validate()) {
                                  updateProfile(context);
                                }
                              },
                            ),
                          ),
                  ]))))
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
