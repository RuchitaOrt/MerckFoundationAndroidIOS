import 'dart:convert';

VideoProgramResponse videoProgramResponseFromJson(String str) =>
    VideoProgramResponse.fromJson(json.decode(str));

String videoProgramResponseToJson(VideoProgramResponse data) =>
    json.encode(data.toJson());

class VideoProgramResponse {
  VideoProgramResponse({
    this.success,
    this.objectCount,
    this.msg,
    this.list,
  });

  String? success;
  int? objectCount;
  String? msg;
  List<ListElement>? list;

  factory VideoProgramResponse.fromJson(Map<String, dynamic> json) =>
      VideoProgramResponse(
        success: json["success"],
        objectCount: json["object_count"],
        msg: json["msg"],
        list: json["list"] != null
            ? List<ListElement>.from(
                json["list"].map((x) => ListElement.fromJson(x)))
            : [],
      );

  Map<String, dynamic> toJson() => {
        "success": success,
        "object_count": objectCount,
        "msg": msg,
        "list": list != null
            ? List<dynamic>.from(list!.map((x) => x.toJson()))
            : [],
      };
}

class ListElement {
  ListElement({
    this.id,
    this.videoLink,
    this.videoDesc,
    this.countryId,
    this.categoryId,
    this.year,
    this.status,
    this.createdAt,
    this.updatedAt,
  });

  String? id;
  String? videoLink;
  String? videoDesc;
  String? countryId;
  String? categoryId;
  String? year;
  String? status;
  String? createdAt;
  String? updatedAt;

  factory ListElement.fromJson(Map<String, dynamic> json) => ListElement(
        id: json["id"],
        videoLink: json["video_link"],
        videoDesc: json["video_desc"],
        countryId: json["country_id"],
        categoryId: json["category_id"],
        year: json["year"],
        status: json["status"],
        createdAt: json["created_at"],
        updatedAt: json["updated_at"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "video_link": videoLink,
        "video_desc": videoDesc,
        "country_id": countryId,
        "category_id": categoryId,
        "year": year,
        "status": status,
        "created_at": createdAt,
        "updated_at": updatedAt,
      };
}

// // To parse this JSON data, do
// //
// //     final videoProgramResponse = videoProgramResponseFromJson(jsonString);

// import 'dart:convert';

// VideoProgramResponse videoProgramResponseFromJson(String str) =>
//     VideoProgramResponse.fromJson(json.decode(str));

// String videoProgramResponseToJson(VideoProgramResponse data) =>
//     json.encode(data.toJson());

// class VideoProgramResponse {
//   VideoProgramResponse({
//     this.success,
//     this.objectCount,
//     this.msg,
//     this.list,
//   });

//   String success;
//   int objectCount;
//   String msg;
//   List<ListElement> list;

//   factory VideoProgramResponse.fromJson(Map<String, dynamic> json) =>
//       VideoProgramResponse(
//         success: json["success"],
//         objectCount: json["object_count"],
//         msg: json["msg"],
//         list: List<ListElement>.from(
//             json["list"].map((x) => ListElement.fromJson(x))),
//       );

//   Map<String, dynamic> toJson() => {
//         "success": success,
//         "object_count": objectCount,
//         "msg": msg,
//         "list": List<dynamic>.from(list.map((x) => x.toJson())),
//       };
// }

// class ListElement {
//   ListElement({
//     this.id,
//     this.videoLink,
//     this.videoDesc,
//     this.countryId,
//     this.categoryId,
//     this.year,
//     this.status,
//     this.createdAt,
//     this.updatedAt,
//   });

//   String id;
//   String videoLink;
//   String videoDesc;
//   String countryId;
//   String categoryId;
//   String year;
//   String status;
//   String createdAt;
//   String updatedAt;

//   factory ListElement.fromJson(Map<String, dynamic> json) => ListElement(
//         id: json["id"],
//         videoLink: json["video_link"],
//         videoDesc: json["video_desc"],
//         countryId: json["country_id"],
//         categoryId: json["category_id"],
//         year: json["year"],
//         status: json["status"],
//         createdAt: json["created_at"],
//         updatedAt: json["updated_at"],
//       );

//   Map<String, dynamic> toJson() => {
//         "id": id,
//         "video_link": videoLink,
//         "video_desc": videoDesc,
//         "country_id": countryId,
//         "category_id": categoryId,
//         "year": year,
//         "status": status,
//         "created_at": createdAt,
//         "updated_at": updatedAt,
//       };
// }
