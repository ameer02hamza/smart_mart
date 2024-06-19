import 'dart:io';
import 'dart:math';

import 'package:emart/common_widgets/exitDialog.widget.dart';
import 'package:emart/consts/consts.dart';
import 'package:emart/controllers/home.controller.dart';
import 'package:emart/screens/cart/cart.screen.dart';
import 'package:emart/screens/category/category.screen.dart';
import 'package:emart/screens/home_screen/home.screen.dart';
import 'package:emart/screens/profile/profile.screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  var controller = Get.put(HomeController());
  var navbarItem = [
    BottomNavigationBarItem(
        icon: Image.asset(
          icHome,
          width: 26,
        ),
        label: home),
    BottomNavigationBarItem(
        icon: Image.asset(
          icCategories,
          width: 26,
        ),
        label: categories),
    BottomNavigationBarItem(
        icon: Image.asset(
          icCart,
          width: 26,
        ),
        label: cart),
    BottomNavigationBarItem(
        icon: Image.asset(
          icProfile,
          width: 26,
        ),
        label: profile),
  ];
  var navBody = [
    const HomeScreen(),
    const CategoryScreen(),
    const CartScreen(),
    const ProfileScreen(),
  ];
  exitApp(value) async {
    showDialog(
        barrierDismissible: false,
        context: context,
        builder: (context) => showDialogWidget(context));
  }

  @override
  void initState() {
    // TODO: implement initState
    controller.getUserDetails();

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return PopScope(
        canPop: false,
        onPopInvoked: (value) {
          exitApp(value);
        },
        child: Scaffold(
          body: Column(children: [
            Obx(() => Expanded(
                  child: navBody.elementAt(controller.currentIndex.value),
                ))
          ]),
          bottomNavigationBar: Obx(() => BottomNavigationBar(
                currentIndex: controller.currentIndex.value,
                selectedItemColor: primaryColor,
                selectedLabelStyle: const TextStyle(fontFamily: semibold),
                type: BottomNavigationBarType.fixed,
                items: navbarItem,
                onTap: (index) {
                  controller.currentIndex.value = index;
                },
              )),
        ));
  }
}
