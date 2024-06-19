import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:emart/common_widgets/bg.widget.dart';
import 'package:emart/common_widgets/loading.widget.dart';
import 'package:emart/consts/consts.dart';
import 'package:emart/controllers/product.controller.dart';
import 'package:emart/screens/category/itemDetails.screen.dart';
import 'package:emart/services/firebase/firestore.service.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CategoryDetailsScreen extends StatefulWidget {
  String title;
  CategoryDetailsScreen({super.key, required this.title});

  @override
  State<CategoryDetailsScreen> createState() => _CategoryDetailsScreenState();
}

class _CategoryDetailsScreenState extends State<CategoryDetailsScreen> {
  var controller = Get.find<ProductController>();
  @override
  Widget build(BuildContext context) {
    return bgWidget(
      child: Scaffold(
          appBar: AppBar(
            title: widget.title.text.white.fontFamily(bold).make(),
            iconTheme: const IconThemeData(color: whiteColor),
            centerTitle: true,
          ),
          body: StreamBuilder(
            stream: FirestoreServices.getProducts(widget.title),
            builder: (context, AsyncSnapshot<QuerySnapshot> snapshot) {
              if (!snapshot.hasData) {
                return Center(child: loadingIndicator());
              } else if (snapshot.data!.docs.isEmpty) {
                return Center(
                  child:
                      "No Products Found".text.bold.color(darkFontGrey).make(),
                );
              }
              var data = snapshot.data!.docs;
              return Container(
                padding: const EdgeInsets.all(12),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SingleChildScrollView(
                        physics: const BouncingScrollPhysics(),
                        scrollDirection: Axis.horizontal,
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: List.generate(
                              controller.subCat.length,
                              (index) => controller.subCat[index]
                                  .toString()
                                  .text
                                  .size(12)
                                  .color(darkFontGrey)
                                  .fontFamily(bold)
                                  .makeCentered()
                                  .box
                                  .rounded
                                  .white
                                  .size(150, 60)
                                  .margin(
                                      const EdgeInsets.symmetric(horizontal: 4))
                                  .make()),
                        )),
                    20.heightBox,
                    Expanded(
                      child: GridView.builder(
                          itemCount: data.length,
                          shrinkWrap: true,
                          physics: const BouncingScrollPhysics(),
                          gridDelegate:
                              const SliverGridDelegateWithFixedCrossAxisCount(
                                  crossAxisCount: 2,
                                  crossAxisSpacing: 8,
                                  mainAxisSpacing: 8,
                                  mainAxisExtent: 240),
                          itemBuilder: (context, index) {
                            return Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Image.network(
                                  data[index]["p_imgs"][0],
                                  // width: 200,
                                  // height: 200,
                                  fit: BoxFit.cover,
                                ),
                                const Spacer(),
                                "${data[index]["p_name"]}"
                                    .text
                                    .fontFamily(semibold)
                                    .color(darkFontGrey)
                                    .make(),
                                10.heightBox,
                                "${data[index]["p_price"]}"
                                    .numCurrencyWithLocale(locale: "en_US")
                                    .text
                                    .color(primaryColor)
                                    .fontFamily(bold)
                                    .size(16)
                                    .make(),
                              ],
                            )
                                .box
                                .margin(
                                    const EdgeInsets.symmetric(horizontal: 4))
                                .white
                                .roundedSM
                                .shadowSm
                                .padding(const EdgeInsets.all(8))
                                .make()
                                .onTap(() {
                              controller.checkIf(data[index]);
                              Get.to(() => ItemDetailsScreen(
                                  title: data[index]['p_name'].toUpperCase(),
                                  itemData: data[index]));
                            });
                          }),
                    )
                  ],
                ),
              );
            },
          )),
    );
  }
}
