import 'dart:convert';

OurActivityResponse ourActivityResponseFromJson(String str) =>
    OurActivityResponse.fromJson(json.decode(str));

String ourActivityResponseToJson(OurActivityResponse data) =>
    json.encode(data.toJson());

class OurActivityResponse {
  OurActivityResponse({this.success, this.msg, this.data, this.baseUrl});

  String success;
  String msg;
  Data data;
  dynamic baseUrl;

  factory OurActivityResponse.fromJson(Map<String, dynamic> json) =>
      OurActivityResponse(
        success: json["success"],
        msg: json["msg"],
        baseUrl: json["base_url"],
        data: json["data"] != null ? Data.fromJson(json["data"]) : null,
      );

  Map<String, dynamic> toJson() => {
        "success": success,
        "msg": msg,
        "base_url": baseUrl,
        "data": data?.toJson(),
      };
}

class Data {
  Data({this.list});

  List<ListElement> list;

  factory Data.fromJson(Map<String, dynamic> json) => Data(
        list: json["list"] != null
            ? List<ListElement>.from(
                json["list"].map((x) => ListElement.fromJson(x)))
            : null,
      );

  Map<String, dynamic> toJson() => {
        "list": list != null
            ? List<dynamic>.from(list.map((x) => x.toJson()))
            : null,
      };
}

class ListElement {
  ListElement({
    this.id,
    this.title,
    this.shortDescription,
    this.details,
    this.detailPageUrl,
    this.image,
    this.altTag,
    this.metaKeyword,
    this.metaDescription,
    this.status,
    this.createdAt,
    this.updatedAt,
  });

  dynamic id;
  dynamic title;
  dynamic shortDescription;
  dynamic details;
  dynamic detailPageUrl;
  dynamic image;
  dynamic altTag;
  dynamic metaKeyword;
  dynamic metaDescription;
  dynamic status;
  DateTime createdAt;
  DateTime updatedAt;

  factory ListElement.fromJson(Map<String, dynamic> json) => ListElement(
        id: json["id"],
        title: json["title"],
        shortDescription: json["short_description"],
        details: json["details"],
        detailPageUrl: json["detail_page_url"],
        image: json["image"],
        altTag: json["alt_tag"],
        metaKeyword: json["meta_keyword"],
        metaDescription: json["meta_description"],
        status: json["status"],
        createdAt: json["created_at"] != null
            ? DateTime.parse(json["created_at"])
            : null,
        updatedAt: json["updated_at"] != null
            ? DateTime.parse(json["updated_at"])
            : null,
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "title": title,
        "short_description": shortDescription,
        "details": details,
        "detail_page_url": detailPageUrl,
        "image": image,
        "alt_tag": altTag,
        "meta_keyword": metaKeyword,
        "meta_description": metaDescription,
        "status": status,
        "created_at": createdAt?.toIso8601String(),
        "updated_at": updatedAt?.toIso8601String(),
      };
}
