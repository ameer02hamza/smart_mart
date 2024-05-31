import 'package:emart/common_widgets/bg.widget.dart';
import 'package:emart/consts/consts.dart';
import 'package:emart/screens/category/itemDetails.screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CategoryDetailsScreen extends StatefulWidget {
  String title;
  CategoryDetailsScreen({super.key, required this.title});

  @override
  State<CategoryDetailsScreen> createState() => _CategoryDetailsScreenState();
}

class _CategoryDetailsScreenState extends State<CategoryDetailsScreen> {
  @override
  Widget build(BuildContext context) {
    return bgWidget(
      child: Scaffold(
        appBar: AppBar(
          title: widget.title.text.white.fontFamily(bold).make(),
          iconTheme: const IconThemeData(color: whiteColor),
          centerTitle: true,
        ),
        body: Container(
          padding: const EdgeInsets.all(12),
          child: Column(
            children: [
              SingleChildScrollView(
                  physics: const BouncingScrollPhysics(),
                  scrollDirection: Axis.horizontal,
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: List.generate(
                        6,
                        (index) => "Baby clothing"
                            .text
                            .size(12)
                            .color(darkFontGrey)
                            .fontFamily(bold)
                            .makeCentered()
                            .box
                            .rounded
                            .white
                            .size(150, 60)
                            .margin(const EdgeInsets.symmetric(horizontal: 4))
                            .make()),
                  )),
              20.heightBox,
              Expanded(
                child: GridView.builder(
                    itemCount: 6,
                    shrinkWrap: true,
                    physics: const BouncingScrollPhysics(),
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
                          .shadowSm
                          .padding(const EdgeInsets.all(8))
                          .make()
                          .onTap(() {
                        print("heelo");
                        Get.to(() => ItemDetailsScreen(
                            title: "Ladies Bag".toUpperCase()));
                      });
                    }),
              )
            ],
          ),
        ),
      ),
    );
  }
}
