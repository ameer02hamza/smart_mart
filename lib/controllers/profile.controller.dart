import 'dart:io';

import 'package:emart/consts/consts.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:path/path.dart';

class ProfileController extends GetxController {
  var profileImgPath = ''.obs;
  var profileImageLink = '';
  var isLoading = false.obs;
  var isChnagePaswd = false.obs;
  TextEditingController nameController = TextEditingController();
  TextEditingController pswdController = TextEditingController();
  TextEditingController oldPswdController = TextEditingController();

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

  uploadProfileImage() async {
    try {
      var fileName = basename(profileImgPath.value);
      var destination = 'profile/${currentUser!.uid}/$fileName';
      Reference ref = FirebaseStorage.instance.ref().child(destination);
      await ref.putFile(File(profileImgPath.value));
      profileImageLink = await ref.getDownloadURL();
      print("%c uploading image");
    } catch (e) {
      print(" %c error: $e");
    }
  }

  updateProfile(context) async {
    try {
      isLoading(true);
      await uploadProfileImage();
      await firebaseStore
          .collection(usersCollections)
          .doc(currentUser!.uid)
          .update({
        "name": nameController.text,
        "password": pswdController.text,
        "profileUrl": profileImageLink,
      });
      isLoading(false);
      VxToast.show(
        context,
        msg: "Profile Updated successfully",
        position: VxToastPosition.top,
        bgColor: Vx.green600,
        textColor: whiteColor,
        showTime: 5000,
      );
    } catch (e) {
      isLoading(false);
      VxToast.show(
        context,
        msg: "Error in updating profile, Try again",
        position: VxToastPosition.top,
        bgColor: Vx.red800,
        textColor: whiteColor,
        showTime: 5000,
      );
      print(" %c error: $e");
    }
  }

  changePassword({email, password, newPassword}) async {
    final cred = EmailAuthProvider.credential(email: email, password: password);
    await currentUser!.reauthenticateWithCredential(cred).then((value) async {
      currentUser!.updatePassword(newPassword);
    }).catchError((error) {
      print(" %c error: $error");
    });
  }
}
