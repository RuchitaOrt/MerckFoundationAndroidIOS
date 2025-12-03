import 'dart:convert';

MmtMinmediaResponse mmtMinmediaResponseFromJson(String str) =>
    MmtMinmediaResponse.fromJson(json.decode(str));

String mmtMinmediaResponseToJson(MmtMinmediaResponse data) =>
    json.encode(data.toJson());

class MmtMinmediaResponse {
  MmtMinmediaResponse({
    this.baseUrl,
    this.success,
    this.msg,
    this.data,
  });

  String? baseUrl;
  String? success;
  String? msg;
  Data? data;

  factory MmtMinmediaResponse.fromJson(Map<String, dynamic> json) =>
      MmtMinmediaResponse(
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
  Data({
    this.list,
  });

  List<ListElement>? list;

  factory Data.fromJson(Map<String, dynamic> json) => Data(
        list: json["list"] == null
            ? []
            : List<ListElement>.from(
                json["list"].map((x) => ListElement.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "list": list == null
            ? []
            : List<dynamic>.from(list!.map((x) => x.toJson())),
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

  String? id;
  String? title;
  String? description;
  String? mediaUrl;
  String? image;
  String? altText;
  String? status;
  DateTime? createdAt;
  DateTime? updatedAt;

  factory ListElement.fromJson(Map<String, dynamic> json) => ListElement(
        id: json["id"],
        title: json["title"],
        description: json["description"],
        mediaUrl: json["media_url"],
        image: json["image"],
        altText: json["alt_text"],
        status: json["status"],
        createdAt: json["created_at"] == null
            ? null
            : DateTime.tryParse(json["created_at"]),
        updatedAt: json["updated_at"] == null
            ? null
            : DateTime.tryParse(json["updated_at"]),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "title": title,
        "description": description,
        "media_url": mediaUrl,
        "image": image,
        "alt_text": altText,
        "status": status,
        "created_at": createdAt?.toIso8601String(),
        "updated_at": updatedAt?.toIso8601String(),
      };
}
// // To parse this JSON data, do
// //
// //     final mmtMinmediaResponse = mmtMinmediaResponseFromJson(jsonString);

// import 'dart:convert';

// MmtMinmediaResponse mmtMinmediaResponseFromJson(String str) =>
//     MmtMinmediaResponse.fromJson(json.decode(str));

// String mmtMinmediaResponseToJson(MmtMinmediaResponse data) =>
//     json.encode(data.toJson());

// class MmtMinmediaResponse {
//   MmtMinmediaResponse({
//     this.baseUrl,
//     this.success,
//     this.msg,
//     this.data,
//   });

//   String baseUrl;
//   String success;
//   String msg;
//   Data data;

//   factory MmtMinmediaResponse.fromJson(Map<String, dynamic> json) =>
//       MmtMinmediaResponse(
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
//     this.description,
//     this.mediaUrl,
//     this.image,
//     this.altText,
//     this.status,
//     this.createdAt,
//     this.updatedAt,
//   });

//   String id;
//   String title;
//   String description;
//   String mediaUrl;
//   String image;
//   String altText;
//   String status;
//   DateTime createdAt;
//   DateTime updatedAt;

//   factory ListElement.fromJson(Map<String, dynamic> json) => ListElement(
//         id: json["id"],
//         title: json["title"],
//         description: json["description"],
//         mediaUrl: json["media_url"],
//         image: json["image"],
//         altText: json["alt_text"],
//         status: json["status"],
//         createdAt: DateTime.parse(json["created_at"]),
//         updatedAt: DateTime.parse(json["updated_at"]),
//       );

//   Map<String, dynamic> toJson() => {
//         "id": id,
//         "title": title,
//         "description": description,
//         "media_url": mediaUrl,
//         "image": image,
//         "alt_text": altText,
//         "status": status,
//         "created_at": createdAt.toIso8601String(),
//         "updated_at": updatedAt.toIso8601String(),
//       };
// }
