import 'package:get/get.dart';

class CartController extends GetxController {
  var totalP = 0.0.obs;
  calculateTotalPrice(data) {
    totalP = 0.0.obs;
    for (var i = 0; i < data.length; i++) {
      totalP.value =
          totalP.value + double.parse(data[i]["totalPrice"].toString());
    }
    //  update();
  }
}
