import 'dart:convert';

GetFertilityVideosResp getFertilityVideosRespFromJson(String str) =>
    GetFertilityVideosResp.fromJson(json.decode(str));

String getFertilityVideosRespToJson(GetFertilityVideosResp data) =>
    json.encode(data.toJson());

class GetFertilityVideosResp {
  String? success;
  String? msg;
  Data? data;

  GetFertilityVideosResp({
    this.success,
    this.msg,
    this.data,
  });

  factory GetFertilityVideosResp.fromJson(Map<String, dynamic> json) =>
      GetFertilityVideosResp(
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

  Data({this.list});

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
  String? videoLink;
  String? videoDesc;
  String? countryId;
  String? categoryId;
  String? year;
  String? status;
  String? createdAt;
  String? updatedAt;

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
// //     final getFertilityVideosResp = getFertilityVideosRespFromJson(jsonString);

// import 'dart:convert';

// GetFertilityVideosResp getFertilityVideosRespFromJson(String str) => GetFertilityVideosResp.fromJson(json.decode(str));

// String getFertilityVideosRespToJson(GetFertilityVideosResp data) => json.encode(data.toJson());

// class GetFertilityVideosResp {
//     GetFertilityVideosResp({
//         this.success,
//         this.msg,
//         this.data,
//     });

//     String success;
//     String msg;
//     Data data;

//     factory GetFertilityVideosResp.fromJson(Map<String, dynamic> json) => GetFertilityVideosResp(
//         success: json["success"],
//         msg: json["msg"],
//         data: Data.fromJson(json["data"]),
//     );

//     Map<String, dynamic> toJson() => {
//         "success": success,
//         "msg": msg,
//         "data": data.toJson(),
//     };
// }

// class Data {
//     Data({
//         this.list,
//     });

//     List<ListElement> list;

//     factory Data.fromJson(Map<String, dynamic> json) => Data(
//         list: List<ListElement>.from(json["list"].map((x) => ListElement.fromJson(x))),
//     );

//     Map<String, dynamic> toJson() => {
//         "list": List<dynamic>.from(list.map((x) => x.toJson())),
//     };
// }

// class ListElement {
//     ListElement({
//         this.id,
//         this.videoLink,
//         this.videoDesc,
//         this.countryId,
//         this.categoryId,
//         this.year,
//         this.status,
//         this.createdAt,
//         this.updatedAt,
//     });

//     String id;
//     String videoLink;
//     String videoDesc;
//     String countryId;
//     String categoryId;
//     String year;
//     String status;
//     String createdAt;
//     String updatedAt;

//     factory ListElement.fromJson(Map<String, dynamic> json) => ListElement(
//         id: json["id"],
//         videoLink: json["video_link"],
//         videoDesc: json["video_desc"],
//         countryId: json["country_id"],
//         categoryId: json["category_id"],
//         year: json["year"],
//         status: json["status"],
//         createdAt: json["created_at"],
//         updatedAt: json["updated_at"],
//     );

//     Map<String, dynamic> toJson() => {
//         "id": id,
//         "video_link": videoLink,
//         "video_desc": videoDesc,
//         "country_id": countryId,
//         "category_id": categoryId,
//         "year": year,
//         "status": status,
//         "created_at": createdAt,
//         "updated_at": updatedAt,
//     };
// }
