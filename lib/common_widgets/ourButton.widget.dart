import 'package:emart/consts/consts.dart';
import 'package:flutter/material.dart';

Widget ourButton({onPress, String? title, color, textColor, formKey}) {
  return ElevatedButton(
      style: ElevatedButton.styleFrom(
        backgroundColor: color,
        padding: const EdgeInsets.all(8),
        shape: BeveledRectangleBorder(borderRadius: BorderRadius.circular(0)),
      ),
      onPressed: onPress,
      child: title!.text.color(textColor).fontFamily(bold).make());
}
