import 'package:emart/consts/colors.dart';
import 'package:emart/consts/firebase.const.dart';
import 'package:emart/model/category.model.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:velocity_x/velocity_x.dart';

class ProductController extends GetxController {
  var subCat = [].obs;
  var colorIndex = 0.obs;
  var itemQuantity = 0.obs;
  var totalPrice = 0.0.obs;

  getSubCategories(title) async {
    try {
      var data = await rootBundle
          .loadString('lib/services/categories/category_model.json');
      var decodedData = categoryFromJson(data);
      var filteredData = decodedData.categories
          .where((element) => element.name == title)
          .toList();
      subCat.value.addAll(filteredData[0].subcategory);
    } catch (e) {
      subCat.clear();
      print(e);
    }
  }

  addToCart({context, title, img, sellerName, color, qty, price}) async {
    print(title);
    await firebaseStore.collection(cartCollection).doc().set({
      'title': title,
      'img': img,
      'sellerName': sellerName,
      'color': color,
      'qty': qty,
      'totalPrice': price,
      "added_by": currentUser!.uid,
    }).catchError((error) {
      VxToast.show(context,
          msg: "Please select quantity",
          textColor: whiteColor,
          bgColor: errorColor,
          position: VxToastPosition.top,
          showTime: 4000);
    });
  }

  resetValues() {
    totalPrice.value = 0.0;
    itemQuantity.value = 0;
    colorIndex.value = 0;
  }
}
