// To parse this JSON data, do
//
//     final categoria = categoriaFromJson(jsonString);

import 'dart:convert';

Categoria categoriaFromJson(String str) => Categoria.fromJson(json.decode(str));

String categoriaToJson(Categoria data) => json.encode(data.toJson());

class Categoria {
  int categoryId;
  String categoryName;
  String categoryState;

  Categoria({
    required this.categoryId,
    required this.categoryName,
    required this.categoryState,
  });

  factory Categoria.fromJson(Map<String, dynamic> json) => Categoria(
        categoryId: json["category_id"],
        categoryName: json["category_name"],
        categoryState: json["category_state"],
      );

  Map<String, dynamic> toJson() => {
        "category_id": categoryId,
        "category_name": categoryName,
        "category_state": categoryState,
      };
}
