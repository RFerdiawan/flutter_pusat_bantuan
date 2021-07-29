// To parse this JSON data, do
//
//     final dataTokenModel = dataTokenModelFromJson(jsonString);

import 'dart:convert';

DataTokenModel dataTokenModelFromJson(String str) => DataTokenModel.fromJson(json.decode(str));

String dataTokenModelToJson(DataTokenModel data) => json.encode(data.toJson());

class DataTokenModel {
  DataTokenModel({
    this.iss,
    this.iat,
    this.exp,
    this.nbf,
    this.jti,
    this.sub,
    this.prv,
  });

  String iss;
  int iat;
  int exp;
  int nbf;
  String jti;
  int sub;
  String prv;

  factory DataTokenModel.fromJson(Map<String, dynamic> json) => DataTokenModel(
    iss: json["iss"] == null ? null : json["iss"],
    iat: json["iat"] == null ? null : json["iat"],
    exp: json["exp"] == null ? null : json["exp"],
    nbf: json["nbf"] == null ? null : json["nbf"],
    jti: json["jti"] == null ? null : json["jti"],
    sub: json["sub"] == null ? null : json["sub"],
    prv: json["prv"] == null ? null : json["prv"],
  );

  Map<String, dynamic> toJson() => {
    "iss": iss == null ? null : iss,
    "iat": iat == null ? null : iat,
    "exp": exp == null ? null : exp,
    "nbf": nbf == null ? null : nbf,
    "jti": jti == null ? null : jti,
    "sub": sub == null ? null : sub,
    "prv": prv == null ? null : prv,
  };
}
