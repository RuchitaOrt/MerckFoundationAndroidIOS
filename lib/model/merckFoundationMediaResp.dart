// To parse this JSON data, do
//
//     final merckinMediaResponse = merckinMediaResponseFromJson(jsonString);

import 'dart:convert';

MerckinMediaResponse merckinMediaResponseFromJson(String str) => MerckinMediaResponse.fromJson(json.decode(str));

String merckinMediaResponseToJson(MerckinMediaResponse data) => json.encode(data.toJson());

class MerckinMediaResponse {
    MerckinMediaResponse({
        this.success,
        this.msg,
        this.data,
        this.baseUrl
    });

    String success;
    String msg;
    Data data;
    String baseUrl;

    factory MerckinMediaResponse.fromJson(Map<String, dynamic> json) => MerckinMediaResponse(
        success: json["success"],
        msg: json["msg"],
        baseUrl: json["base_url"],
        data: Data.fromJson(json["data"]),
    );

    Map<String, dynamic> toJson() => {
        "success": success,
        "msg": msg,
        "data": data.toJson(),
        "base_url": baseUrl,
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
    DateTime createdAt;
    DateTime updatedAt;

    factory ListElement.fromJson(Map<String, dynamic> json) => ListElement(
        id: json["id"],
        title: json["title"] == null? "":json["title"],
        description: json["description"],
        mediaUrl: json["media_url"] == null ? "": json["media_url"],
        image: json["image"] == null? "": json["image"],
        altText: json["alt_text"],
        status: json["status"],
        createdAt: DateTime.parse(json["created_at"]),
        updatedAt: DateTime.parse(json["updated_at"]),
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "title": title,
        "description": description,
        "media_url": mediaUrl,
        "image": image,
        "alt_text": altText,
        "status": status,
        "created_at": createdAt.toIso8601String(),
        "updated_at": updatedAt.toIso8601String(),
    };
}
