// To parse this JSON data, do
//
//     final newsletterArticleResponse = newsletterArticleResponseFromJson(jsonString);

import 'dart:convert';

NewsletterArticleResponse newsletterArticleResponseFromJson(String str) => NewsletterArticleResponse.fromJson(json.decode(str));

String newsletterArticleResponseToJson(NewsletterArticleResponse data) => json.encode(data.toJson());

class NewsletterArticleResponse {
    NewsletterArticleResponse({
        this.success,
        this.msg,
        this.data,
    });

    String success;
    String msg;
    Data data;

    factory NewsletterArticleResponse.fromJson(Map<String, dynamic> json) => NewsletterArticleResponse(
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
        this.shortDescription,
        this.details,
        this.detailPageUrl,
        this.image,
        this.altTag,
        this.metaKeyword,
        this.metaDescription,
        this.status,
        this.createdAt,
        this.updatedAt,
    });

    String id;
    String title;
    String shortDescription;
    String details;
    String detailPageUrl;
    String image;
    String altTag;
    String metaKeyword;
    String metaDescription;
    String status;
    DateTime createdAt;
    DateTime updatedAt;

    factory ListElement.fromJson(Map<String, dynamic> json) => ListElement(
        id: json["id"],
        title: json["title"] == null? "": json["title"],
        shortDescription: json["short_description"],
        details: json["details"],
        detailPageUrl: json["detail_page_url"] == null? "": json["detail_page_url"],
        image: json["image"] == null? "" : json["image"],
        altTag: json["alt_tag"],
        metaKeyword: json["meta_keyword"],
        metaDescription: json["meta_description"],
        status: json["status"],
        createdAt: DateTime.parse(json["created_at"]),
        updatedAt: DateTime.parse(json["updated_at"]),
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "title": title,
        "short_description": shortDescription,
        "details": details,
        "detail_page_url": detailPageUrl,
        "image": image,
        "alt_tag": altTag,
        "meta_keyword": metaKeyword,
        "meta_description": metaDescription,
        "status": status,
        "created_at": createdAt.toIso8601String(),
        "updated_at": updatedAt.toIso8601String(),
    };
}
