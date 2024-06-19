import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:emart/common_widgets/bg.widget.dart';
import 'package:emart/common_widgets/loading.widget.dart';
import 'package:emart/consts/list.dart';
import 'package:emart/controllers/auth.controller.dart';
import 'package:emart/controllers/profile.controller.dart';
import 'package:emart/screens/auth_screen/login.screen.dart';
import 'package:emart/screens/chats/chat.screem.dart';
import 'package:emart/screens/orders/order.screen.dart';
import 'package:emart/screens/orders/wishlist.screen.dart';
import 'package:emart/screens/profile/components/detailsButtonCard.comp.dart';
import 'package:emart/screens/profile/editProfile.screen.dart';
import 'package:emart/services/firebase/firestore.service.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';

import '../../consts/consts.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({super.key});

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  var controller = Get.put(AuthController());
  var profileController = Get.put(ProfileController());
  logoutUser() async {
    await controller.logoutMethod(context: context);
  }

  @override
  Widget build(BuildContext context) {
    return bgWidget(
        child: Scaffold(
            body: StreamBuilder(
                stream: FirestoreServices.getUser(currentUser!.uid),
                builder: (context, AsyncSnapshot<QuerySnapshot> snapshot) {
                  if (!snapshot.hasData) {
                    return Center(child: loadingIndicator());
                  } else {
                    var data = snapshot.data!.docs.first;
                    return SafeArea(
                        child: Column(
                      children: [
                        const Align(
                          alignment: Alignment.topRight,
                          child: Icon(
                            Icons.edit,
                            size: 30,
                            color: whiteColor,
                          ),
                        )
                            .onTap(
                              () {
                                Get.to(() => EditProfileScreen(
                                      profileData: data,
                                    ));
                              },
                            )
                            .box
                            .margin(const EdgeInsets.only(right: 5, left: 5))
                            .make(),
                        Row(
                          children: [
                            data["profileUrl"] == ""
                                ? Image.asset(
                                    imgProfile2,
                                    width: 50,
                                    fit: BoxFit.cover,
                                  )
                                    .box
                                    .roundedFull
                                    .margin(const EdgeInsets.only(
                                        right: 5, left: 5))
                                    .clip(Clip.antiAlias)
                                    .make()
                                : Image.network(
                                    data["profileUrl"],
                                    width: 70,
                                    fit: BoxFit.cover,
                                  )
                                    .box
                                    .roundedFull
                                    .margin(const EdgeInsets.only(left: 5))
                                    .clip(Clip.antiAlias)
                                    .make(),
                            Expanded(
                                child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                data['name']
                                    .toString()
                                    .text
                                    .size(12)
                                    .fontFamily(bold)
                                    .white
                                    .make(),
                                data['email']
                                    .toString()
                                    .text
                                    .size(10)
                                    .white
                                    .make(),
                              ],
                            )),
                            OutlinedButton(
                                    style: OutlinedButton.styleFrom(
                                        side:
                                            const BorderSide(color: whiteColor),
                                        shape: RoundedRectangleBorder(
                                            borderRadius:
                                                BorderRadius.circular(4))),
                                    onPressed: logoutUser,
                                    child: logout.text
                                        .fontFamily(semibold)
                                        .size(7)
                                        .white
                                        .make())
                                .box
                                .margin(const EdgeInsets.only(right: 5))
                                .make()
                          ],
                        ),
                        40.heightBox,
                        SingleChildScrollView(
                          scrollDirection: Axis.horizontal,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              detailsCard(
                                  title: profileCardButtons[0],
                                  width: context.screenWidth / 3.4,
                                  count: data['cartCount']),
                              detailsCard(
                                  title: profileCardButtons[2],
                                  width: context.screenWidth / 3.4,
                                  count: data['orderCount']),
                              detailsCard(
                                  title: profileCardButtons[1],
                                  width: context.screenWidth / 3.4,
                                  count: data['wishListCount']),
                            ],
                          ).box.margin(const EdgeInsets.all(12)).make(),
                        )
                            .box
                            .color(primaryColor)
                            .width(context.screenWidth)
                            .make(),
                        ListView.separated(
                          shrinkWrap: true,
                          physics: const NeverScrollableScrollPhysics(),
                          itemBuilder: (context, index) {
                            return ListTile(
                              onTap: () {
                                switch (index) {
                                  case 0:
                                    Get.to(() => const WishListScreen());
                                    break;
                                  case 1:
                                    Get.to(() => const OrderScreen());
                                    break;
                                  case 2:
                                    Get.to(() => const ChatScreen());
                                    break;
                                  default:
                                }
                              },
                              title: profileButtons[index]
                                  .text
                                  .size(12)
                                  .color(darkFontGrey)
                                  .make(),
                              leading: Image.asset(
                                profileButtonIcons[index],
                                width: 30,
                              ),
                            );
                          },
                          separatorBuilder: (context, index) {
                            return const Divider();
                          },
                          itemCount: profileButtonIcons.length,
                        )
                            .box
                            .white
                            .rounded
                            .margin(const EdgeInsets.all(12))
                            .shadowSm
                            .make()
                            .box
                            .color(primaryColor)
                            .make()
                      ],
                    ));
                  }
                })));
  }
}
