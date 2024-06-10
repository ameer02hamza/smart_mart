import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:emart/consts/consts.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';

import 'firebase.const.dart';

class AuthController extends GetxController {
  Future<UserCredential?> loginMethod({email, password, context}) async {
    UserCredential? userCred;
    try {
      await firebaseAuth.signInWithEmailAndPassword(
          email: email, password: password);
    } on FirebaseAuthException catch (e) {
      VxToast.show(context, msg: e.toString());
    }
    return userCred;
  }

  Future<UserCredential?> signupMethod({name, email, password, context}) async {
    UserCredential? userCred;
    try {
      await firebaseAuth.createUserWithEmailAndPassword(
          email: email, password: password);
    } on FirebaseAuthException catch (e) {
      VxToast.show(context, msg: e.toString());
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
    DocumentReference store =
        await firebaseStore.collection(usersCollections).doc(user!.uid);
    store.set(
        {"name": name, "password": password, "email": email, "profileUrl": ""});
  }
}
