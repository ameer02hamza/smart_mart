import 'package:emart/common_widgets/loading.widget.dart';
import 'package:emart/common_widgets/ourButton.widget.dart';
import 'package:emart/consts/consts.dart';
import 'package:emart/consts/list.dart';
import 'package:emart/controllers/cart.controller.dart';
import 'package:emart/screens/home_screen/home.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class PaymentScreen extends StatelessWidget {
  const PaymentScreen({super.key});

  @override
  Widget build(BuildContext context) {
    var controller = Get.put(CartController());
    return Scaffold(
      backgroundColor: whiteColor,
      appBar: AppBar(
        title: "Choose Payment Method"
            .text
            .size(16)
            .color(darkFontGrey)
            .fontFamily(semibold)
            .make(),
        centerTitle: true,
      ),
      body: Container(
          padding: const EdgeInsets.all(10),
          child: Column(
            children: List.generate(paymentMethodsImgs.length, (index) {
              return Obx(() => Container(
                  clipBehavior: Clip.antiAlias,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(12),
                  ),
                  margin: const EdgeInsets.only(bottom: 10),
                  child: Stack(
                    alignment: Alignment.topRight,
                    children: [
                      Image.asset(
                        colorBlendMode: controller.paymentIndex.value == index
                            ? BlendMode.darken
                            : BlendMode.color,
                        color: controller.paymentIndex.value == index
                            ? Colors.black.withOpacity(0.3)
                            : Colors.transparent,
                        paymentMethodsImgs[index],
                        width: double.infinity,
                        // height: 100,
                        fit: BoxFit.cover,
                      ),
                      if (controller.paymentIndex.value == index)
                        Transform.scale(
                          scale: 1.5,
                          child: Checkbox(
                            value: true,
                            onChanged: (value) {},
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(12),
                            ),
                            activeColor: primaryColor,
                            checkColor: whiteColor,
                          ),
                        ),
                      Positioned(
                        bottom: 5,
                        right: 5,
                        child: paymentMethods[index]
                            .text
                            .color(whiteColor)
                            .fontFamily(semibold)
                            .size(18)
                            .bold
                            .make(),
                      )
                    ],
                  ))).onTap(() {
                controller.paymentIndex.value = index;
              });
            }),
          )),
      bottomNavigationBar: Obx(() => controller.placingOrder.value
          ? Center(
              child: loadingIndicator(),
            )
          : SizedBox(
              width: context.screenWidth - 50,
              child: ourButton(
                title: placeOrder,
                onPress: () async {
                  await controller.placeMyOrder();
                  await controller.clearCart();
                  Get.offAll(() => const Home());
                },
                color: primaryColor,
                textColor: whiteColor,
              ).box.margin(const EdgeInsets.symmetric(horizontal: 5)).make(),
            )),
    );
  }
}
