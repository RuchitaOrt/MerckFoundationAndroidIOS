// To parse this JSON data, do
//
//     final callforApplicationResponse = callforApplicationResponseFromJson(jsonString);

import 'dart:convert';

CallforApplicationResponse callforApplicationResponseFromJson(String str) =>
    CallforApplicationResponse.fromJson(json.decode(str));

String callforApplicationResponseToJson(CallforApplicationResponse data) =>
    json.encode(data.toJson());

class CallforApplicationResponse {
  CallforApplicationResponse({this.success, this.msg, this.data, this.baseurl});

  String success;
  String msg;
  String baseurl;
  Data data;

  factory CallforApplicationResponse.fromJson(Map<String, dynamic> json) =>
      CallforApplicationResponse(
        success: json["success"],
        msg: json["msg"],
        baseurl: json["base_url"] == null ? "" : json["base_url"],
        data: Data.fromJson(json["data"]),
      );

  Map<String, dynamic> toJson() => {
        "success": success,
        "msg": msg,
        "base_url": baseurl,
        "data": data.toJson(),
      };
}

class Data {
  Data({
    this.upcoming,
    this.past,
  });

  List<Past> upcoming;
  List<Past> past;

  factory Data.fromJson(Map<String, dynamic> json) => Data(
        upcoming:
            List<Past>.from(json["upcoming"].map((x) => Past.fromJson(x))),
        past: List<Past>.from(json["past"].map((x) => Past.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "upcoming": List<dynamic>.from(upcoming.map((x) => x.toJson())),
        "past": List<dynamic>.from(past.map((x) => x.toJson())),
      };
}

class Past {
  Past({
    this.id,
    this.title,
    this.eventType,
    this.eventYear,
    this.pdfFile,
    this.appImg,
    this.altText,
    this.status,
    this.createdAt,
    this.updatedAt,
  });

  String id;
  String title;
  String eventType;
  DateTime eventYear;
  String pdfFile;
  String appImg;
  String altText;
  String status;
  DateTime createdAt;
  DateTime updatedAt;

  factory Past.fromJson(Map<String, dynamic> json) => Past(
        id: json["id"],
        title: json["title"] == null ? "" : json["title"],
        eventType: json["event_type"],
        eventYear: DateTime.parse(json["event_year"]),
        pdfFile: json["pdf_file"] == null? "":  json["pdf_file"],
        appImg: json["app_img"] == null ? "" : json["app_img"],
        altText: json["alt_text"],
        status: json["status"],
        createdAt: DateTime.parse(json["created_at"]),
        updatedAt: DateTime.parse(json["updated_at"]),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "title": title,
        "event_type": eventType,
        "event_year": eventYear.toIso8601String(),
        "pdf_file": pdfFile,
        "app_img": appImg,
        "alt_text": altText,
        "status": status,
        "created_at": createdAt.toIso8601String(),
        "updated_at": updatedAt.toIso8601String(),
      };
}
