// To parse this JSON data, do
//
//     final callforApplicationResponse = callforApplicationResponseFromJson(jsonString);

import 'dart:convert';

CallforApplicationResponse callforApplicationResponseFromJson(String str) =>
    CallforApplicationResponse.fromJson(json.decode(str));

String callforApplicationResponseToJson(CallforApplicationResponse data) =>
    json.encode(data.toJson());

class CallforApplicationResponse {
  CallforApplicationResponse({
    this.baseUrl,
    this.success,
    this.msg,
    this.data,
  });

  String baseUrl;
  String success;
  String msg;
  Data data;

  factory CallforApplicationResponse.fromJson(Map<String, dynamic> json) =>
      CallforApplicationResponse(
        baseUrl: json["base_url"],
        success: json["success"],
        msg: json["msg"],
        data: Data.fromJson(json["data"]),
      );

  Map<String, dynamic> toJson() => {
        "base_url": baseUrl,
        "success": success,
        "msg": msg,
        "data": data.toJson(),
      };
}

class Data {
  Data({
    this.past,
    this.upcoming,
  });

  List<Past> past;
  List<dynamic> upcoming;

  factory Data.fromJson(Map<String, dynamic> json) => Data(
        past: List<Past>.from(json["past"].map((x) => Past.fromJson(x))),
        upcoming: List<dynamic>.from(json["upcoming"].map((x) => x)),
      );

  Map<String, dynamic> toJson() => {
        "past": List<dynamic>.from(past.map((x) => x.toJson())),
        "upcoming": List<dynamic>.from(upcoming.map((x) => x)),
      };
}

class Past {
  Past({
    this.id,
    this.title,
    this.eventType,
    this.eventStartDate,
    this.eventEndDate,
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
  DateTime eventStartDate;
  DateTime eventEndDate;
  String pdfFile;
  String appImg;
  String altText;
  String status;
  AtedAt createdAt;
  AtedAt updatedAt;

  factory Past.fromJson(Map<String, dynamic> json) => Past(
        id: json["id"],
        title: json["title"],
        eventType: json["event_type"],
        eventStartDate: DateTime.parse(json["event_start_date"]),
        eventEndDate: DateTime.parse(json["event_end_date"]),
        pdfFile: json["pdf_file"],
        appImg: json["app_img"],
        altText: json["alt_text"],
        status: json["status"],
        createdAt: atedAtValues.map[json["created_at"]],
        updatedAt: atedAtValues.map[json["updated_at"]],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "title": title,
        "event_type": eventType,
        "event_start_date":
            "${eventStartDate.year.toString().padLeft(4, '0')}-${eventStartDate.month.toString().padLeft(2, '0')}-${eventStartDate.day.toString().padLeft(2, '0')}",
        "event_end_date":
            "${eventEndDate.year.toString().padLeft(4, '0')}-${eventEndDate.month.toString().padLeft(2, '0')}-${eventEndDate.day.toString().padLeft(2, '0')}",
        "pdf_file": pdfFile,
        "app_img": appImg,
        "alt_text": altText,
        "status": status,
        "created_at": atedAtValues.reverse[createdAt],
        "updated_at": atedAtValues.reverse[updatedAt],
      };
}

enum AtedAt { THE_00000000000000 }

final atedAtValues =
    EnumValues({"0000-00-00 00:00:00": AtedAt.THE_00000000000000});

class EnumValues<T> {
  Map<String, T> map;
  Map<T, String> reverseMap;

  EnumValues(this.map);

  Map<T, String> get reverse {
    if (reverseMap == null) {
      reverseMap = map.map((k, v) => new MapEntry(v, k));
    }
    return reverseMap;
  }
}
