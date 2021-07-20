// To parse this JSON data, do
//
//     final getversionResponse = getversionResponseFromJson(jsonString);

import 'dart:convert';

GetversionResponse getversionResponseFromJson(String str) =>
    GetversionResponse.fromJson(json.decode(str));

String getversionResponseToJson(GetversionResponse data) =>
    json.encode(data.toJson());

class GetversionResponse {
  GetversionResponse({
    this.success,
    this.msg,
    this.list,
  });

  bool success;
  String msg;
  ListClass list;

  factory GetversionResponse.fromJson(Map<String, dynamic> json) =>
      GetversionResponse(
        success: json["success"],
        msg: json["msg"],
        list: ListClass.fromJson(json["list"]),
      );

  Map<String, dynamic> toJson() => {
        "success": success,
        "msg": msg,
        "list": list.toJson(),
      };
}

class ListClass {
  ListClass({
    this.id,
    this.version,
    this.iosVersion,
    this.createdOn,
    this.updatedOn,
  });

  String id;
  String version;
  String iosVersion;
  DateTime createdOn;
  DateTime updatedOn;

  factory ListClass.fromJson(Map<String, dynamic> json) => ListClass(
        id: json["id"],
        version: json["version"],
        iosVersion: json["ios_version"],
        createdOn: DateTime.parse(json["created_on"]),
        updatedOn: DateTime.parse(json["updated_on"]),
      
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "version": version,
        "ios_version": iosVersion,
        "created_on": createdOn.toIso8601String(),
        "updated_on": updatedOn.toIso8601String(),
     
      };
}
