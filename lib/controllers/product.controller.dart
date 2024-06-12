import 'package:emart/model/category.model.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';

class ProductController extends GetxController {
  List subCat = [];
  getSubCategories(title) async {
    try {
      var data = await rootBundle
          .loadString('lib/services/categories/category_model.json');
      var decodedData = categoryFromJson(data);
      var filteredData = decodedData.categories
          .where((element) => element.name == title)
          .toList();
      subCat.addAll(filteredData[0].subcategory);
    } catch (e) {
      subCat.clear();
      print(e);
    }
  }
}
