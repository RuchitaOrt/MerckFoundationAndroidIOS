import 'dart:convert';

DigitalProgramResponse digitalProgramResponseFromJson(String str) =>
    DigitalProgramResponse.fromJson(json.decode(str));

String digitalProgramResponseToJson(DigitalProgramResponse data) =>
    json.encode(data.toJson());

class DigitalProgramResponse {
  DigitalProgramResponse({
    this.baseUrl,
    this.pdfUrl,
    this.objectCount,
    this.success,
    this.msg,
    this.list,
  });

  String? baseUrl;
  String? pdfUrl;
  int? objectCount;
  String? success;
  String? msg;
  List<ListClass>? list;

  factory DigitalProgramResponse.fromJson(Map<String, dynamic> json) =>
      DigitalProgramResponse(
        baseUrl: json["base_url"],
        pdfUrl: json["pdf_url"],
        objectCount: json["object_count"],
        success: json["success"],
        msg: json["msg"],
        list: json["list"] == null
            ? null
            : List<ListClass>.from(
                json["list"].map((x) => x == null ? null : ListClass.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "base_url": baseUrl,
        "pdf_url": pdfUrl,
        "object_count": objectCount,
        "success": success,
        "msg": msg,
        "list": list == null
            ? null
            : List<dynamic>.from(list!.map((x) => x == null ? null : x.toJson())),
      };
}

class ListClass {
  ListClass({
    this.id,
    this.categoryType,
    this.title,
    this.image,
    this.altText,
    this.document,
    this.status,
    this.createdAt,
    this.updatedAt,
  });

  String? id;
  String? categoryType;
  String? title;
  String? image;
  String? altText;
  String? document;
  String? status;
  String? createdAt;
  String? updatedAt;

  factory ListClass.fromJson(Map<String, dynamic> json) => ListClass(
        id: json["id"],
        categoryType: json["category_type"],
        title: json["title"],
        image: json["image"],
        altText: json["alt_text"],
        document: json["document"],
        status: json["status"],
        createdAt: json["created_at"],
        updatedAt: json["updated_at"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "category_type": categoryType,
        "title": title,
        "image": image,
        "alt_text": altText,
        "document": document,
        "status": status,
        "created_at": createdAt,
        "updated_at": updatedAt,
      };
}

// // To parse this JSON data, do
// //
// //     final digitalProgramResponse = digitalProgramResponseFromJson(jsonString);

// import 'dart:convert';

// DigitalProgramResponse digitalProgramResponseFromJson(String str) =>
//     DigitalProgramResponse.fromJson(json.decode(str));

// String digitalProgramResponseToJson(DigitalProgramResponse data) =>
//     json.encode(data.toJson());

// class DigitalProgramResponse {
//   DigitalProgramResponse({
//     this.baseUrl,
//     this.pdfUrl,
//     this.objectCount,
//     this.success,
//     this.msg,
//     this.list,
//   });

//   String baseUrl;
//   String pdfUrl;
//   int objectCount;
//   String success;
//   String msg;
//   List<ListClass> list;

//   factory DigitalProgramResponse.fromJson(Map<String, dynamic> json) =>
//       DigitalProgramResponse(
//         baseUrl: json["base_url"],
//         pdfUrl:json["pdf_url"],
//         objectCount: json["object_count"],
//         success: json["success"],
//         msg: json["msg"],
//         list: List<ListClass>.from(
//             json["list"].map((x) => x == null ? null : ListClass.fromJson(x))),
//       );

//   Map<String, dynamic> toJson() => {
//         "base_url": baseUrl,
//         "pdf_url":pdfUrl,
//         "object_count": objectCount,
//         "success": success,
//         "msg": msg,
//         "list":
//             List<dynamic>.from(list.map((x) => x == null ? null : x.toJson())),
//       };
// }

// class ListClass {
//   ListClass({
//     this.id,
//     this.categoryType,
//     this.title,
//     this.image,
//     this.altText,
//     this.document,
//     this.status,
//     this.createdAt,
//     this.updatedAt,
//   });

//   String id;
//   String categoryType;
//   String title;
//   String image;
//   String altText;
//   String document;
//   String status;
//   String createdAt;
//   String updatedAt;

//   factory ListClass.fromJson(Map<String, dynamic> json) => ListClass(
//         id: json["id"],
//         categoryType: json["category_type"],
//         title: json["title"],
//         image: json["image"],
//         altText: json["alt_text"],
//         document: json["document"],
//         status: json["status"],
//         createdAt: json["created_at"],
//         updatedAt: json["updated_at"],
//       );

//   Map<String, dynamic> toJson() => {
//         "id": id,
//         "category_type": categoryType,
//         "title": title,
//         "image": image,
//         "alt_text": altText,
//         "document": document,
//         "status": status,
//         "created_at": createdAt,
//         "updated_at": updatedAt,
//       };
// }
