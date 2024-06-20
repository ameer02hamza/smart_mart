import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:emart/common_widgets/loading.widget.dart';
import 'package:emart/consts/consts.dart';
import 'package:emart/controllers/product.controller.dart';
import 'package:emart/services/firebase/firestore.service.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class WishListScreen extends StatelessWidget {
  const WishListScreen({super.key});

  @override
  Widget build(BuildContext context) {
    var controller = Get.put(ProductController());
    return Scaffold(
        backgroundColor: whiteColor,
        appBar: AppBar(
            title: "My Wish Lists"
                .text
                .color(darkFontGrey)
                .fontFamily(semibold)
                .make()),
        body: StreamBuilder(
            stream: FirestoreServices.getWishList(),
            builder: (context, AsyncSnapshot<QuerySnapshot> snapshot) {
              if (!snapshot.hasData) {
                return Center(child: loadingIndicator());
              } else if (snapshot.data!.docs.isEmpty) {
                return Center(
                  child: emptyWishList
                      .toString()
                      .text
                      .bold
                      .color(darkFontGrey)
                      .makeCentered(),
                );
              }
              var data = snapshot.data!.docs;
              return ListView.builder(
                shrinkWrap: true,
                  itemCount: data.length,
                  itemBuilder: (context, index) {
                    return ListTile(
                      title: "${data[index]["p_category"]}"
                          .toString()
                          .text
                          .color(darkFontGrey)
                          .fontFamily(bold)
                          .make(),
                      subtitle: data[index]["p_price"]
                          .toString()
                          .numCurrencyWithLocale()
                          .text
                          .color(primaryColor)
                          .fontFamily(semibold)
                          .make(),
                      leading: Image.network(data[index]["p_imgs"][1]),
                      trailing: IconButton(
                        icon: const Icon(Icons.favorite, color: primaryColor),
                        onPressed: () {
                          controller.removeFromWishList(data[index].id);
                        },
                      ),
                    );
                  });
            }));
  }
}
