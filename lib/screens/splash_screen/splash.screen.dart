import 'package:emart/common_widgets/applogo.widget.dart';
import 'package:emart/consts/colors.dart';
import 'package:emart/consts/consts.dart';
import 'package:emart/screens/auth_screen/login.screen.dart';
import 'package:emart/screens/home_screen/home.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  changeScreen() async {
    await Future.delayed(const Duration(seconds: 3));
    firebaseAuth.authStateChanges().listen((User? user) {
      print("%c chnage state user $user");
      if (user == null) {
        Get.offAll(() => const LoginScreen());
      } else {
        Get.offAll(() => const Home());
      }
    });
  }

  @override
  void initState() {
    changeScreen();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: primaryColor,
      body: Center(
        child: Column(
          children: [
            Align(
              alignment: Alignment.topCenter,
              child: Image.asset(
                icSplashBg,
                width: 300,
              ),
            ),
            20.heightBox,
            appLogoWidget(),
            10.heightBox,
            appname.text.fontFamily(bold).size(20).white.make(),
            5.heightBox,
            appversion.text.white.make(),
            const Spacer(),
            devName.text.white.make(),
            credits.text.white.make(),
          ],
        ),
      ),
    );
  }
}
