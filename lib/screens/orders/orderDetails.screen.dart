import 'package:emart/consts/consts.dart';
import 'package:emart/screens/orders/components/orderPlace.component.dart';
import 'package:emart/screens/orders/components/orderStatus.component.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart' as intl;

class OrderDetailsScreen extends StatelessWidget {
  var orderData;
  OrderDetailsScreen({required this.orderData});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: whiteColor,
      appBar: AppBar(
          title: "Order Details"
              .text
              .color(darkFontGrey)
              .fontFamily(semibold)
              .make()),
      body: Padding(
          padding: const EdgeInsets.all(10),
          child: SingleChildScrollView(
              physics: const BouncingScrollPhysics(),
              child: Column(children: [
                orderStatus(
                  color: primaryColor,
                  icon: Icons.done,
                  title: "Placed",
                  showDone: orderData['order_placed'],
                ),
                orderStatus(
                  color: Colors.blue,
                  icon: Icons.thumb_up,
                  title: "Confirmed",
                  showDone: orderData['order_confirmed'],
                ),
                orderStatus(
                  color: const Color.fromRGBO(230, 207, 1, 1),
                  icon: Icons.car_crash,
                  title: "Out for delivery",
                  showDone: orderData['order_on_delivery'],
                ),
                orderStatus(
                  color: successColor,
                  icon: Icons.done_all,
                  title: "Delivered",
                  showDone: orderData['order_delivered'],
                ),
                const Divider(),
                Column(
                  children: [
                    orderPlaceDetails(
                        title1: "Order Code",
                        d1: orderData['order_code'],
                        title2: "Shipping Method",
                        d2: orderData['shipping_method']),
                    orderPlaceDetails(
                        title1: "Order Date",
                        d1: intl.DateFormat.yMMMMd('en_US').format(
                            DateTime.parse(orderData['order_time'].toString())),
                        title2: "Payment Method",
                        d2: orderData['payment_method']),
                    orderPlaceDetails(
                        title1: "Payment Status",
                        d1: "Unpaid",
                        title2: "Delivery Status",
                        d2: orderData['order_delivered']
                            ? "Delivered"
                            : "Not Delivered"),
                    Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 10),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                "Shipping Address"
                                    .text
                                    .bold
                                    .color(darkFontGrey)
                                    .make(),
                                orderData['order_by_address']
                                    .toString()
                                    .text
                                    .color(darkFontGrey)
                                    .fontFamily(bold)
                                    .make(),
                                orderData['order_by_email']
                                    .toString()
                                    .text
                                    .color(darkFontGrey)
                                    .fontFamily(bold)
                                    .make(),
                                orderData['order_by_name']
                                    .toString()
                                    .text
                                    .color(darkFontGrey)
                                    .fontFamily(bold)
                                    .make(),
                                orderData['order_by_phone']
                                    .toString()
                                    .text
                                    .color(darkFontGrey)
                                    .fontFamily(bold)
                                    .make(),
                                orderData['order_by_postalcode']
                                    .toString()
                                    .text
                                    .color(darkFontGrey)
                                    .fontFamily(bold)
                                    .make(),
                                //TODO: Add city to the order data
                                // orderData['order_by_city']
                                //     .toString()
                                //     .text
                                //     .color(darkFontGrey)
                                //     .fontFamily(bold)
                                //     .make(),
                              ],
                            ),
                            SizedBox(
                                width: context.screenWidth / 4,
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  children: [
                                    "Total Amount"
                                        .text
                                        .bold
                                        .color(darkFontGrey)
                                        .make(),
                                    "${orderData['total_amount']}"
                                        .numCurrencyWithLocale(locale: "en_US")
                                        .text
                                        .bold
                                        .color(primaryColor)
                                        .make(),
                                  ],
                                ))
                          ],
                        ))
                  ],
                )
                    .box
                    .outerShadowMd
                    .white
                    .padding(const EdgeInsets.all(10))
                    .make(),
                const Divider(),
                "Ordered Product".text.fontFamily(bold).size(18).makeCentered(),
                10.heightBox,
                ListView(
                  physics: NeverScrollableScrollPhysics(),
                  shrinkWrap: true,
                  children: List.generate(orderData['orders'].length, (index) {
                    return Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        orderPlaceDetails(
                            title1: orderData['orders'][index]["title"],
                            d1: "x${orderData['orders'][index]["qty"]}",
                            title2: orderData['orders'][index]["totalPrice"],
                            d2: "Refundable"),
                        Padding(
                          padding: const EdgeInsets.all(10),
                          child: Container(
                              width: 30,
                              height: 10,
                              color: Color(int.parse(
                                  orderData['orders'][index]["color"]))),
                        ),
                        const Divider()
                      ],
                    );
                  }).toList(),
                )
                    .box
                    .outerShadowMd
                    .white
                    .padding(const EdgeInsets.all(10))
                    .make(),
                10.heightBox,
              ]))),
    );
  }
}
