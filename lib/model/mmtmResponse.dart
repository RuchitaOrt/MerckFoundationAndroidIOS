import 'dart:convert';

GetMmtmResponse getMmtmResponseFromJson(String str) =>
    GetMmtmResponse.fromJson(json.decode(str));

String getMmtmResponseToJson(GetMmtmResponse data) =>
    json.encode(data.toJson());

class GetMmtmResponse {
  GetMmtmResponse({
    this.success,
    this.msg,
    this.data,
  });

  String? success;
  String? msg;
  List<Datum>? data;

  factory GetMmtmResponse.fromJson(Map<String, dynamic> json) => GetMmtmResponse(
        success: json["success"],
        msg: json["msg"],
        data: json["data"] == null
            ? null
            : List<Datum>.from(json["data"].map((x) => Datum.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "success": success,
        "msg": msg,
        "data": data == null ? null : List<dynamic>.from(data!.map((x) => x.toJson())),
      };
}

class Datum {
  Datum({
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
  AtedAt? createdAt;
  AtedAt? updatedAt;

  factory Datum.fromJson(Map<String, dynamic> json) => Datum(
        id: json["id"],
        videoLink: json["video_link"] ?? "",
        videoDesc: json["video_desc"] ?? "",
        countryId: json["country_id"],
        categoryId: json["category_id"],
        year: json["year"],
        status: json["status"],
        createdAt: json["created_at"] == null ? null : atedAtValues.map[json["created_at"]],
        updatedAt: json["updated_at"] == null ? null : atedAtValues.map[json["updated_at"]],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "video_link": videoLink,
        "video_desc": videoDesc,
        "country_id": countryId,
        "category_id": categoryId,
        "year": year,
        "status": status,
        "created_at": createdAt == null ? null : atedAtValues.reverse[createdAt],
        "updated_at": updatedAt == null ? null : atedAtValues.reverse[updatedAt],
      };
}

enum AtedAt { THE_00000000000000 }

final atedAtValues =
    EnumValues({"0000-00-00 00:00:00": AtedAt.THE_00000000000000});

class EnumValues<T> {
  Map<String, T> map;
  Map<T, String>? reverseMap;

  EnumValues(this.map);

  Map<T, String> get reverse {
    reverseMap ??= map.map((k, v) => MapEntry(v, k));
    return reverseMap!;
  }
}

// // To parse this JSON data, do
// //
// //     final getMmtmResponse = getMmtmResponseFromJson(jsonString);

// import 'dart:convert';

// GetMmtmResponse getMmtmResponseFromJson(String str) =>
//     GetMmtmResponse.fromJson(json.decode(str));

// String getMmtmResponseToJson(GetMmtmResponse data) =>
//     json.encode(data.toJson());

// class GetMmtmResponse {
//   GetMmtmResponse({
//     this.success,
//     this.msg,
//     this.data,
//   });

//   String success;
//   String msg;
//   List<Datum> data;

//   factory GetMmtmResponse.fromJson(Map<String, dynamic> json) =>
//       GetMmtmResponse(
//         success: json["success"],
//         msg: json["msg"],
//         data: List<Datum>.from(json["data"].map((x) => Datum.fromJson(x))),
//       );

//   Map<String, dynamic> toJson() => {
//         "success": success,
//         "msg": msg,
//         "data": List<dynamic>.from(data.map((x) => x.toJson())),
//       };
// }

// class Datum {
//   Datum({
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
//   AtedAt createdAt;
//   AtedAt updatedAt;

//   factory Datum.fromJson(Map<String, dynamic> json) => Datum(
//         id: json["id"],
//         videoLink: json["video_link"] == null ? "" : json["video_link"],
//         videoDesc: json["video_desc"] == null ? "" : json["video_desc"],
//         countryId: json["country_id"],
//         categoryId: json["category_id"],
//         year: json["year"],
//         status: json["status"],
//         createdAt: atedAtValues.map[json["created_at"]],
//         updatedAt: atedAtValues.map[json["updated_at"]],
//       );

//   Map<String, dynamic> toJson() => {
//         "id": id,
//         "video_link": videoLink,
//         "video_desc": videoDesc,
//         "country_id": countryId,
//         "category_id": categoryId,
//         "year": year,
//         "status": status,
//         "created_at": atedAtValues.reverse[createdAt],
//         "updated_at": atedAtValues.reverse[updatedAt],
//       };
// }

// enum AtedAt { THE_00000000000000 }

// final atedAtValues =
//     EnumValues({"0000-00-00 00:00:00": AtedAt.THE_00000000000000});

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
