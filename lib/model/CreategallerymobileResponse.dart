// To parse this JSON data, do
//
//     final creategallerymobileResponse = creategallerymobileResponseFromJson(jsonString);

import 'dart:convert';

CreategallerymobileResponse creategallerymobileResponseFromJson(String str) =>
    CreategallerymobileResponse.fromJson(json.decode(str));

String creategallerymobileResponseToJson(CreategallerymobileResponse data) =>
    json.encode(data.toJson());

class CreategallerymobileResponse {
  CreategallerymobileResponse({
    this.baseUrl,
    this.success,
    this.msg,
    this.list,
  });

  String baseUrl;
  String success;
  String msg;
  List<ListElement> list;

  factory CreategallerymobileResponse.fromJson(Map<String, dynamic> json) =>
      CreategallerymobileResponse(
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
    this.categoryId,
    this.albumName,
    this.url,
    this.position,
    this.status,
    this.createdAt,
    this.updatedAt,
    this.photoId,
    this.photo,
    this.photoCategoryId,
    this.albumNameId,
    this.photoDescription,
    this.year,
    this.altTag,
  });

  String id;
  String categoryId;
  String albumName;
  String url;
  String position;
  String status;
  DateTime createdAt;
  DateTime updatedAt;
  String photoId;
  String photo;
  String photoCategoryId;
  String albumNameId;
  String photoDescription;
  String year;
  String altTag;

  factory ListElement.fromJson(Map<String, dynamic> json) => ListElement(
        id: json["id"],
        categoryId: json["category_id"],
        albumName: json["album_name"],
        url: json["url"],
        position: json["position"],
        status: json["status"],
        createdAt: DateTime.parse(json["created_at"]),
        updatedAt: DateTime.parse(json["updated_at"]),
        photoId: json["photo_id"],
        photo: json["photo"],
        photoCategoryId: json["photo_category_id"],
        albumNameId: json["album_name_id"],
        photoDescription: json["photo_description"],
        year: json["year"],
        altTag: json["alt_tag"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "category_id": categoryId,
        "album_name": albumName,
        "url": url,
        "position": position,
        "status": status,
        "created_at": createdAt.toIso8601String(),
        "updated_at": updatedAt.toIso8601String(),
        "photo_id": photoId,
        "photo": photo,
        "photo_category_id": photoCategoryId,
        "album_name_id": albumNameId,
        "photo_description": photoDescription,
        "year": year,
        "alt_tag": altTag,
      };
}
