// To parse this JSON data, do
//
//     final dataTokenLoginModel = dataTokenLoginModelFromJson(jsonString);

import 'dart:convert';

DataTokenLoginModel dataTokenLoginModelFromJson(String str) => DataTokenLoginModel.fromJson(json.decode(str));

String dataTokenLoginModelToJson(DataTokenLoginModel data) => json.encode(data.toJson());

class DataTokenLoginModel {
  DataTokenLoginModel({
    this.token,
  });

  String token;

  factory DataTokenLoginModel.fromJson(Map<String, dynamic> json) => DataTokenLoginModel(
    token: json["token"] == null ? null : json["token"],
  );

  Map<String, dynamic> toJson() => {
    "token": token == null ? null : token,
  };
}
