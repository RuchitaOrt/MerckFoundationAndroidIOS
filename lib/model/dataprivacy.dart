// To parse this JSON data, do
//
//     final dataprivacyResponse = dataprivacyResponseFromJson(jsonString);

import 'dart:convert';

DataprivacyResponse dataprivacyResponseFromJson(String str) =>
    DataprivacyResponse.fromJson(json.decode(str));

String dataprivacyResponseToJson(DataprivacyResponse data) =>
    json.encode(data.toJson());

class DataprivacyResponse {
  DataprivacyResponse({
    this.the30,
  });

  List<The30> the30;

  factory DataprivacyResponse.fromJson(Map<String, dynamic> json) =>
      DataprivacyResponse(
        the30: List<The30>.from(json["30"].map((x) => The30.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "30": List<dynamic>.from(the30.map((x) => x.toJson())),
      };
}

class The30 {
  The30({
    this.id,
    this.contentType,
    this.pageContent,
    this.title,
    this.shortDescription,
    this.image,
    this.altText,
    this.url,
    this.utubeUrl,
    this.metaKeyword,
    this.metaDescription,
    this.status,
    this.createdAt,
    this.updatedAt,
  });

  String id;
  String contentType;
  String pageContent;
  String title;
  String shortDescription;
  dynamic image;
  String altText;
  String url;
  String utubeUrl;
  String metaKeyword;
  dynamic metaDescription;
  String status;
  DateTime createdAt;
  DateTime updatedAt;

  factory The30.fromJson(Map<String, dynamic> json) => The30(
        id: json["id"],
        contentType: json["content_type"],
        pageContent: json["page_content"],
        title: json["title"],
        shortDescription: json["short_description"],
        image: json["image"],
        altText: json["alt_text"],
        url: json["url"],
        utubeUrl: json["utube_url"],
        metaKeyword: json["meta_keyword"],
        metaDescription: json["meta_description"],
        status: json["status"],
        createdAt: DateTime.parse(json["created_at"]),
        updatedAt: DateTime.parse(json["updated_at"]),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "content_type": contentType,
        "page_content": pageContent,
        "title": title,
        "short_description": shortDescription,
        "image": image,
        "alt_text": altText,
        "url": url,
        "utube_url": utubeUrl,
        "meta_keyword": metaKeyword,
        "meta_description": metaDescription,
        "status": status,
        "created_at": createdAt.toIso8601String(),
        "updated_at": updatedAt.toIso8601String(),
      };
}
