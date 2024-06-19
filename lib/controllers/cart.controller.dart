import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:emart/consts/consts.dart';
import 'package:emart/consts/list.dart';
import 'package:emart/controllers/home.controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CartController extends GetxController {
  var totalP = 0.0.obs;
  var addressController = TextEditingController();
  var cityController = TextEditingController();
  var stateController = TextEditingController();
  var postalController = TextEditingController();
  var phoneController = TextEditingController();
  var paymentIndex = 0.obs;
  late dynamic productSnapshots;
  var products = [];
  var placingOrder = false.obs;
  calculateTotalPrice(data) {
    totalP = 0.0.obs;
    for (var i = 0; i < data.length; i++) {
      totalP.value =
          totalP.value + double.parse(data[i]["totalPrice"].toString());
    }
    //  update();
  }

  placeMyOrder() async {
    products.clear();
    placingOrder(true);
    await getProductDetails();
    await firebaseStore.collection(orderCollection).doc().set({
      "order_code": "12321",
      "order_by": currentUser!.uid,
      "order_by_name": Get.find<HomeController>().name.value,
      "order_by_email": currentUser!.email,
      "order_by_address": addressController.text,
      "order_by_phone": phoneController.text,
      "order_by_postalcode": postalController.text,
      "shipping_method": "Home Delivery",
      "payment_method": paymentMethods[paymentIndex.value],
      "order_placed": true,
      "order_confirmed": false,
      "order_delivered": false,
      "order_canceled": false,
      "order_on_delivery": false,
      "order_time": DateTime.now().toLocal().toString(),
      "total_amount": totalP.value,
      "orders": FieldValue.arrayUnion(products),
    });
    placingOrder(false);
  }

  getProductDetails() {
    for (var i = 0; i < productSnapshots.length; i++) {
      products.add({
        "title": productSnapshots[i]["title"],
        "color": productSnapshots[i]["color"],
        "img": productSnapshots[i]["img"],
        "vendor_id": productSnapshots[i]["vendor_id"],
        "qty": productSnapshots[i]["qty"],
        "sellerName": productSnapshots[i]["sellerName"],
        "totalPrice": productSnapshots[i]["totalPrice"],
      });
    }
  }

  clearCart() async {
    for (var i = 0; i < productSnapshots.length; i++) {
      await firebaseStore
          .collection(cartCollection)
          .doc(productSnapshots[i].id)
          .delete();
    }
  }
}
