import 'package:emart/common_widgets/ourButton.widget.dart';
import 'package:emart/consts/consts.dart';
import 'package:emart/consts/list.dart';
import 'package:flutter/material.dart';

class ItemDetailsScreen extends StatefulWidget {
  String title;
  ItemDetailsScreen({super.key, required this.title});

  @override
  State<ItemDetailsScreen> createState() => _ItemDetailsScreenState();
}

class _ItemDetailsScreenState extends State<ItemDetailsScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: whiteColor,
      appBar: AppBar(
        title: widget.title.text.color(darkFontGrey).make(),
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
                padding: EdgeInsets.all(8),
                child: SingleChildScrollView(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      VxSwiper.builder(
                        aspectRatio: 16 / 9,
                        height: 300,
                        autoPlay: true,
                        enlargeCenterPage: true,
                        itemCount: slidersList.length,
                        itemBuilder: (context, index) {
                          return Image.asset(
                            slidersList[index],
                            fit: BoxFit.fill,
                            width: double.infinity,
                          )
                              .box
                              .rounded
                              .clip(Clip.antiAlias)
                              .margin(const EdgeInsets.symmetric(horizontal: 8))
                              .make();
                        },
                      ),
                      10.heightBox,
                      widget.title.text
                          .size(16)
                          .color(darkFontGrey)
                          .bold
                          .make(),
                      10.heightBox,
                      VxRating(
                        onRatingUpdate: (value) {},
                        normalColor: textfieldGrey,
                        selectionColor: golden,
                        // maxRating: 5,
                        count: 5,
                        size: 25,
                        stepInt: true,
                      ),
                      10.heightBox,
                      "\$30,000".text.size(20).bold.color(primaryColor).make(),
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
                                "In House Brands"
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
                          .padding(const EdgeInsets.symmetric(horizontal: 4))
                          .color(textfieldGrey)
                          .make(),
                      20.heightBox,
                      Column(
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
                                  return VxBox()
                                      .roundedFull
                                      .color(Vx.randomPrimaryColor)
                                      .size(40, 40)
                                      .margin(const EdgeInsets.symmetric(
                                          horizontal: 4))
                                      .make();
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
                                children: [
                                  IconButton(
                                    onPressed: () {},
                                    icon: Icon(Icons.remove),
                                  ),
                                  "0"
                                      .text
                                      .size(16)
                                      .color(darkFontGrey)
                                      .bold
                                      .make(),
                                  IconButton(
                                    onPressed: () {},
                                    icon: Icon(Icons.add),
                                  ),
                                  10.widthBox,
                                  "(0 available)"
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
                              "\$0.0"
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
                      10.heightBox,
                      "Description"
                          .text
                          .color(darkFontGrey)
                          .fontFamily(semibold)
                          .make(),
                      10.heightBox,
                      "Make your training to the next level with this durable football "
                              "designed for endless hours of practice and peak performance. Score like a champion! "
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
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
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
            onPress: () {},
            title: "Add to Cart",
            textColor: whiteColor,
          )
              .box
              .width(context.screenWidth)
              .padding(const EdgeInsets.all(10))
              .make(),
        )
      ]),
    );
  }
}
