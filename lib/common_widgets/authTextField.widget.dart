import 'package:emart/consts/consts.dart';
import 'package:flutter/material.dart';

Widget authTextField(
    {String? title,
    String? hint,
    controller,
    validator,
    bool confirmPassword = false}) {
  return Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      title!.text.color(primaryColor).fontFamily(semibold).size(16).make(),
      5.heightBox,
      TextFormField(
        obscureText: title.toLowerCase().contains("password"),
        controller: controller,
        validator: (value) {
          if (value!.isEmpty) {
            return 'Please enter $title';
          }
          if (confirmPassword) {
            if (value != validator) {
              return "Password does not match";
            }
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
