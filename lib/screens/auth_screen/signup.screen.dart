import 'package:emart/common_widgets/applogo.widget.dart';
import 'package:emart/common_widgets/bg.widget.dart';
import 'package:emart/common_widgets/authTextField.widget.dart';
import 'package:emart/common_widgets/ourButton.widget.dart';
import 'package:emart/controllers/auth.controller.dart';
import 'package:emart/consts/colors.dart';
import 'package:emart/consts/strings.dart';
import 'package:emart/consts/styles.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:velocity_x/velocity_x.dart';

class SignupScreen extends StatefulWidget {
  const SignupScreen({super.key});

  @override
  State<SignupScreen> createState() => _SignupScreenState();
}

class _SignupScreenState extends State<SignupScreen> {
  bool isAgreed = true;
  var controller = Get.put(AuthController());
  TextEditingController nameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController reTypePasswordController = TextEditingController();
  GlobalKey<FormState> formkey = GlobalKey<FormState>();
  signUpMethod() async {
    try {
      setState(() {
        isAgreed = false;
      });
      if (formkey.currentState!.validate()) {
        UserCredential? userData = await controller.signupMethod(
            context: context,
            name: nameController.text.text,
            email: emailController.text,
            password: passwordController.text);
        if (userData != null) {
          await controller.storeUserData(
              name: nameController.text,
              email: emailController.text,
              password: passwordController.text);
          passwordController.text = "";
          reTypePasswordController.text = "";
          Get.back();
        }
      }
      reTypePasswordController.text = "";
    } catch (e) {
      controller.logoutMethod(context: context);
    }
    setState(() {
      isAgreed = true;
    });
  }

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
            "Join $appname".text.fontFamily(bold).white.size(18).make(),
            10.heightBox,
            Form(
                    key: formkey,
                    child: Column(
                      children: [
                        authTextField(
                          title: name,
                          hint: nameHint,
                          controller: nameController,
                        ),
                        authTextField(
                          title: email,
                          hint: emailHint,
                          controller: emailController,
                        ),
                        authTextField(
                          title: password,
                          hint: passwordHint,
                          controller: passwordController,
                        ),
                        authTextField(
                          title: confirmPassword,
                          hint: confirmPasswordHint,
                          controller: reTypePasswordController,
                          validator: passwordController.text,
                          confirmPassword: true,
                        ),
                        5.heightBox,
                        ourButton(
                                color: isAgreed ? primaryColor : fontGrey,
                                onPress: isAgreed ? signUpMethod : null,
                                title: signup,
                                textColor: whiteColor)
                            .box
                            .width(context.screenWidth - 70)
                            .make(),
                        5.heightBox,
                        Row(
                          children: [
                            Checkbox(
                                checkColor: primaryColor,
                                fillColor:
                                    WidgetStateProperty.all(lightPrimary),
                                side: const BorderSide(color: primaryColor),
                                value: isAgreed,
                                onChanged: (newValue) {
                                  setState(() {
                                    isAgreed = newValue!;
                                  });
                                }),
                            10.widthBox,
                            Expanded(
                                child: RichText(
                                    text: TextSpan(children: [
                              TextSpan(
                                  text: "I agree to the ".toUpperCase(),
                                  style: const TextStyle(
                                      color: fontGrey, fontFamily: regular)),
                              TextSpan(
                                  text: termsAndConditions.toUpperCase(),
                                  style: const TextStyle(
                                      fontFamily: regular,
                                      color: primaryColor,
                                      decoration: TextDecoration.none)),
                              TextSpan(
                                  text: " & ".toUpperCase(),
                                  style: const TextStyle(
                                      fontFamily: regular, color: fontGrey)),
                              TextSpan(
                                  text: privacyPolicy.toUpperCase(),
                                  style: const TextStyle(
                                      fontFamily: regular,
                                      color: primaryColor,
                                      decoration: TextDecoration.none))
                            ])))
                          ],
                        ),
                        10.heightBox,
                        RichText(
                            text: const TextSpan(children: [
                          TextSpan(
                              text: alreadyHaveAnAccount,
                              style: TextStyle(color: fontGrey)),
                          TextSpan(
                              text: " $login",
                              style: TextStyle(
                                  color: primaryColor,
                                  decoration: TextDecoration.underline))
                        ])).onTap(() {
                          Get.back();
                        })
                      ],
                    ))
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
