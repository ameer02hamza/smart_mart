import 'package:emart/consts/consts.dart';
import 'package:flutter/material.dart';

Widget customTextField({String? title, String? hint, controller}) {
  return Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      title!.text.color(primaryColor).fontFamily(semibold).size(16).make(),
      5.heightBox,
      TextFormField(
        controller: controller,
        validator: (value) {
          if (value!.isEmpty) {
            return 'Please enter your $title';
          }
          return null;
        },
        decoration: InputDecoration(
            hintStyle:
                const TextStyle(color: textfieldGrey, fontFamily: semibold),
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
