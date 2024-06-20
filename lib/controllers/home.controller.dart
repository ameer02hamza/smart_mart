import 'package:emart/consts/firebase.const.dart';
import 'package:get/get.dart';

class HomeController extends GetxController {
  var currentIndex = 0.obs;
  var name = "".obs;

  getUserDetails() async {
    await firebaseStore
        .collection(usersCollections)
        .where("id", isEqualTo: currentUser!.uid)
        .get()
        .then((value) {
      if (value.docs.isNotEmpty) {
        name.value = value.docs.single["name"];
      }
    });
    print("%c $name");
  }
}
