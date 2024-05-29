import 'package:emart/consts/consts.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/widgets.dart';

Widget customTextField({String? title, String?hint, controller}) {
  return Column(
    crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        title!.text.color(primaryColor).fontFamily(semibold).size(16).make(),
        5.heightBox,
        TextFormField(
          controller: controller,
          decoration:  InputDecoration(
              hintStyle:const TextStyle(color: textfieldGrey, fontFamily: semibold),
              hintText: hint!,
              isDense: true,
              fillColor: lightGrey,
              filled: true,
              border: InputBorder.none,
              focusedBorder: const OutlineInputBorder(
                borderSide: BorderSide(color: primaryColor),
              )),
        ),
        5.heightBox,
      ],
    );
}
