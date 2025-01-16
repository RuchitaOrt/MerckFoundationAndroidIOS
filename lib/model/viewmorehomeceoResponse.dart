// To parse this JSON data, do
//
//     final viewmorehomeceo = viewmorehomeceoFromJson(jsonString);

import 'dart:convert';

Viewmorehomeceo viewmorehomeceoFromJson(String str) =>
    Viewmorehomeceo.fromJson(json.decode(str));

String viewmorehomeceoToJson(Viewmorehomeceo data) =>
    json.encode(data.toJson());

class Viewmorehomeceo {
  Viewmorehomeceo({
    this.baseUrl,
    this.objectCount,
    this.success,
    this.msg,
    this.data,
  });

  String baseUrl;
  int objectCount;
  String success;
  String msg;
  Data data;

  factory Viewmorehomeceo.fromJson(Map<String, dynamic> json) =>
      Viewmorehomeceo(
        baseUrl: json["base_url"],
        objectCount: json["object_count"],
        success: json["success"],
        msg: json["msg"],
        data: Data.fromJson(json["data"]),
      );

  Map<String, dynamic> toJson() => {
        "base_url": baseUrl,
        "object_count": objectCount,
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
    this.articleType,
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
  String articleType;
  String title;
  String shortDescription;
  String details;
  String detailPageUrl;
  String image;
  AltTag altTag;
  String metaKeyword;
  String metaDescription;
  String status;
  DateTime createdAt;
  DateTime updatedAt;

  factory ListElement.fromJson(Map<String, dynamic> json) => ListElement(
        id: json["id"],
        articleType: json["article_type"],
        title: json["title"],
        shortDescription: json["short_description"],
        details: json["details"],
        detailPageUrl: json["detail_page_url"],
        image: json["image"],
        altTag: altTagValues.map[json["alt_tag"]],
        metaKeyword: json["meta_keyword"],
        metaDescription: json["meta_description"],
        status: json["status"],
        createdAt: DateTime.parse(json["created_at"]),
        updatedAt: DateTime.parse(json["updated_at"]),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "article_type": articleType,
        "title": title,
        "short_description": shortDescription,
        "details": details,
        "detail_page_url": detailPageUrl,
        "image": image,
        "alt_tag": altTagValues.reverse[altTag],
        "meta_keyword": metaKeyword,
        "meta_description": metaDescription,
        "status": status,
        "created_at": createdAt.toIso8601String(),
        "updated_at": updatedAt.toIso8601String(),
      };
}

enum AltTag {
  CEO_OF_MERCK_FOUNDATION_DR_RASHA_KELEJ,
  WINNERS_OF_MERCK_FOUNDATION_MMTM_AWARDS_2020,
  CEO_OF_MERCK_FOUNDATION_DR_RASHA_KELEJ_NAMIBIA_FIRST_LADY
}

final altTagValues = EnumValues({
  "CEO of Merck Foundation, Dr. Rasha Kelej":
      AltTag.CEO_OF_MERCK_FOUNDATION_DR_RASHA_KELEJ,
  "CEO of Merck Foundation, Dr. Rasha Kelej & Namibia First Lady ":
      AltTag.CEO_OF_MERCK_FOUNDATION_DR_RASHA_KELEJ_NAMIBIA_FIRST_LADY,
  "Winners of Merck Foundation MMTM Awards 2020":
      AltTag.WINNERS_OF_MERCK_FOUNDATION_MMTM_AWARDS_2020
});

class EnumValues<T> {
  Map<String, T> map;
  Map<T, String> reverseMap;

  EnumValues(this.map);

