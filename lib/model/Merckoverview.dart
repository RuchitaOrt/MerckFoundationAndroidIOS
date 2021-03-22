// To parse this JSON data, do
//
//     final merckoverviewResponse = merckoverviewResponseFromJson(jsonString);

import 'dart:convert';

MerckoverviewResponse merckoverviewResponseFromJson(String str) =>
    MerckoverviewResponse.fromJson(json.decode(str));

String merckoverviewResponseToJson(MerckoverviewResponse data) =>
    json.encode(data.toJson());

class MerckoverviewResponse {
  MerckoverviewResponse({
    this.baseUrl,
    this.success,
    this.msg,
    this.list,
  });

  String baseUrl;
  bool success;
  String msg;
  ListClass list;

  factory MerckoverviewResponse.fromJson(Map<String, dynamic> json) =>
      MerckoverviewResponse(
        baseUrl: json["base_url"],
        success: json["success"],
        msg: json["msg"],
        list: ListClass.fromJson(json["list"]),
      );

  Map<String, dynamic> toJson() => {
        "base_url": baseUrl,
        "success": success,
        "msg": msg,
        "list": list.toJson(),
      };
}

class ListClass {
  ListClass({
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

  factory ListClass.fromJson(Map<String, dynamic> json) => ListClass(
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
