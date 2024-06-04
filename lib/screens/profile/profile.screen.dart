import 'package:emart/common_widgets/bg.widget.dart';
import 'package:emart/consts/colors.dart';
import 'package:emart/consts/consts.dart';
import 'package:emart/screens/profile/components/detailsButtonCard.comp.dart';
import 'package:flutter/material.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return bgWidget(
        child: Scaffold(
      body: SafeArea(
          child: Container(
        padding: EdgeInsets.all(8),
        child: Column(
          children: [
            const Align(
              alignment: Alignment.topRight,
              child: Icon(
                Icons.edit,
                size: 30,
                color: whiteColor,
              ),
            ).onTap(
              () {},
            ),
            Row(
              children: [
                Image.asset(
                  imgProfile2,
                  width: 70,
                  fit: BoxFit.cover,
                ).box.roundedFull.clip(Clip.antiAlias).make(),
                10.widthBox,
                Expanded(
                    child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    'Ameer Hamza'.text.size(12).fontFamily(bold).white.make(),
                    "ameer02hamza@gmail.com".text.size(8).white.make(),
                  ],
                )),
                SizedBox(
                    height: 30,
                    width: 90,
                    child: OutlinedButton(
                        style: OutlinedButton.styleFrom(
                            side: const BorderSide(color: whiteColor),
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(4))),
                        onPressed: () {},
                        child: logout.text
                            .fontFamily(semibold)
                            .size(12)
                            .white
                            .make()))
              ],
            ),
            20.heightBox,
            SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: List.generate(
                      3,
                      (index) => detailsCard(
                          width: context.screenWidth / 3.4,
                          title: "Basket",
                          count: "20")),
                ))
          ],
        ),
      )),
    ));
  }
}
