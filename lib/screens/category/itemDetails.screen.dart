import 'package:emart/common_widgets/ourButton.widget.dart';
import 'package:emart/consts/consts.dart';
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
      body: Column(
        children: [
          Expanded(
            child: Padding(
              padding: const EdgeInsets.all(8),
              child: SingleChildScrollView(
                child: Column(children: [
                  VxSwiper.builder(
                    autoPlay: true,
                    // height: 350,
                    itemCount: 3,
                    itemBuilder: (context, index) {
                      return Image.asset(
                        imgFc5,
                        width: double.infinity,
                        fit: BoxFit.cover,
                      );
                    },
                  )
                ]),
              ),
            ),
          ),
          SizedBox(
            width: double.infinity,
            child: ourButton(
                title: 'Add to cart',
                color: primaryColor,
                textColor: whiteColor,
                onPress: () {}),
          )
        ],
      ),
    );
  }
}
