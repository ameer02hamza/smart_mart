import 'package:emart/common_widgets/applogo.widget.dart';
import 'package:emart/common_widgets/bg.widget.dart';
import 'package:emart/common_widgets/customTextField.widget.dart';
import 'package:emart/common_widgets/ourButton.widget.dart';
import 'package:emart/consts/consts.dart';
import 'package:emart/consts/list.dart';
import 'package:emart/screens/auth_screen/signup.screen.dart';
import 'package:emart/screens/home_screen/home.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  @override
  Widget build(BuildContext context) {
    return bgWidget(
        child: Scaffold(
      resizeToAvoidBottomInset: false,
      body: Center(
        child: Column(
          children: [
            (context.screenHeight * 0.07).heightBox,
            appLogoWidget(),
            10.heightBox,
            "Login into $appname".text.fontFamily(bold).white.size(18).make(),
            10.heightBox,
            Column(
              children: [
                customTextField(
                  title: "Email",
                  hint: "Enter your email",
                ),
                customTextField(
                  title: "Password",
                  hint: "***********",
                ),
                Align(
                    alignment: Alignment.centerRight,
                    child: TextButton(
                        onPressed: () {}, child: forgotPassword.text.make())),
                5.heightBox,
                ourButton(
                        color: primaryColor,
                        onPress: () {
                          Get.to(() => const Home());
                        },
                        title: login,
                        textColor: whiteColor)
                    .box
                    .width(context.screenWidth - 70)
                    .make(),
                5.heightBox,
                createNewAccount.text.color(fontGrey).make(),
                5.heightBox,
                ourButton(
                        color: lightPrimary,
                         onPress: () {
                          Get.to(() => const SignupScreen());
                        },
                        title: signup,
                        textColor: primaryColor)
                    .box
                    .width(context.screenWidth - 70)
                    .make(),
                5.heightBox,
                Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: List.generate(
                        3,
                        (index) => Container(
                            margin: const EdgeInsets.only(left: 3),
                            child: CircleAvatar(
                              backgroundColor: lightGrey,
                              radius: 25,
                              child: Image.asset(
                                socialIcons[index],
                                width: 30,
                              ),
                            ))))
              ],
            )
                .box
                .white
                .rounded
                .padding(const EdgeInsets.all(16))
                .width(context.screenWidth - 70)
                .shadow2xl
                .make()
          ],
        ),
      ),
    ));
  }
}
