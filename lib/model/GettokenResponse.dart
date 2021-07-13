// To parse this JSON data, do
//
//     final gettokenResponse = gettokenResponseFromJson(jsonString);

import 'dart:convert';

GettokenResponse gettokenResponseFromJson(String str) =>
    GettokenResponse.fromJson(json.decode(str));

String gettokenResponseToJson(GettokenResponse data) =>
    json.encode(data.toJson());

class GettokenResponse {
  GettokenResponse({
    this.success,
    this.msg,
  });

  bool success;
  String msg;

  factory GettokenResponse.fromJson(Map<String, dynamic> json) =>
      GettokenResponse(
        success: json["success"],
        msg: json["msg"],
      );

  Map<String, dynamic> toJson() => {
        "success": success,
        "msg": msg,
      };
}
