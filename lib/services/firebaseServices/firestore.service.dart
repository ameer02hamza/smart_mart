import 'package:emart/consts/firebase.const.dart';

class FirestoreServices {
  ///get user data from firestore
  static getUser(uid) {
    return firebaseStore
        .collection(usersCollections)
        .where("id", isEqualTo: uid)
        .snapshots();
  }
}
