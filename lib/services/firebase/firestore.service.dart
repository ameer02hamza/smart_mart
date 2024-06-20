import 'package:emart/consts/firebase.const.dart';

class FirestoreServices {
  ///get user data from firestore
  static getUser(uid) {
    return firebaseStore
        .collection(usersCollections)
        .where("id", isEqualTo: uid)
        .snapshots();
  }

  static getProducts(category) {
    return firebaseStore
        .collection(productCollections)
        .where("p_category", isEqualTo: category)
        .snapshots();
  }

  static getCartData(userId) {
    return firebaseStore
        .collection(cartCollection)
        .where("added_by", isEqualTo: userId)
        .snapshots();
  }

  static deleteCartDoc(docId) {
    return firebaseStore.collection(cartCollection).doc(docId).delete();
  }

  static getAllOrders() {
    return firebaseStore
        .collection(orderCollection)
        .where('order_by', isEqualTo: currentUser!.uid)
        .snapshots();
  }

  static getWishList() {
    return firebaseStore
        .collection(productCollections)
        .where('p_wishlist', arrayContains: currentUser!.uid)
        .snapshots();
  }

  static getFeaturedProducts() {
    return firebaseStore
        .collection(productCollections)
        .where('is_featured', isEqualTo: true)
        .snapshots();
  }
}
