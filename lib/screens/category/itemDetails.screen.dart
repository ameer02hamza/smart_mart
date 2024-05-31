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
    );
  }
}
