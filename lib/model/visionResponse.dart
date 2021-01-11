// To parse this JSON data, do
//
//     final visionResponse = visionResponseFromJson(jsonString);

import 'dart:convert';

VisionResponse visionResponseFromJson(String str) =>
    VisionResponse.fromJson(json.decode(str));

String visionResponseToJson(VisionResponse data) => json.encode(data.toJson());

class VisionResponse {
  VisionResponse({
    this.the12,
  });

  List<The12> the12;

  factory VisionResponse.fromJson(Map<String, dynamic> json) => VisionResponse(
        the12: List<The12>.from(json["12"].map((x) => The12.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "12": List<dynamic>.from(the12.map((x) => x.toJson())),
      };
}

class The12 {
  The12({
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
  String image;
  String altText;
  String url;
  String utubeUrl;
  String metaKeyword;
  String metaDescription;
  String status;
  DateTime createdAt;
  DateTime updatedAt;

  factory The12.fromJson(Map<String, dynamic> json) => The12(
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
