import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:emart/common_widgets/homeButtons.widget.dart';
import 'package:emart/common_widgets/loading.widget.dart';
import 'package:emart/consts/colors.dart';
import 'package:emart/consts/consts.dart';
import 'package:emart/consts/list.dart';
import 'package:emart/screens/home_screen/components/featured.button.dart';
import 'package:emart/services/firebase/firestore.service.dart';
import 'package:flutter/material.dart';
import 'package:velocity_x/velocity_x.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(12),
      color: lightGrey,
      width: context.screenWidth,
      height: context.screenHeight,
      child: SafeArea(
        child: Column(
          children: [
            Container(
              alignment: Alignment.center,
              height: 60,
              child: TextFormField(
                decoration: const InputDecoration(
                  border: InputBorder.none,
                  filled: true,
                  fillColor: whiteColor,
                  hintText: searchAnyThing,
                  suffixIcon: Icon(Icons.search),
                  hintStyle: TextStyle(color: textfieldGrey),
                ),
              ),
            ),
            Expanded(
                child: SingleChildScrollView(
              physics: const BouncingScrollPhysics(),
              child: Column(
                children: [
                  VxSwiper.builder(
                    aspectRatio: 16 / 4,
                    height: 150,
                    autoPlay: true,
                    enlargeCenterPage: true,
                    itemCount: slidersList.length,
                    itemBuilder: (context, index) {
                      return Image.asset(
                        slidersList[index],
                        fit: BoxFit.fill,
                      )
                          .box
                          .rounded
                          .clip(Clip.antiAlias)
                          .margin(const EdgeInsets.symmetric(horizontal: 8))
                          .make();
                    },
                  ),
                  10.heightBox,
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: List.generate(
                        2,
                        (index) => homeButtons(
                            title: index == 0 ? todayDeal : flashSale,
                            icon: index == 0 ? icTodaysDeal : icFlashDeal,
                            height: context.screenHeight * 0.15,
                            width: context.screenWidth / 2.5,
                            onPress: () {})),
                  ),
                  10.heightBox,
                  VxSwiper.builder(
                    aspectRatio: 16 / 4,
                    height: 150,
                    autoPlay: true,
                    enlargeCenterPage: true,
                    itemCount: secondSlidersList.length,
                    itemBuilder: (context, index) {
                      return Image.asset(
                        secondSlidersList[index],
                        fit: BoxFit.fill,
                      )
                          .box
                          .rounded
                          .clip(Clip.antiAlias)
                          .margin(const EdgeInsets.symmetric(horizontal: 8))
                          .make();
                    },
                  ),
                  10.heightBox,
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: List.generate(
                        3,
                        (index) => homeButtons(
                            title: index == 0
                                ? topCategory
                                : index == 1
                                    ? topSellers
                                    : brands,
                            icon: index == 0
                                ? icTopCategories
                                : index == 1
                                    ? icTopSeller
                                    : icBrands,
                            height: context.screenHeight * 0.15,
                            width: context.screenWidth / 3.5,
                            onPress: () {})),
                  ),
                  20.heightBox,
                  Align(
                    alignment: Alignment.topLeft,
                    child: featuredCategory.text
                        .size(19)
                        .fontFamily(semibold)
                        .color(darkFontGrey)
                        .make(),
                  ),
                  20.heightBox,
                  SingleChildScrollView(
                      scrollDirection: Axis.horizontal,
                      child: Row(
                        children: List.generate(
                            3,
                            (index) => Column(
                                  children: [
                                    featuredButton(
                                        title: featuredTitle[index],
                                        icon: featuredImages1[index]),
                                    10.heightBox,
                                    featuredButton(
                                        title: featuredTitle2[index],
                                        icon: featuredImages2[index]),
                                  ],
                                )),
                      )),
                  10.heightBox,
                  Container(
                    width: double.infinity,
                    padding: const EdgeInsets.all(12),
                    decoration: const BoxDecoration(
                      color: primaryColor,
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        featuredProducts.text
                            .color(whiteColor)
                            .fontFamily(bold)
                            .size(18)
                            .make(),
                        10.heightBox,
                        StreamBuilder(
                            stream: FirestoreServices.getFeaturedProducts(),
                            builder: (context,
                                AsyncSnapshot<QuerySnapshot> snapshot) {
                              if (!snapshot.hasData) {
                                return Center(child: loadingIndicator());
                              } else if (snapshot.data!.docs.isEmpty) {
                                return Center(
                                  child: "No Products Available as of now."
                                      .toString()
                                      .text
                                      .bold
                                      .color(whiteColor)
                                      .makeCentered(),
                                );
                              }
                              var data = snapshot.data!.docs;
                              return SingleChildScrollView(
                                  scrollDirection: Axis.horizontal,
                                  child: Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceAround,
                                    children: List.generate(
                                        data.length,
                                        (index) => Column(
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                              children: [
                                                Image.network(
                                                  data[index]["p_imgs"][0],
                                                  width: 150,
                                                  height: 130,
                                                  fit: BoxFit.cover,
                                                ),
                                                10.heightBox,
                                                "${data[index]["p_name"]}"
                                                    .text
                                                    .fontFamily(semibold)
                                                    .color(darkFontGrey)
                                                    .make(),
                                                10.heightBox,
                                                "${data[index]["p_price"]}"
                                                    .numCurrencyWithLocale(
                                                        locale: "en_US")
                                                    .text
                                                    .color(primaryColor)
                                                    .fontFamily(bold)
                                                    .size(16)
                                                    .make(),
                                              ],
                                            )
                                                .box
                                                .margin(
                                                    const EdgeInsets.symmetric(
                                                        horizontal: 4))
                                                .white
                                                .roundedSM
                                                .padding(
                                                    const EdgeInsets.all(8))
                                                .make()
                                                .onTap(() {
                                              print("${data[index]}");
                                            })),
                                  ));
                            }),
                      ],
                    ),
                  ),
                  20.heightBox,
                  VxSwiper.builder(
                    aspectRatio: 16 / 4,
                    height: 150,
                    autoPlay: true,
                    enlargeCenterPage: true,
                    itemCount: secondSlidersList.length,
                    itemBuilder: (context, index) {
                      return Image.asset(
                        secondSlidersList[index],
                        fit: BoxFit.fill,
                      )
                          .box
                          .rounded
                          .clip(Clip.antiAlias)
                          .margin(const EdgeInsets.symmetric(horizontal: 8))
                          .make();
                    },
                  ),
                  20.heightBox,
                  GridView.builder(
                      itemCount: 6,
                      shrinkWrap: true,
                      physics: const NeverScrollableScrollPhysics(),
                      gridDelegate:
                          const SliverGridDelegateWithFixedCrossAxisCount(
                              crossAxisCount: 2,
                              crossAxisSpacing: 8,
                              mainAxisSpacing: 8,
                              mainAxisExtent: 300),
                      itemBuilder: (context, builder) {
                        return Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Image.asset(
                              imgP5,
                              width: 200,
                              height: 200,
                              fit: BoxFit.cover,
                            ),
                            const Spacer(),
                            "Ladies Bag"
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
                            .margin(const EdgeInsets.symmetric(horizontal: 4))
                            .white
                            .roundedSM
                            .padding(const EdgeInsets.all(8))
                            .make();
                      })
                ],
              ),
            )),
          ],
        ),
      ),
    );
  }
}
