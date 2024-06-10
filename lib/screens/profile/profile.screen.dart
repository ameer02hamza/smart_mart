import 'package:emart/common_widgets/bg.widget.dart';
import 'package:emart/controllers/auth.controller.dart';
import 'package:emart/screens/auth_screen/login.screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../consts/consts.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({super.key});

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  var controller = Get.put(AuthController());
  logoutUser() async {
    await controller.logoutMethod(context: context);
    Get.offAll(() => const LoginScreen());
  }

  @override
  Widget build(BuildContext context) {
    return bgWidget(
        child: Scaffold(
      body: SafeArea(
          child: Container(
        padding: const EdgeInsets.all(8),
        child: Column(
          children: [
            const Align(
              alignment: Alignment.topRight,
              child: Icon(
                Icons.edit,
                size: 30,
                color: whiteColor,
              ),
            ).onTap(
              () {},
            ),
            Row(
              children: [
                Image.asset(
                  imgProfile2,
                  width: 50,
                  fit: BoxFit.cover,
                )
                    .box
                    .roundedFull
                    .margin(const EdgeInsets.only(right: 5))
                    .clip(Clip.antiAlias)
                    .make(),
                Expanded(
                    child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    'Ameer Hamza'.text.size(12).fontFamily(bold).white.make(),
                    "ameer02hamza@gmail.com".text.size(10).white.make(),
                  ],
                )),
                OutlinedButton(
                    style: OutlinedButton.styleFrom(
                        side: const BorderSide(color: whiteColor),
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(4))),
                    onPressed: logoutUser,
                    child:
                        logout.text.fontFamily(semibold).size(7).white.make())
              ],
            )
          ],
        ),
      )),
    ));
  }
}
