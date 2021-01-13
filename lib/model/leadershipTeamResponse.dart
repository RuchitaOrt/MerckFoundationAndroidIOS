// To parse this JSON data, do
//
//     final messageFromleadershipResponse = messageFromleadershipResponseFromJson(jsonString);

import 'dart:convert';

MessageFromleadershipResponse messageFromleadershipResponseFromJson(
        String str) =>
    MessageFromleadershipResponse.fromJson(json.decode(str));

String messageFromleadershipResponseToJson(
        MessageFromleadershipResponse data) =>
    json.encode(data.toJson());

class MessageFromleadershipResponse {
  MessageFromleadershipResponse({
    this.success,
    this.msg,
    this.data,
  });

  String success;
  String msg;
  Data data;

  factory MessageFromleadershipResponse.fromJson(Map<String, dynamic> json) =>
      MessageFromleadershipResponse(
        success: json["success"],
        msg: json["msg"],
        data: Data.fromJson(json["data"]),
      );

  Map<String, dynamic> toJson() => {
        "success": success,
        "msg": msg,
        "data": data.toJson(),
      };
}

class Data {
  Data({
    this.list,
  });

  List<ListElement> list;

  factory Data.fromJson(Map<String, dynamic> json) => Data(
        list: List<ListElement>.from(
            json["list"].map((x) => ListElement.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "list": List<dynamic>.from(list.map((x) => x.toJson())),
      };
}

class ListElement {
  ListElement({
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

  factory ListElement.fromJson(Map<String, dynamic> json) => ListElement(
        id: json["id"],
        contentType: json["content_type"],
        pageContent: json["page_content"],
        title: json["title"] == null ? "" : json["title"],
        shortDescription:
            json["short_description"] == null ? "" : json["short_description"],
        image: json["image"] == null ? "" : json["image"],
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
