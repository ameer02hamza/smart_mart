import 'package:emart/consts/consts.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';

class ProfileController extends GetxController {
  var profileImgPath = ''.obs;

  changeImage(context) async {
    try {
      final img = await ImagePicker().pickImage(
        source: ImageSource.gallery,
        imageQuality: 100,
      );
      if (img == null) return;
      print("%c ${img.path}");
      profileImgPath.value = img.path;
    } on PlatformException catch (e) {
      print(" %c error: $e");
      VxToast.show(context, msg: e.message.toString());
    }
  }
}
