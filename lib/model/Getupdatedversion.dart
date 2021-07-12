// To parse this JSON data, do
//
//     final getupdatedversionResponse = getupdatedversionResponseFromJson(jsonString);

import 'dart:convert';

GetupdatedversionResponse getupdatedversionResponseFromJson(String str) =>
    GetupdatedversionResponse.fromJson(json.decode(str));

String getupdatedversionResponseToJson(GetupdatedversionResponse data) =>
    json.encode(data.toJson());

class GetupdatedversionResponse {
  GetupdatedversionResponse({
    this.success,
    this.msg,
  });

  bool success;
  String msg;

  factory GetupdatedversionResponse.fromJson(Map<String, dynamic> json) =>
      GetupdatedversionResponse(
        success: json["success"],
        msg: json["msg"],
      );

  Map<String, dynamic> toJson() => {
        "success": success,
        "msg": msg,
      };
}
