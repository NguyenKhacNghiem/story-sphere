import 'dart:convert';

List<Category> categoriesFromJson(String str) => List<Category>.from(json.decode(str).map((x) => Category.fromJson(x)));

Category categoryFromJson(String str) => Category.fromJson(json.decode(str));

String categoryToJson(Category data) => json.encode(data.toJson());

class Category {
  Category({
    this.categoryId,
    this.categoryUrl,
    this.categoryName,
    this.categoryDescription,
    this.isCategory,
  });

  int? categoryId;
  bool? categoryUrl;
  String? categoryName;
  String? categoryDescription;
  bool? isCategory;

  factory Category.fromJson(Map<String, dynamic> json) => Category(
        categoryId: json["categoryId"],
        categoryUrl: json["categoryUrl"],
        categoryName: json["categoryName"],
        categoryDescription: json["categoryDescription"],
        isCategory: json["isCategory"],
      );

  Map<String, dynamic> toJson() => {
        "categoryId": categoryId,
        "categoryUrl": categoryUrl,
        "categoryName": categoryName,
        "categoryDescription": categoryDescription,
        "isCategory": isCategory,
      };
}
