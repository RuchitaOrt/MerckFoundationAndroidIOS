// To parse this JSON data, do
//
//     final yearwisePhotogalleryResponse = yearwisePhotogalleryResponseFromJson(jsonString);

import 'dart:convert';

YearwisePhotogalleryResponse yearwisePhotogalleryResponseFromJson(String str) =>
    YearwisePhotogalleryResponse.fromJson(json.decode(str));

String yearwisePhotogalleryResponseToJson(YearwisePhotogalleryResponse data) =>
    json.encode(data.toJson());

class YearwisePhotogalleryResponse {
  YearwisePhotogalleryResponse({
    this.baseUrl,
    this.success,
    this.msg,
    this.list,
  });

  String baseUrl;
  String success;
  String msg;
  List<ListElement> list;

  factory YearwisePhotogalleryResponse.fromJson(Map<String, dynamic> json) =>
      YearwisePhotogalleryResponse(
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
    this.photoCatgName,
    this.url,
    this.position,
    this.type,
    this.status,
    this.createdAt,
    this.updatedAt,
    this.pId,
    this.photo,
    this.photoCategoryId,
    this.albumNameId,
    this.photoDescription,
    this.altTag,
    this.year,
    this.featuredImage,
  });

  String id;
  String photoCatgName;
  String url;
  String position;
  String type;
  String status;
  String createdAt;
  DateTime updatedAt;
  String pId;
  String photo;
  String photoCategoryId;
  String albumNameId;
  String photoDescription;
  String altTag;
  String year;
  String featuredImage;

  factory ListElement.fromJson(Map<String, dynamic> json) => ListElement(
        id: json["id"],
        photoCatgName: json["photo_catg_name"],
        url: json["url"],
        position: json["position"],
        type: json["type"],
        status: json["status"],
        createdAt: json["created_at"],
        updatedAt: DateTime.parse(json["updated_at"]),
        pId: json["p_id"],
        photo: json["photo"],
        photoCategoryId: json["photo_category_id"],
        albumNameId: json["album_name_id"],
        photoDescription: json["photo_description"],
        altTag: json["alt_tag"],
        year: json["year"],
        featuredImage: json["featured_image"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "photo_catg_name": photoCatgName,
        "url": url,
        "position": position,
        "type": type,
        "status": status,
        "created_at": createdAt,
        "updated_at": updatedAt.toIso8601String(),
        "p_id": pId,
        "photo": photo,
        "photo_category_id": photoCategoryId,
        "album_name_id": albumNameId,
        "photo_description": photoDescription,
        "alt_tag": altTag,
        "year": year,
        "featured_image": featuredImage,
      };
}
