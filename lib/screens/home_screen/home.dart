import 'package:emart/consts/consts.dart';
import 'package:emart/controllers/home.controller.dart';
import 'package:emart/screens/cart/cart.screen.dart';
import 'package:emart/screens/category/category.screen.dart';
import 'package:emart/screens/home_screen/home.screen.dart';
import 'package:emart/screens/profile/profile.screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
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
  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
    );
  }
}
