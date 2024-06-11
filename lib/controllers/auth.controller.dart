import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:emart/consts/consts.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';

class AuthController extends GetxController {
  Future<UserCredential?> loginMethod({email, password, context}) async {
    UserCredential? userCred;
    try {
      userCred = await firebaseAuth.signInWithEmailAndPassword(
          email: email.toString().trim(), password: password);
    } on FirebaseAuthException catch (e) {
      VxToast.show(
        context,
        msg: e.message.toString(),
        position: VxToastPosition.top,
        bgColor: Vx.red800,
        textColor: whiteColor,
        showTime: 5000,
      );
    }
    return userCred;
  }

  Future<UserCredential?> signupMethod({name, email, password, context}) async {
    UserCredential? userCred;
    try {
      userCred = await firebaseAuth.createUserWithEmailAndPassword(
          email: email, password: password);
    } on FirebaseAuthException catch (e) {
      VxToast.show(
        context,
        msg: e.message.toString(),
        position: VxToastPosition.top,
        bgColor: Vx.red800,
        textColor: whiteColor,
        showTime: 5000,
      );
    }
    return userCred;
  }

  Future<void> logoutMethod({context}) async {
    try {
      await firebaseAuth.signOut();
    } catch (e) {
      VxToast.show(context, msg: e.toString());
    }
  }

  Future<dynamic> storeUserData({name, password, email}) async {
    try {
      DocumentReference store =
          firebaseStore.collection(usersCollections).doc(currentUser!.uid);
      store.set({
        "name": name,
        "password": password,
        "email": email,
        "profileUrl": "",
        "id": currentUser!.uid,
        "cartCount": "00",
        "orderCount": "00",
        "wishListCount": "00",
      });
    } catch (e) {
      print("error in storeUserData: $e");
    }
  }
}
