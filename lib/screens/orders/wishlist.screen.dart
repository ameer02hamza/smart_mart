import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:emart/common_widgets/loading.widget.dart';
import 'package:emart/consts/consts.dart';
import 'package:emart/services/firebase/firestore.service.dart';
import 'package:flutter/material.dart';

class WishListScreen extends StatelessWidget {
  const WishListScreen({super.key});

  @override
  Widget build(BuildContext context) {
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
                  child: emptyOrder
                      .toString()
                      .text
                      .bold
                      .color(darkFontGrey)
                      .makeCentered(),
                );
              }
              var data = snapshot.data!.docs;
              return Container();
            }));
  }
}
