// To parse this JSON data, do
//
//     final searchvideocategoryResponse = searchvideocategoryResponseFromJson(jsonString);

import 'dart:convert';

SearchvideocategoryResponse searchvideocategoryResponseFromJson(String str) =>
    SearchvideocategoryResponse.fromJson(json.decode(str));

String searchvideocategoryResponseToJson(SearchvideocategoryResponse data) =>
    json.encode(data.toJson());

class SearchvideocategoryResponse {
  SearchvideocategoryResponse({
    this.success,
    this.msg,
    this.data,
  });

  String success;
  String msg;
  Data data;

  factory SearchvideocategoryResponse.fromJson(Map<String, dynamic> json) =>
      SearchvideocategoryResponse(
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
    this.videoLink,
    this.videoDesc,
  });

  String id;
  String videoLink;
  String videoDesc;

  factory ListElement.fromJson(Map<String, dynamic> json) => ListElement(
        id: json["id"],
        videoLink: json["video_link"],
        videoDesc: json["video_desc"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "video_link": videoLink,
        "video_desc": videoDesc,
      };
}
