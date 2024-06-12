import 'package:meta/meta.dart';
import 'dart:convert';

Category categoryFromJson(String str) => Category.fromJson(json.decode(str));

String categoryToJson(Category data) => json.encode(data.toJson());

class Category {
  List<CategoryModel> categories;

  Category({
    required this.categories,
  });

  factory Category.fromJson(Map<String, dynamic> json) => Category(
        categories: List<CategoryModel>.from(
            json["categories"].map((x) => CategoryModel.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "categories": List<dynamic>.from(categories.map((x) => x.toJson())),
      };
}

class CategoryModel {
  String name;
  List<String> subcategory;

  CategoryModel({
    required this.name,
    required this.subcategory,
  });

  factory CategoryModel.fromJson(Map<String, dynamic> json) => CategoryModel(
        name: json["name"],
        subcategory: List<String>.from(json["subcategory"].map((x) => x)),
      );

  Map<String, dynamic> toJson() => {
        "name": name,
        "subcategory": List<dynamic>.from(subcategory.map((x) => x)),
      };
}
