// To parse this JSON data, do
//
//     final ourpolicyResponse = ourpolicyResponseFromJson(jsonString);

import 'dart:convert';

OurpolicyResponse ourpolicyResponseFromJson(String str) =>
    OurpolicyResponse.fromJson(json.decode(str));

String ourpolicyResponseToJson(OurpolicyResponse data) =>
    json.encode(data.toJson());

class OurpolicyResponse {
  OurpolicyResponse({
    this.the29,
  });

  List<The29> the29;

  factory OurpolicyResponse.fromJson(Map<String, dynamic> json) =>
      OurpolicyResponse(
        the29: List<The29>.from(json["29"].map((x) => The29.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "29": List<dynamic>.from(the29.map((x) => x.toJson())),
      };
}

class The29 {
  The29({
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

  factory The29.fromJson(Map<String, dynamic> json) => The29(
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
