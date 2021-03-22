// To parse this JSON data, do
//
//     final ambassdarvideoResponse = ambassdarvideoResponseFromJson(jsonString);

import 'dart:convert';

AmbassdarvideoResponse ambassdarvideoResponseFromJson(String str) =>
    AmbassdarvideoResponse.fromJson(json.decode(str));

String ambassdarvideoResponseToJson(AmbassdarvideoResponse data) =>
    json.encode(data.toJson());

class AmbassdarvideoResponse {
  AmbassdarvideoResponse({
    this.success,
    this.msg,
    this.list,
  });

  bool success;
  String msg;
  List<ListElement> list;

  factory AmbassdarvideoResponse.fromJson(Map<String, dynamic> json) =>
      AmbassdarvideoResponse(
        success: json["success"],
        msg: json["msg"],
        list: List<ListElement>.from(
            json["list"].map((x) => ListElement.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "success": success,
        "msg": msg,
        "list": List<dynamic>.from(list.map((x) => x.toJson())),
      };
}

class ListElement {
  ListElement({
    this.id,
    this.videoLink,
    this.videoDesc,
    this.countryId,
    this.categoryId,
    this.year,
    this.status,
    this.createdAt,
    this.updatedAt,
  });

  String id;
  String videoLink;
  String videoDesc;
  String countryId;
  String categoryId;
  String year;
  String status;
  AtedAt createdAt;
  AtedAt updatedAt;

  factory ListElement.fromJson(Map<String, dynamic> json) => ListElement(
        id: json["id"],
        videoLink: json["video_link"],
        videoDesc: json["video_desc"],
        countryId: json["country_id"],
        categoryId: json["category_id"],
        year: json["year"],
        status: json["status"],
        createdAt: atedAtValues.map[json["created_at"]],
        updatedAt: atedAtValues.map[json["updated_at"]],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "video_link": videoLink,
        "video_desc": videoDesc,
        "country_id": countryId,
        "category_id": categoryId,
        "year": year,
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
