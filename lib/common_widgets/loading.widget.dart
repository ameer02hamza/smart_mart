import 'package:emart/consts/colors.dart';
import 'package:flutter/material.dart';

Widget loadingIndicator() {
  return const CircularProgressIndicator(
    semanticsLabel: String.fromEnvironment("Loading..."),
    valueColor: AlwaysStoppedAnimation<Color>(primaryColor),
  );
}
