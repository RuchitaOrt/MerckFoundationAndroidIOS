// To parse this JSON data, do
//
//     final newsreleaseResponse = newsreleaseResponseFromJson(jsonString);

import 'dart:convert';

NewsreleaseResponse newsreleaseResponseFromJson(String str) => NewsreleaseResponse.fromJson(json.decode(str));

String newsreleaseResponseToJson(NewsreleaseResponse data) => json.encode(data.toJson());

class NewsreleaseResponse {
    NewsreleaseResponse({
        this.success,
        this.msg,
        this.baseUrl,
        this.data,
    });

    String success;
    String msg;
    Data data;
    String baseUrl;

    factory NewsreleaseResponse.fromJson(Map<String, dynamic> json) => NewsreleaseResponse(
        success: json["success"],
        msg: json["msg"],
        baseUrl: json["base_url"],
        data: Data.fromJson(json["data"]),
    );

    Map<String, dynamic> toJson() => {
        "success": success,
        "msg": msg,
        "base_url":baseUrl,
        "data": data.toJson(),
    };
}

class Data {
    Data({
        this.list,
    });

    List<ListElement> list;

    factory Data.fromJson(Map<String, dynamic> json) => Data(
        list: List<ListElement>.from(json["list"].map((x) => ListElement.fromJson(x))),
    );

    Map<String, dynamic> toJson() => {
        "list": List<dynamic>.from(list.map((x) => x.toJson())),
    };
}

class ListElement {
    ListElement({
        this.id,
        this.title,
        this.eventType,
        this.eventYear,
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
    String eventYear;
    String pdfFile;
    String appImg;
    String altText;
    String status;
    DateTime createdAt;
    DateTime updatedAt;

    factory ListElement.fromJson(Map<String, dynamic> json) => ListElement(
        id: json["id"],
        title: json["title"] == null ? "": json["title"],
        eventType: json["event_type"],
        eventYear: json["event_year"],
        pdfFile: json["pdf_file"] == null? "": json["pdf_file"],
        appImg: json["app_img"]  == null ? "": json["app_img"],
        altText: json["alt_text"],
        status: json["status"],
        createdAt: DateTime.parse(json["created_at"]),
        updatedAt: DateTime.parse(json["updated_at"]),
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "title": title,
        "event_type": eventType,
        "event_year": eventYear,
        "pdf_file": pdfFile,
        "app_img": appImg,
        "alt_text": altText,
        "status": status,
        "created_at": createdAt.toIso8601String(),
        "updated_at": updatedAt.toIso8601String(),
    };
}
