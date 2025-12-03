import 'dart:convert';

OurawardResponse ourawardResponseFromJson(String str) =>
    OurawardResponse.fromJson(json.decode(str));

String ourawardResponseToJson(OurawardResponse data) =>
    json.encode(data.toJson());

class OurawardResponse {
  String? baseUrl;
  String? success;
  String? msg;
  Data? data;

  OurawardResponse({this.baseUrl, this.success, this.msg, this.data});

  factory OurawardResponse.fromJson(Map<String, dynamic> json) => OurawardResponse(
        baseUrl: json["base_url"],
        success: json["success"],
        msg: json["msg"],
        data: json["data"] == null ? null : Data.fromJson(json["data"]),
      );

  Map<String, dynamic> toJson() => {
        "base_url": baseUrl,
        "success": success,
        "msg": msg,
        "data": data?.toJson(),
      };
}

class Data {
  List<ListElement>? list;

  Data({this.list});

  factory Data.fromJson(Map<String, dynamic> json) => Data(
        list: json["list"] == null
            ? null
            : List<ListElement>.from(json["list"].map((x) => ListElement.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "list": list == null ? null : List<dynamic>.from(list!.map((x) => x.toJson())),
      };
}

class ListElement {
  String? id;
  String? title;
  String? pageUrl;
  String? image;
  String? altText;
  String? status;
  DateTime? createdAt;
  DateTime? updatedAt;

  ListElement({
    this.id,
    this.title,
    this.pageUrl,
    this.image,
    this.altText,
    this.status,
    this.createdAt,
    this.updatedAt,
  });

  factory ListElement.fromJson(Map<String, dynamic> json) => ListElement(
        id: json["id"],
        title: json["title"],
        pageUrl: json["page_url"],
        image: json["image"],
        altText: json["alt_text"],
        status: json["status"],
        createdAt: json["created_at"] == null ? null : DateTime.parse(json["created_at"]),
        updatedAt: json["updated_at"] == null ? null : DateTime.parse(json["updated_at"]),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "title": title,
        "page_url": pageUrl,
        "image": image,
        "alt_text": altText,
        "status": status,
        "created_at": createdAt?.toIso8601String(),
        "updated_at": updatedAt?.toIso8601String(),
      };
}

// // To parse this JSON data, do
// //
// //     final ourawardResponse = ourawardResponseFromJson(jsonString);

// import 'dart:convert';

// OurawardResponse ourawardResponseFromJson(String str) =>
//     OurawardResponse.fromJson(json.decode(str));

// String ourawardResponseToJson(OurawardResponse data) =>
//     json.encode(data.toJson());

// class OurawardResponse {
//   OurawardResponse({
//     this.baseUrl,
//     this.success,
//     this.msg,
//     this.data,
//   });

//   String baseUrl;
//   String success;
//   String msg;
//   Data data;

//   factory OurawardResponse.fromJson(Map<String, dynamic> json) =>
//       OurawardResponse(
//         baseUrl: json["base_url"],
//         success: json["success"],
//         msg: json["msg"],
//         data: Data.fromJson(json["data"]),
//       );

//   Map<String, dynamic> toJson() => {
//         "base_url": baseUrl,
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
//     this.title,
//     this.pageUrl,
//     this.image,
//     this.altText,
//     this.status,
//     this.createdAt,
//     this.updatedAt,
//   });

//   String id;
//   String title;
//   String pageUrl;
//   String image;
//   String altText;
//   String status;
//   DateTime createdAt;
//   DateTime updatedAt;

//   factory ListElement.fromJson(Map<String, dynamic> json) => ListElement(
//         id: json["id"],
//         title: json["title"],
//         pageUrl: json["page_url"],
//         image: json["image"],
//         altText: json["alt_text"],
//         status: json["status"],
//         createdAt: DateTime.parse(json["created_at"]),
//         updatedAt: DateTime.parse(json["updated_at"]),
//       );

//   Map<String, dynamic> toJson() => {
//         "id": id,
//         "title": title,
//         "page_url": pageUrl,
//         "image": image,
//         "alt_text": altText,
//         "status": status,
//         "created_at": createdAt.toIso8601String(),
//         "updated_at": updatedAt.toIso8601String(),
//       };
// }
