// To parse this JSON data, do
//
//     final categoryName = categoryNameFromJson(jsonString);

import 'dart:convert';

CategoryName categoryNameFromJson(String str) => CategoryName.fromJson(json.decode(str));

String categoryNameToJson(CategoryName data) => json.encode(data.toJson());

class CategoryName {
  CategoryName({
    required this.name,
    required this.images,
  });

  String name;
  List<String> images;

  factory CategoryName.fromJson(Map<String, dynamic> json) => CategoryName(
    name: json["name"],
    images: List<String>.from(json["images"].map((x) => x)),
  );

  Map<String, dynamic> toJson() => {
    "name": name,
    "images": List<dynamic>.from(images.map((x) => x)),
  };
}
