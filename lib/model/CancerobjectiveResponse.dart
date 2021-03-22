// To parse this JSON data, do
//
//     final cancerobjectiveResponse = cancerobjectiveResponseFromJson(jsonString);

import 'dart:convert';

CancerobjectiveResponse cancerobjectiveResponseFromJson(String str) =>
    CancerobjectiveResponse.fromJson(json.decode(str));

String cancerobjectiveResponseToJson(CancerobjectiveResponse data) =>
    json.encode(data.toJson());

class CancerobjectiveResponse {
  CancerobjectiveResponse({
    this.middleArea,
    this.rightArea,
  });

  MiddleArea middleArea;
  Map<String, RightArea> rightArea;

  factory CancerobjectiveResponse.fromJson(Map<String, dynamic> json) =>
      CancerobjectiveResponse(
        middleArea: MiddleArea.fromJson(json["middle_area"]),
        rightArea: Map.from(json["Right_area"]).map(
            (k, v) => MapEntry<String, RightArea>(k, RightArea.fromJson(v))),
      );

  Map<String, dynamic> toJson() => {
        "middle_area": middleArea.toJson(),
        "Right_area": Map.from(rightArea)
            .map((k, v) => MapEntry<String, dynamic>(k, v.toJson())),
      };
}

class MiddleArea {
  MiddleArea({
    this.the1,
  });

  The1 the1;

  factory MiddleArea.fromJson(Map<String, dynamic> json) => MiddleArea(
        the1: The1.fromJson(json["1"]),
      );

  Map<String, dynamic> toJson() => {
        "1": the1.toJson(),
      };
}

class The1 {
  The1({
    this.content,
  });

  Content content;

  factory The1.fromJson(Map<String, dynamic> json) => The1(
        content: Content.fromJson(json["content"]),
      );

  Map<String, dynamic> toJson() => {
        "content": content.toJson(),
      };
}

class Content {
  Content({
    this.list,
    this.baseUrl,
  });

  List<ContentList> list;
  String baseUrl;

  factory Content.fromJson(Map<String, dynamic> json) => Content(
        list: List<ContentList>.from(
            json["list"].map((x) => ContentList.fromJson(x))),
        baseUrl: json["base_url"],
      );

  Map<String, dynamic> toJson() => {
        "list": List<dynamic>.from(list.map((x) => x.toJson())),
        "base_url": baseUrl,
      };
}

class ContentList {
  ContentList({
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
  String metaDescription;
  String status;
  DateTime createdAt;
  DateTime updatedAt;

  factory ContentList.fromJson(Map<String, dynamic> json) => ContentList(
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

class RightArea {
  RightArea({
    this.callForApp,
    this.digitalLibrary,
  });

  CallForApp callForApp;
  CallForApp digitalLibrary;

  factory RightArea.fromJson(Map<String, dynamic> json) => RightArea(
        callForApp: json["call_for_app"] == null
            ? null
            : CallForApp.fromJson(json["call_for_app"]),
        digitalLibrary: json["digital_library"] == null
            ? null
            : CallForApp.fromJson(json["digital_library"]),
      );

  Map<String, dynamic> toJson() => {
        "call_for_app": callForApp == null ? null : callForApp.toJson(),
        "digital_library":
            digitalLibrary == null ? null : digitalLibrary.toJson(),
      };
}

class CallForApp {
  CallForApp({
    this.list,
    this.baseUrl,
  });

  List<CallForAppList> list;
  String baseUrl;

  factory CallForApp.fromJson(Map<String, dynamic> json) => CallForApp(
        list: List<CallForAppList>.from(
            json["list"].map((x) => CallForAppList.fromJson(x))),
        baseUrl: json["base_url"],
      );

  Map<String, dynamic> toJson() => {
        "list": List<dynamic>.from(list.map((x) => x.toJson())),
        "base_url": baseUrl,
      };
}

class CallForAppList {
  CallForAppList({
    this.id,
    this.title,
    this.eventType,
    this.eventStartDate,
    this.eventEndDate,
    this.pdfFile,
    this.appImg,
    this.altText,
    this.status,
    this.createdAt,
    this.updatedAt,
  });

  String id;
  String title;
  String eventType;
  DateTime eventStartDate;
  DateTime eventEndDate;
  String pdfFile;
  String appImg;
  String altText;
  String status;
  String createdAt;
  DateTime updatedAt;

  factory CallForAppList.fromJson(Map<String, dynamic> json) => CallForAppList(
        id: json["id"],
        title: json["title"],
        eventType: json["event_type"],
        eventStartDate: DateTime.parse(json["event_start_date"]),
        eventEndDate: DateTime.parse(json["event_end_date"]),
        pdfFile: json["pdf_file"],
        appImg: json["app_img"],
        altText: json["alt_text"],
        status: json["status"],
        createdAt: json["created_at"],
        updatedAt: DateTime.parse(json["updated_at"]),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "title": title,
        "event_type": eventType,
        "event_start_date":
            "${eventStartDate.year.toString().padLeft(4, '0')}-${eventStartDate.month.toString().padLeft(2, '0')}-${eventStartDate.day.toString().padLeft(2, '0')}",
        "event_end_date":
            "${eventEndDate.year.toString().padLeft(4, '0')}-${eventEndDate.month.toString().padLeft(2, '0')}-${eventEndDate.day.toString().padLeft(2, '0')}",
        "pdf_file": pdfFile,
        "app_img": appImg,
        "alt_text": altText,
        "status": status,
        "created_at": createdAt,
        "updated_at": updatedAt.toIso8601String(),
      };
}