  Map<T, String> get reverse {
    if (reverseMap == null) {
      reverseMap = map.map((k, v) => new MapEntry(v, k));
    }
    return reverseMap;
  }
}


// // To parse this JSON data, do
// //
// //     final viewmorehomeceo = viewmorehomeceoFromJson(jsonString);

// import 'dart:convert';

// Viewmorehomeceo viewmorehomeceoFromJson(String str) =>
//     Viewmorehomeceo.fromJson(json.decode(str));

// String viewmorehomeceoToJson(Viewmorehomeceo data) =>
//     json.encode(data.toJson());

// class Viewmorehomeceo {
//   Viewmorehomeceo({
//     this.baseUrl,
//     this.objectCount,
//     this.success,
//     this.msg,
//     this.data,
//   });

//   String baseUrl;
//   int objectCount;
//   String success;
//   String msg;
//   Data data;

//   factory Viewmorehomeceo.fromJson(Map<String, dynamic> json) =>
//       Viewmorehomeceo(
//         baseUrl: json["base_url"],
//         objectCount: json["object_count"],
//         success: json["success"],
//         msg: json["msg"],
//         data: Data.fromJson(json["data"]),
//       );

//   Map<String, dynamic> toJson() => {
//         "base_url": baseUrl,
//         "object_count": objectCount,
//         "success": success,
//         "msg": msg,
//         "data": data.toJson(),
//       };
// }

// class Data {
//   Data({
//     this.list,
//   });

//   List<ListElement> list;

//   factory Data.fromJson(Map<String, dynamic> json) => Data(
//         list: List<ListElement>.from(
//             json["list"].map((x) => ListElement.fromJson(x))),
//       );

//   Map<String, dynamic> toJson() => {
//         "list": List<dynamic>.from(list.map((x) => x.toJson())),
//       };
// }

// class ListElement {
//   ListElement({
//     this.id,
//     this.articleType,
//     this.title,
//     this.shortDescription,
//     this.details,
//     this.detailPageUrl,
//     this.image,
//     this.altTag,
//     this.metaKeyword,
//     this.metaDescription,
//     this.status,
//     this.createdAt,
//     this.updatedAt,
//   });

//   String id;
//   String articleType;
//   String title;
//   String shortDescription;
//   String details;
//   String detailPageUrl;
//   String image;
//   AltTag altTag;
//   String metaKeyword;
//   String metaDescription;
//   String status;
//   DateTime createdAt;
//   DateTime updatedAt;

//   factory ListElement.fromJson(Map<String, dynamic> json) => ListElement(
//         id: json["id"],
//         articleType: json["article_type"],
//         title: json["title"],
//         shortDescription: json["short_description"],
//         details: json["details"],
//         detailPageUrl: json["detail_page_url"],
//         image: json["image"],
//         altTag: altTagValues.map[json["alt_tag"]],
//         metaKeyword: json["meta_keyword"],
//         metaDescription: json["meta_description"],
//         status: json["status"],
//         createdAt: DateTime.parse(json["created_at"]),
//         updatedAt: DateTime.parse(json["updated_at"]),
//       );

//   Map<String, dynamic> toJson() => {
//         "id": id,
//         "article_type": articleType,
//         "title": title,
//         "short_description": shortDescription,
//         "details": details,
//         "detail_page_url": detailPageUrl,
//         "image": image,
//         "alt_tag": altTagValues.reverse[altTag],
//         "meta_keyword": metaKeyword,
//         "meta_description": metaDescription,
//         "status": status,
//         "created_at": createdAt.toIso8601String(),
//         "updated_at": updatedAt.toIso8601String(),
//       };
// }

// enum AltTag {
//   CEO_OF_MERCK_FOUNDATION_DR_RASHA_KELEJ,
//   WINNERS_OF_MERCK_FOUNDATION_MMTM_AWARDS_2020,
//   CEO_OF_MERCK_FOUNDATION_DR_RASHA_KELEJ_NAMIBIA_FIRST_LADY
// }

// final altTagValues = EnumValues({
//   "CEO of Merck Foundation, Dr. Rasha Kelej":
//       AltTag.CEO_OF_MERCK_FOUNDATION_DR_RASHA_KELEJ,
//   "CEO of Merck Foundation, Dr. Rasha Kelej & Namibia First Lady ":
//       AltTag.CEO_OF_MERCK_FOUNDATION_DR_RASHA_KELEJ_NAMIBIA_FIRST_LADY,
//   "Winners of Merck Foundation MMTM Awards 2020":
//       AltTag.WINNERS_OF_MERCK_FOUNDATION_MMTM_AWARDS_2020
// });

// class EnumValues<T> {
//   Map<String, T> map;
//   Map<T, String> reverseMap;

//   EnumValues(this.map);

//   Map<T, String> get reverse {
//     if (reverseMap == null) {
//       reverseMap = map.map((k, v) => new MapEntry(v, k));
//     }
//     return reverseMap;
//   }
// }
