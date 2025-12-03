import 'dart:convert';

PoliticalDeutrality politicalDeutralityFromJson(String str) =>
    PoliticalDeutrality.fromJson(json.decode(str));

String politicalDeutralityToJson(PoliticalDeutrality data) =>
    json.encode(data.toJson());

class PoliticalDeutrality {
  String? success;
  String? msg;
  Data? data;

  PoliticalDeutrality({
    this.success,
    this.msg,
    this.data,
  });

  factory PoliticalDeutrality.fromJson(Map<String, dynamic> json) =>
      PoliticalDeutrality(
        success: json["success"],
        msg: json["msg"],
        data: json["data"] == null ? null : Data.fromJson(json["data"]),
      );

  Map<String, dynamic> toJson() => {
        "success": success,
        "msg": msg,
        "data": data?.toJson(),
      };
}

class Data {
  List<ListElement>? list;

  Data({
    this.list,
  });

  factory Data.fromJson(Map<String, dynamic> json) => Data(
        list: json["list"] == null
            ? null
            : List<ListElement>.from(
                json["list"].map((x) => ListElement.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "list": list == null
            ? null
            : List<dynamic>.from(list!.map((x) => x.toJson())),
      };
}

class ListElement {
  String? id;
  String? contentType;
  dynamic awardId;
  dynamic year;
  String? pageContent;
  String? title;
  String? shortDescription;
  dynamic image;
  String? altText;
  String? url;
  String? utubeUrl;
  String? metaKeyword;
  String? metaDescription;
  String? status;
  String? createdBy;
  String? modifiedBy;
  DateTime? createdAt;
  DateTime? updatedAt;

  ListElement({
    this.id,
    this.contentType,
    this.awardId,
    this.year,
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
    this.createdBy,
    this.modifiedBy,
    this.createdAt,
    this.updatedAt,
  });

  factory ListElement.fromJson(Map<String, dynamic> json) => ListElement(
        id: json["id"],
        contentType: json["content_type"],
        awardId: json["award_id"],
        year: json["year"],
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
        createdBy: json["created_by"],
        modifiedBy: json["modified_by"],
        createdAt: json["created_at"] == null ? null : DateTime.parse(json["created_at"]),
        updatedAt: json["updated_at"] == null ? null : DateTime.parse(json["updated_at"]),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "content_type": contentType,
        "award_id": awardId,
        "year": year,
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
        "created_by": createdBy,
        "modified_by": modifiedBy,
        "created_at": createdAt?.toIso8601String(),
        "updated_at": updatedAt?.toIso8601String(),
      };
}

// // To parse this JSON data, do
// //
// //     final politicalDeutrality = politicalDeutralityFromJson(jsonString);

// import 'dart:convert';

// PoliticalDeutrality politicalDeutralityFromJson(String str) =>
//     PoliticalDeutrality.fromJson(json.decode(str));

// String politicalDeutralityToJson(PoliticalDeutrality data) =>
//     json.encode(data.toJson());

// class PoliticalDeutrality {
//   String success;
//   String msg;
//   Data data;

//   PoliticalDeutrality({
//     this.success,
//     this.msg,
//     this.data,
//   });

//   factory PoliticalDeutrality.fromJson(Map<String, dynamic> json) =>
//       PoliticalDeutrality(
//         success: json["success"],
//         msg: json["msg"],
//         data: Data.fromJson(json["data"]),
//       );

//   Map<String, dynamic> toJson() => {
//         "success": success,
//         "msg": msg,
//         "data": data.toJson(),
//       };
// }

// class Data {
//   List<ListElement> list;

//   Data({
//     this.list,
//   });

//   factory Data.fromJson(Map<String, dynamic> json) => Data(
//         list: List<ListElement>.from(
//             json["list"].map((x) => ListElement.fromJson(x))),
//       );

//   Map<String, dynamic> toJson() => {
//         "list": List<dynamic>.from(list.map((x) => x.toJson())),
//       };
// }

// class ListElement {
//   String id;
//   String contentType;
//   dynamic awardId;
//   dynamic year;
//   String pageContent;
//   String title;
//   String shortDescription;
//   dynamic image;
//   String altText;
//   String url;
//   String utubeUrl;
//   String metaKeyword;
//   String metaDescription;
//   String status;
//   String createdBy;
//   String modifiedBy;
//   DateTime createdAt;
//   DateTime updatedAt;

//   ListElement({
//     this.id,
//     this.contentType,
//     this.awardId,
//     this.year,
//     this.pageContent,
//     this.title,
//     this.shortDescription,
//     this.image,
//     this.altText,
//     this.url,
//     this.utubeUrl,
//     this.metaKeyword,
//     this.metaDescription,
//     this.status,
//     this.createdBy,
//     this.modifiedBy,
//     this.createdAt,
//     this.updatedAt,
//   });

//   factory ListElement.fromJson(Map<String, dynamic> json) => ListElement(
//         id: json["id"],
//         contentType: json["content_type"],
//         awardId: json["award_id"],
//         year: json["year"],
//         pageContent: json["page_content"],
//         title: json["title"],
//         shortDescription: json["short_description"],
//         image: json["image"],
//         altText: json["alt_text"],
//         url: json["url"],
//         utubeUrl: json["utube_url"],
//         metaKeyword: json["meta_keyword"],
//         metaDescription: json["meta_description"],
//         status: json["status"],
//         createdBy: json["created_by"],
//         modifiedBy: json["modified_by"],
//         createdAt: DateTime.parse(json["created_at"]),
//         updatedAt: DateTime.parse(json["updated_at"]),
//       );

//   Map<String, dynamic> toJson() => {
//         "id": id,
//         "content_type": contentType,
//         "award_id": awardId,
//         "year": year,
//         "page_content": pageContent,
//         "title": title,
//         "short_description": shortDescription,
//         "image": image,
//         "alt_text": altText,
//         "url": url,
//         "utube_url": utubeUrl,
//         "meta_keyword": metaKeyword,
//         "meta_description": metaDescription,
//         "status": status,
//         "created_by": createdBy,
//         "modified_by": modifiedBy,
//         "created_at": createdAt.toIso8601String(),
//         "updated_at": updatedAt.toIso8601String(),
//       };
// }
