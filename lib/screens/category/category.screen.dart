import 'package:emart/common_widgets/bg.widget.dart';
import 'package:emart/consts/colors.dart';
import 'package:emart/consts/consts.dart';
import 'package:emart/consts/list.dart';
import 'package:emart/screens/category/categoryDetails.screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CategoryScreen extends StatelessWidget {
  const CategoryScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return bgWidget(
        child: Scaffold(
      appBar: AppBar(
        title: categories.text.fontFamily(bold).white.make(),
        centerTitle: true,
         automaticallyImplyLeading: false,
      ),
      body: Container(
        child: GridView.builder(
            itemCount: 9,
            shrinkWrap: true,
            // physics: const NeverScrollableScrollPhysics(),
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 3,
                crossAxisSpacing: 8,
                mainAxisSpacing: 8,
                mainAxisExtent: 200),
            itemBuilder: (context, index) {
              return Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Image.asset(
                    categoriesImages[index],
                    height: 130,
                    width: 200,
                    fit: BoxFit.cover,
                  ),
                  10.heightBox,
                  categoriesList[index]
                      .text
                      .align(TextAlign.center)
                      .color(darkFontGrey)
                      .make(),
                ],
              )
                  .box
                  .margin(const EdgeInsets.symmetric(horizontal: 4))
                  .white
                  .rounded
                  .clip(Clip.antiAlias)
                  .outerShadowSm
                  .padding(const EdgeInsets.all(8))
                  .make()
                  .onTap(() {
                Get.to(
                    () => CategoryDetailsScreen(title: categoriesList[index]));
              });
            }),
      ),
    ));
  }
}
