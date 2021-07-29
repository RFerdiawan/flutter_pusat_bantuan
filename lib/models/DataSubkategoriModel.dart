// To parse this JSON data, do
//
//     final dataSubkategoriModel = dataSubkategoriModelFromJson(jsonString);

import 'dart:convert';

List<DataSubkategoriModel> dataSubkategoriModelFromJson(String str) => List<DataSubkategoriModel>.from(json.decode(str).map((x) => DataSubkategoriModel.fromJson(x)));

String dataSubkategoriModelToJson(List<DataSubkategoriModel> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class DataSubkategoriModel {
  DataSubkategoriModel({
    this.id,
    this.categoryId,
    this.pertanyaan,
    this.jawaban,
    this.createdAt,
    this.updatedAt,
  });

  int id;
  int categoryId;
  String pertanyaan;
  String jawaban;
  dynamic createdAt;
  dynamic updatedAt;

  factory DataSubkategoriModel.fromJson(Map<String, dynamic> json) => DataSubkategoriModel(
    id: json["id"] == null ? null : json["id"],
    categoryId: json["category_id"] == null ? null : json["category_id"],
    pertanyaan: json["pertanyaan"] == null ? null : json["pertanyaan"],
    jawaban: json["jawaban"] == null ? null : json["jawaban"],
    createdAt: json["created_at"],
    updatedAt: json["updated_at"],
  );

  Map<String, dynamic> toJson() => {
    "id": id == null ? null : id,
    "category_id": categoryId == null ? null : categoryId,
    "pertanyaan": pertanyaan == null ? null : pertanyaan,
    "jawaban": jawaban == null ? null : jawaban,
    "created_at": createdAt,
    "updated_at": updatedAt,
  };
}
