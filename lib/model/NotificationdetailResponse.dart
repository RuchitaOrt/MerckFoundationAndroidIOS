// To parse this JSON data, do
//
//     final notificationdetailResponse = notificationdetailResponseFromJson(jsonString);

import 'dart:convert';

NotificationdetailResponse notificationdetailResponseFromJson(String str) =>
    NotificationdetailResponse.fromJson(json.decode(str));

String notificationdetailResponseToJson(NotificationdetailResponse data) =>
    json.encode(data.toJson());

class NotificationdetailResponse {
  NotificationdetailResponse({
    this.success,
    this.url,
    this.msg,
    this.list,
  });

  bool success;
  String url;
  String msg;
  List<ListElement> list;

  factory NotificationdetailResponse.fromJson(Map<String, dynamic> json) =>
      NotificationdetailResponse(
        success: json["success"],
        url: json["url"],
        msg: json["msg"],
        list: List<ListElement>.from(
            json["list"].map((x) => ListElement.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "success": success,
        "url": url,
        "msg": msg,
        "list": List<dynamic>.from(list.map((x) => x.toJson())),
      };
}

class ListElement {
  ListElement({
    this.title,
    this.details,
    this.image,
  });

  String title;
  String details;
  String image;

  factory ListElement.fromJson(Map<String, dynamic> json) => ListElement(
        title: json["title"],
        details: json["details"],
        image: json["image"],
      );

  Map<String, dynamic> toJson() => {
        "title": title,
        "details": details,
        "image": image,
      };
}
