import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:emart/common_widgets/loading.widget.dart';
import 'package:emart/consts/consts.dart';
import 'package:emart/screens/orders/orderDetails.screen.dart';
import 'package:emart/services/firebase/firestore.service.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class OrderScreen extends StatelessWidget {
  const OrderScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: whiteColor,
        appBar: AppBar(
            title: "My Orders"
                .text
                .color(darkFontGrey)
                .fontFamily(semibold)
                .make()),
        body: StreamBuilder(
            stream: FirestoreServices.getAllOrders(),
            builder: (context, AsyncSnapshot<QuerySnapshot> snapshot) {
              if (!snapshot.hasData) {
                return Center(child: loadingIndicator());
              } else if (snapshot.data!.docs.isEmpty) {
                return Center(
                  child: emptyOrder
                      .toString()
                      .text
                      .bold
                      .color(darkFontGrey)
                      .makeCentered(),
                );
              }
              var data = snapshot.data!.docs;
              return ListView.builder(
                  itemCount: data.length,
                  itemBuilder: (context, index) {
                    return ListTile(
                      leading: "${index + 1}"
                          .text
                          .fontFamily(bold)
                          .color(darkFontGrey)
                          .xl
                          .make(),
                      title: data[index]['order_code']
                          .toString()
                          .text
                          .color(primaryColor)
                          .make(),
                      subtitle: data[index]['total_amount']
                          .toString()
                          .numCurrencyWithLocale(locale: "en_US")
                          .text
                          .make(),
                      trailing: IconButton(
                        icon: const Icon(Icons.arrow_forward_ios),
                        onPressed: () {
                          Get.to(
                              () => OrderDetailsScreen(orderData: data[index]));
                        },
                      ),
                    );
                  });
            }));
  }
}
