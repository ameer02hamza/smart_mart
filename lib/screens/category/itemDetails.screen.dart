import 'package:emart/common_widgets/ourButton.widget.dart';
import 'package:emart/consts/consts.dart';
import 'package:emart/consts/list.dart';
import 'package:emart/controllers/product.controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ItemDetailsScreen extends StatelessWidget {
  String title;
  dynamic itemData;
  ItemDetailsScreen({super.key, required this.title, required this.itemData});

  @override
  Widget build(BuildContext context) {
    var controller = Get.find<ProductController>();
    return PopScope(
        onPopInvoked: (value) {
          controller.resetValues();
        },
        canPop: true,
        child: Scaffold(
          backgroundColor: whiteColor,
          appBar: AppBar(
            leading: IconButton(
                onPressed: () {
                  controller.resetValues();
                  Get.back();
                },
                icon: const Icon(
                  Icons.arrow_back_ios,
                )),
            title: title.text.color(darkFontGrey).make(),
            iconTheme: const IconThemeData(color: darkFontGrey),
            actions: [
              IconButton(
                onPressed: () {},
                icon: const Icon(
                  Icons.share_outlined,
                  color: darkFontGrey,
                ),
              ),
              IconButton(
                onPressed: () {},
                icon: const Icon(
                  Icons.favorite_outline,
                  color: darkFontGrey,
                ),
              ),
            ],
          ),
          body: Column(children: [
            Expanded(
                child: Padding(
                    padding: const EdgeInsets.all(8),
                    child: SingleChildScrollView(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          VxSwiper.builder(
                            aspectRatio: 16 / 9,
                            height: 300,
                            autoPlay: true,
                            enlargeCenterPage: true,
                            viewportFraction: 1.0,
                            itemCount: itemData['p_imgs'].length,
                            itemBuilder: (context, index) {
                              return Image.network(
                                itemData['p_imgs'][index],
                                fit: BoxFit.fill,
                                width: double.infinity,
                              )
                                  .box
                                  .rounded
                                  .clip(Clip.antiAlias)
                                  .margin(
                                      const EdgeInsets.symmetric(horizontal: 8))
                                  .make();
                            },
                          ),
                          10.heightBox,
                          title.text.size(16).color(darkFontGrey).bold.make(),
                          10.heightBox,
                          VxRating(
                            isSelectable: false,
                            onRatingUpdate: (value) {},
                            normalColor: textfieldGrey,
                            selectionColor: golden,
                            // maxRating: 5,
                            count: int.parse(itemData['p_rating']),
                            size: 25,
                            // stepInt: true,
                          ),
                          10.heightBox,
                          "${itemData["p_price"]}"
                              .numCurrencyWithLocale(locale: "en_US")
                              .text
                              .size(20)
                              .bold
                              .color(primaryColor)
                              .make(),
                          20.heightBox,
                          Row(
                            children: [
                              Expanded(
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    "Seller"
                                        .text
                                        .white
                                        .size(16)
                                        .semiBold
                                        .color(darkFontGrey)
                                        .make(),
                                    10.heightBox,
                                    "${itemData["p_seller"]}"
                                        .text
                                        .size(16)
                                        .semiBold
                                        .color(darkFontGrey)
                                        .make(),
                                  ],
                                ),
                              ),
                              const CircleAvatar(
                                  backgroundColor: whiteColor,
                                  radius: 25,
                                  child: Icon(
                                    Icons.message,
                                    color: darkFontGrey,
                                  )),
                            ],
                          )
                              .box
                              .height(79)
                              .padding(
                                  const EdgeInsets.symmetric(horizontal: 4))
                              .color(textfieldGrey)
                              .make(),
                          20.heightBox,
                          Obx(
                            () => Container(
                              child: Column(
                                children: [
                                  Row(
                                    children: [
                                      SizedBox(
                                        width: 100,
                                        child: "Color"
                                            .text
                                            .size(16)
                                            .semiBold
                                            .color(textfieldGrey)
                                            .make(),
                                      ),
                                      Row(
                                        children: List.generate(3, (index) {
                                          return Stack(
                                            alignment: Alignment.center,
                                            children: [
                                              VxBox()
                                                  .roundedFull
                                                  .color(Color(int.parse(
                                                      itemData["p_colors"]
                                                          [index])))
                                                  .size(40, 40)
                                                  .margin(const EdgeInsets
                                                      .symmetric(horizontal: 4))
                                                  .make()
                                                  .onTap(() {
                                                controller.colorIndex.value =
                                                    index;
                                              }),
                                              Visibility(
                                                  visible: index ==
                                                      controller
                                                          .colorIndex.value,
                                                  child: const Icon(
                                                    Icons.check,
                                                    color: whiteColor,
                                                  ))
                                            ],
                                          );
                                        }),
                                      )
                                    ],
                                  ).box.padding(const EdgeInsets.all(8)).make(),
                                  10.heightBox,
                                  Row(
                                    children: [
                                      SizedBox(
                                        width: 100,
                                        child: "Pieces"
                                            .text
                                            .size(16)
                                            .semiBold
                                            .color(textfieldGrey)
                                            .make(),
                                      ),
                                      Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.start,
                                        children: [
                                          IconButton(
                                            onPressed: () {
                                              if (controller
                                                      .itemQuantity.value >
                                                  0) {
                                                controller.totalPrice.value -=
                                                    double.parse(
                                                        itemData["p_price"]);
                                                controller.itemQuantity.value--;
                                              }
                                            },
                                            icon: const Icon(Icons.remove),
                                          ),
                                          "${controller.itemQuantity.value}"
                                              .text
                                              .size(16)
                                              .color(darkFontGrey)
                                              .bold
                                              .make(),
                                          IconButton(
                                            onPressed: () {
                                              if (int.parse(
                                                      itemData["p_quantity"]) >
                                                  controller
                                                      .itemQuantity.value) {
                                                controller.totalPrice.value +=
                                                    double.parse(
                                                        itemData["p_price"]);
                                                controller.itemQuantity.value++;
                                              }
                                            },
                                            icon: const Icon(Icons.add),
                                          ),
                                          // .widthBox,

                                          "(${itemData["p_quantity"]} available)"
                                              .text
                                              .size(16)
                                              .color(darkFontGrey)
                                              .make(),
                                        ],
                                      )
                                    ],
                                  ).box.padding(const EdgeInsets.all(8)).make(),
                                  10.heightBox,
                                  Row(
                                    children: [
                                      SizedBox(
                                        width: 100,
                                        child: "Total"
                                            .text
                                            .size(16)
                                            .semiBold
                                            .color(textfieldGrey)
                                            .make(),
                                      ),
                                      "${controller.totalPrice.value}"
                                          .numCurrencyWithLocale(
                                              locale: "en_US")
                                          .text
                                          .color(primaryColor)
                                          .size(16)
                                          .bold
                                          .make(),
                                    ],
                                  )
                                      .box
                                      .color(lightPrimary)
                                      .padding(const EdgeInsets.all(8))
                                      .make()
                                ],
                              )
                                  .box
                                  .shadowSm
                                  .white
                                  .padding(const EdgeInsets.all(8))
                                  .make(),
                            ),
                          ),
                          10.heightBox,
                          "Description"
                              .text
                              .color(darkFontGrey)
                              .fontFamily(semibold)
                              .make(),
                          10.heightBox,
                          "${itemData['p_desc']}"
                              .text
                              .color(darkFontGrey)
                              .make(),
                          ListView(
                            shrinkWrap: true,
                            physics: const NeverScrollableScrollPhysics(),
                            children: List.generate(5, (index) {
                              return ListTile(
                                title: itemCategoryList[index]
                                    .text
                                    .fontFamily(semibold)
                                    .color(darkFontGrey)
                                    .make(),
                                trailing: const Icon(Icons.arrow_forward_ios),
                              );
                            }),
                          ),
                          10.heightBox,
                          productsYouMayLike.text
                              .fontFamily(bold)
                              .size(16)
                              .color(darkFontGrey)
                              .make(),
                          10.heightBox,
                          SingleChildScrollView(
                              scrollDirection: Axis.horizontal,
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceAround,
                                children: List.generate(
                                    6,
                                    (index) => Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            Image.asset(
                                              imgP1,
                                              width: 150,
                                              fit: BoxFit.cover,
                                            ),
                                            10.heightBox,
                                            "Laptop 40GB/256GB"
                                                .text
                                                .fontFamily(semibold)
                                                .color(darkFontGrey)
                                                .make(),
                                            10.heightBox,
                                            "\$600"
                                                .text
                                                .color(primaryColor)
                                                .fontFamily(bold)
                                                .size(16)
                                                .make(),
                                          ],
                                        )
                                            .box
                                            .margin(const EdgeInsets.symmetric(
                                                horizontal: 4))
                                            .white
                                            .roundedSM
                                            .padding(const EdgeInsets.all(8))
                                            .make()),
                              )),
                        ],
                      ),
                    ))),
            SizedBox(
              child: ourButton(
                color: primaryColor,
                onPress: () {
                  if (controller.itemQuantity.value > 0) {
                    controller.addToCart(
                      context: context,
                      color: itemData["p_colors"][controller.colorIndex.value],
                      img: itemData["p_imgs"][0],
                      price: itemData["p_price"],
                      qty: controller.itemQuantity.value,
                      sellerName: itemData["p_seller"],
                      title: itemData["p_name"],
                    );
                    VxToast.show(context,
                        msg: addedCart,
                        textColor: whiteColor,
                        bgColor: successColor,
                        position: VxToastPosition.top,
                        showTime: 4000);
                    return;
                  }
                  VxToast.show(context,
                      msg: "Please select quantity",
                      textColor: whiteColor,
                      bgColor: Colors.red,
                      position: VxToastPosition.top,
                      showTime: 4000);
                },
                title: "Add to Cart",
                textColor: whiteColor,
              )
                  .box
                  .width(context.screenWidth)
                  .padding(const EdgeInsets.all(10))
                  .make(),
            )
          ]),
        ));
  }
}
