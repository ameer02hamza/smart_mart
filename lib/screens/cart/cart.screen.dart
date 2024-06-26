import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:emart/common_widgets/loading.widget.dart';
import 'package:emart/common_widgets/ourButton.widget.dart';
import 'package:emart/consts/colors.dart';
import 'package:emart/consts/consts.dart';
import 'package:emart/consts/firebase.const.dart';
import 'package:emart/controllers/cart.controller.dart';
import 'package:emart/screens/cart/shippingAddress.screen.dart';
import 'package:emart/services/firebase/firestore.service.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CartScreen extends StatelessWidget {
  const CartScreen({super.key});

  @override
  Widget build(BuildContext context) {
    var controller = Get.put(CartController());
    return Scaffold(
      backgroundColor: whiteColor,
      appBar: AppBar(
        title: "Shopping Cart"
            .text
            .color(darkFontGrey)
            .fontFamily(semibold)
            .make(),
        centerTitle: true,
      ),
      body: StreamBuilder(
        stream: FirestoreServices.getCartData(currentUser!.uid),
        builder: (context, AsyncSnapshot<QuerySnapshot> snapshot) {
          if (!snapshot.hasData) {
            return Center(child: loadingIndicator());
          } else if (snapshot.data!.docs.isEmpty) {
            controller.totalP(0);
            return Center(
              child: emptyCart.toString().text.bold.color(darkFontGrey).make(),
            );
          }
          var data = snapshot.data!.docs;
          controller.calculateTotalPrice(data);
          controller.productSnapshots = data;
          return Padding(
            padding: const EdgeInsets.all(10),
            child: Column(
              children: [
                Expanded(
                  child: ListView.builder(
                      itemCount: data.length,
                      itemBuilder: (context, index) {
                        return ListTile(
                          title:
                              "${data[index]["title"] + " x" + data[index]["qty"].toString()}"
                                  .toString()
                                  .text
                                  .color(darkFontGrey)
                                  .fontFamily(bold)
                                  .make(),
                          subtitle: data[index]["totalPrice"]
                              .toString()
                              .numCurrencyWithLocale()
                              .text
                              .color(primaryColor)
                              .fontFamily(semibold)
                              .make(),
                          leading: Image.network(data[index]["img"]),
                          trailing: IconButton(
                            icon: const Icon(Icons.delete, color: errorColor),
                            onPressed: () {
                              FirestoreServices.deleteCartDoc(data[index].id);
                            },
                          ),
                        );
                      }),
                ),
                5.heightBox,
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    totalPrice
                        .toString()
                        .text
                        .color(darkFontGrey)
                        .fontFamily(semibold)
                        .make(),
                    Obx(
                      () => "${controller.totalP.value}"
                          .text
                          .color(errorColor)
                          .fontFamily(semibold)
                          .make(),
                    )
                  ],
                )
                    .box
                    .padding(const EdgeInsets.all(12))
                    .roundedSM
                    .width(context.screenWidth - 50)
                    .color(lightPrimary)
                    .make(),
              ],
            ),
          );
        },
      ),
      bottomNavigationBar: SizedBox(
        width: context.screenWidth - 50,
        child: ourButton(
          title: proceedToShipping,
          onPress: () {
            if (controller.totalP.value > 0) {
              print(controller.totalP.value);
              Get.to(() => const ShippingDetails());
            }
          },
          color: primaryColor,
          textColor: whiteColor,
        ),
      ),
    );
  }
}
