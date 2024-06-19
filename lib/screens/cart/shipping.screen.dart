import 'package:emart/common_widgets/customTextField.widget.dart';
import 'package:emart/common_widgets/ourButton.widget.dart';
import 'package:emart/consts/consts.dart';
import 'package:emart/controllers/cart.controller.dart';
import 'package:emart/screens/cart/payment.screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ShippingDetails extends StatelessWidget {
  const ShippingDetails({super.key});

  @override
  Widget build(BuildContext context) {
    var controller = Get.find<CartController>();
    GlobalKey<FormState> formkey = GlobalKey<FormState>();
    return Scaffold(
        backgroundColor: whiteColor,
        appBar: AppBar(
          title:
              shippingInfo.text.fontFamily(semibold).color(darkFontGrey).make(),
          centerTitle: true,
        ),
        bottomNavigationBar: ourButton(
                onPress: () {
                  if (formkey.currentState!.validate()) {
                    Get.to(() => const PaymentScreen());
                  }
                },
                title: "Continue",
                color: primaryColor,
                textColor: whiteColor)
            .box
            .width(context.screenWidth)
            .make(),
        body: Padding(
          padding: const EdgeInsets.all(10),
          child: Form(
            key: formkey,
            child: SingleChildScrollView(
                child: Column(
              children: [
                customTextField(
                    hint: "bldg palace Dubai",
                    title: "address",
                    isPass: false,
                    controller: controller.addressController),
                customTextField(
                    hint: "Dubai",
                    title: "city",
                    isPass: false,
                    controller: controller.cityController),
                customTextField(
                    hint: "Dubai",
                    title: "state",
                    isPass: false,
                    controller: controller.stateController),
                customTextField(
                    hint: "00000",
                    title: "postal code",
                    isPass: false,
                    controller: controller.postalController),
                customTextField(
                    hint: "00000",
                    title: "phone code",
                    isPass: false,
                    controller: controller.phoneController),
              ],
            )),
          ),
        ));
  }
}
