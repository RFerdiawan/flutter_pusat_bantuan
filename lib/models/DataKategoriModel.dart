// To parse this JSON data, do
//
//     final dataKategoriModel = dataKategoriModelFromJson(jsonString);

import 'dart:convert';

List<DataKategoriModel> dataKategoriModelFromJson(String str) => List<DataKategoriModel>.from(json.decode(str).map((x) => DataKategoriModel.fromJson(x)));

String dataKategoriModelToJson(List<DataKategoriModel> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class DataKategoriModel {
  DataKategoriModel({
    this.id,
    this.category,
    this.icon,
    this.createdAt,
    this.updatedAt,
  });

  int id;
  String category;
  String icon;
  dynamic createdAt;
  dynamic updatedAt;

  factory DataKategoriModel.fromJson(Map<String, dynamic> json) => DataKategoriModel(
    id: json["id"] == null ? null : json["id"],
    category: json["category"] == null ? null : json["category"],
    icon: json["icon"] == null ? null : json["icon"],
    createdAt: json["created_at"],
    updatedAt: json["updated_at"],
  );

  Map<String, dynamic> toJson() => {
    "id": id == null ? null : id,
    "category": category == null ? null : category,
    "icon": icon == null ? null : icon,
    "created_at": createdAt,
    "updated_at": updatedAt,
  };
}
