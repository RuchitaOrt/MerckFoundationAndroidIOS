// To parse this JSON data, do
//
//     final getNewsReleaseanArticlesResponse = getNewsReleaseanArticlesResponseFromJson(jsonString);

import 'dart:convert';

// List<GetNewsReleaseanArticlesResponse> getNewsReleaseanArticlesResponseFromJson(String str) => List<GetNewsReleaseanArticlesResponse>.from(json.decode(str).map((x) => GetNewsReleaseanArticlesResponse.fromJson(x)));

// String getNewsReleaseanArticlesResponseToJson(List<GetNewsReleaseanArticlesResponse> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class GetNewsReleaseanArticlesResponse {
    GetNewsReleaseanArticlesResponse({
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

    factory GetNewsReleaseanArticlesResponse.fromJson(Map<String, dynamic> json) => GetNewsReleaseanArticlesResponse(
        id: json["id"],
        title: json["title"],
        shortDescription: json["short_description"],
        details: json["details"],
        detailPageUrl: json["detail_page_url"],
        image: json["image"],
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
