// To parse this JSON data, do
//
//     final viewmoremediaResponse = viewmoremediaResponseFromJson(jsonString);

import 'dart:convert';

ViewmoremediaResponse viewmoremediaResponseFromJson(String str) =>
    ViewmoremediaResponse.fromJson(json.decode(str));

String viewmoremediaResponseToJson(ViewmoremediaResponse data) =>
    json.encode(data.toJson());

class ViewmoremediaResponse {
  ViewmoremediaResponse({
    this.baseUrl,
    this.success,
    this.msg,
    this.list,
  });

  String baseUrl;
  String success;
  String msg;
  List<ListElement> list;

  factory ViewmoremediaResponse.fromJson(Map<String, dynamic> json) =>
      ViewmoremediaResponse(
        baseUrl: json["base_url"],
        success: json["success"],
        msg: json["msg"],
        list: List<ListElement>.from(
            json["list"].map((x) => ListElement.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "base_url": baseUrl,
        "success": success,
        "msg": msg,
        "list": List<dynamic>.from(list.map((x) => x.toJson())),
      };
}

class ListElement {
  ListElement({
    this.id,
    this.title,
    this.description,
    this.mediaUrl,
    this.image,
    this.altText,
    this.status,
    this.createdAt,
    this.updatedAt,
  });

  String id;
  String title;
  String description;
  String mediaUrl;
  String image;
  String altText;
  String status;
  String createdAt;
  String updatedAt;

  factory ListElement.fromJson(Map<String, dynamic> json) => ListElement(
        id: json["id"],
        title: json["title"],
        description: json["description"],
        mediaUrl: json["media_url"],
        image: json["image"],
        altText: json["alt_text"],
        status: json["status"],
        createdAt: json["created_at"],
        updatedAt: json["updated_at"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "title": title,
        "description": description,
        "media_url": mediaUrl,
        "image": image,
        "alt_text": altText,
        "status": status,
        "created_at": createdAt,
        "updated_at": updatedAt,
      };
}
