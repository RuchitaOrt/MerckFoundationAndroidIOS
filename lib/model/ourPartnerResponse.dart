// To parse this JSON data, do
//
//     final ourpartnerResponse = ourpartnerResponseFromJson(jsonString);

import 'dart:convert';

OurpartnerResponse ourpartnerResponseFromJson(String str) => OurpartnerResponse.fromJson(json.decode(str));

String ourpartnerResponseToJson(OurpartnerResponse data) => json.encode(data.toJson());

class OurpartnerResponse {
    OurpartnerResponse({
        this.success,
        this.msg,
        this.baseUrl,
        this.data,
    });

    String success;
    String msg;
    String baseUrl;
    Data data;

    factory OurpartnerResponse.fromJson(Map<String, dynamic> json) => OurpartnerResponse(
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
        this.webUrl,
        this.image,
        this.altText,
        this.status,
        this.createdAt,
        this.updatedAt,
    });

    String id;
    String title;
    String webUrl;
    String image;
    String altText;
    String status;
    DateTime createdAt;
    DateTime updatedAt;

    factory ListElement.fromJson(Map<String, dynamic> json) => ListElement(
        id: json["id"],
        title: json["title"] == null? "": json["title"],
        webUrl: json["web_url"] == null ? "": json["web_url"],
        image: json["image"] == null? "": json["image"],
        altText: json["alt_text"],
        status: json["status"],
        createdAt: DateTime.parse(json["created_at"]),
        updatedAt: DateTime.parse(json["updated_at"]),
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "title": title,
        "web_url": webUrl,
        "image": image,
        "alt_text": altText,
        "status": status,
        "created_at": createdAt.toIso8601String(),
        "updated_at": updatedAt.toIso8601String(),
    };
}
