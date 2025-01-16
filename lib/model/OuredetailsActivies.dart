// To parse this JSON data, do
//
//     final ouredetailsActivies = ouredetailsActiviesFromJson(jsonString);

import 'dart:convert';

OuredetailsActivies ouredetailsActiviesFromJson(String str) =>
    OuredetailsActivies.fromJson(json.decode(str));

String ouredetailsActiviesToJson(OuredetailsActivies data) =>
    json.encode(data.toJson());

class OuredetailsActivies {
  bool status;
  String message;
  Data data;

  OuredetailsActivies({
    this.status,
    this.message,
    this.data,
  });

  factory OuredetailsActivies.fromJson(Map<String, dynamic> json) =>
      OuredetailsActivies(
        status: json["status"],
        message: json["message"],
        data: Data.fromJson(json["data"]),
      );

  Map<String, dynamic> toJson() => {
        "status": status,
        "message": message,
        "data": data.toJson(),
      };
}

class Data {
  String id;
  String articleType;
  String title;
  String shortDescription;
  String details;
  String detailPageUrl;
  String image;
  String altTag;
  String metaKeyword;
  String metaDescription;
  String notification;
  String status;
  String createdBy;
  String modifiedBy;
  DateTime createdAt;
  DateTime updatedAt;
  String baseUrl;

  Data({
    this.id,
    this.articleType,
    this.title,
    this.shortDescription,
    this.details,
    this.detailPageUrl,
    this.image,
    this.altTag,
    this.metaKeyword,
    this.metaDescription,
    this.notification,
    this.status,
    this.createdBy,
    this.modifiedBy,
    this.createdAt,
    this.updatedAt,
    this.baseUrl,
  });

  factory Data.fromJson(Map<String, dynamic> json) => Data(
        id: json["id"],
        articleType: json["article_type"],
        title: json["title"],
        shortDescription: json["short_description"],
        details: json["details"],
        detailPageUrl: json["detail_page_url"],
        image: json["image"],
        altTag: json["alt_tag"],
        metaKeyword: json["meta_keyword"],
        metaDescription: json["meta_description"],
        notification: json["notification"],
        status: json["status"],
        createdBy: json["created_by"],
        modifiedBy: json["modified_by"],
        createdAt: DateTime.parse(json["created_at"]),
        updatedAt: DateTime.parse(json["updated_at"]),
        baseUrl: json["base_url"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "article_type": articleType,
        "title": title,
        "short_description": shortDescription,
        "details": details,
        "detail_page_url": detailPageUrl,
        "image": image,
        "alt_tag": altTag,
        "meta_keyword": metaKeyword,
        "meta_description": metaDescription,
        "notification": notification,
        "status": status,
        "created_by": createdBy,
        "modified_by": modifiedBy,
        "created_at": createdAt.toIso8601String(),
        "updated_at": updatedAt.toIso8601String(),
        "base_url": baseUrl,
      };
}
