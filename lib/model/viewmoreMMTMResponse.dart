import 'dart:convert';

ViewmoremmtmResponse viewmoremmtmResponseFromJson(String str) =>
    ViewmoremmtmResponse.fromJson(json.decode(str));

String viewmoremmtmResponseToJson(ViewmoremmtmResponse data) =>
    json.encode(data.toJson());

class ViewmoremmtmResponse {
  ViewmoremmtmResponse({
    this.baseUrl,
    this.objectCount,
    this.success,
    this.msg,
    this.data,
  });

  String? baseUrl;
  int? objectCount;
  String? success;
  String? msg;
  Data? data;

  factory ViewmoremmtmResponse.fromJson(Map<String, dynamic> json) =>
      ViewmoremmtmResponse(
        baseUrl: json["base_url"],
        objectCount: json["object_count"],
        success: json["success"],
        msg: json["msg"],
        data: json["data"] != null ? Data.fromJson(json["data"]) : null,
      );

  Map<String, dynamic> toJson() => {
        "base_url": baseUrl,
        "object_count": objectCount,
        "success": success,
        "msg": msg,
        "data": data?.toJson(),
      };
}

class Data {
  Data({
    this.list,
  });

  ListClass? list;

  factory Data.fromJson(Map<String, dynamic> json) => Data(
        list: json["list"] != null ? ListClass.fromJson(json["list"]) : null,
      );

  Map<String, dynamic> toJson() => {
        "list": list?.toJson(),
      };
}

class ListClass {
  ListClass({
    this.current,
    this.former,
  });

  List<Current>? current;
  List<Current>? former;

  factory ListClass.fromJson(Map<String, dynamic> json) => ListClass(
        current: json["current"] != null
            ? List<Current>.from(
                json["current"].map((x) => Current.fromJson(x)))
            : [],
        former: json["former"] != null
            ? List<Current>.from(
                json["former"].map((x) => Current.fromJson(x)))
            : [],
      );

  Map<String, dynamic> toJson() => {
        "current": current != null
            ? List<dynamic>.from(current!.map((x) => x.toJson()))
            : [],
        "former": former != null
            ? List<dynamic>.from(former!.map((x) => x.toJson()))
            : [],
      };
}

class Current {
  Current({
    this.id,
    this.tenure,
    this.photo,
    this.photoCategoryId,
    this.albumNameId,
    this.photoDescription,
    this.altTag,
    this.year,
    this.status,
    this.createdBy,
    this.createdAt,
    this.updatedAt,
  });

  String? id;
  String? tenure;
  String? photo;
  String? photoCategoryId;
  String? albumNameId;
  String? photoDescription;
  String? altTag;
  String? year;
  String? status;
  String? createdBy;
  String? createdAt;
  dynamic updatedAt;

  factory Current.fromJson(Map<String, dynamic> json) => Current(
        id: json["id"],
        tenure: json["tenure"],
        photo: json["photo"],
        photoCategoryId: json["photo_category_id"],
        albumNameId: json["album_name_id"],
        photoDescription: json["photo_description"],
        altTag: json["alt_tag"],
        year: json["year"],
        status: json["status"],
        createdBy: json["created_by"],
        createdAt: json["created_at"],
        updatedAt: json["updated_at"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "tenure": tenure,
        "photo": photo,
        "photo_category_id": photoCategoryId,
        "album_name_id": albumNameId,
        "photo_description": photoDescription,
        "alt_tag": altTag,
        "year": year,
        "status": status,
        "created_by": createdBy,
        "created_at": createdAt,
        "updated_at": updatedAt,
      };
}

// // To parse this JSON data, do
// //
// //     final viewmoremmtmResponse = viewmoremmtmResponseFromJson(jsonString);

// import 'dart:convert';

// ViewmoremmtmResponse viewmoremmtmResponseFromJson(String str) =>
//     ViewmoremmtmResponse.fromJson(json.decode(str));

// String viewmoremmtmResponseToJson(ViewmoremmtmResponse data) =>
//     json.encode(data.toJson());

// class ViewmoremmtmResponse {
//   ViewmoremmtmResponse({
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

//   factory ViewmoremmtmResponse.fromJson(Map<String, dynamic> json) =>
//       ViewmoremmtmResponse(
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

//   ListClass list;

//   factory Data.fromJson(Map<String, dynamic> json) => Data(
//         list: ListClass.fromJson(json["list"]),
//       );

//   Map<String, dynamic> toJson() => {
//         "list": list.toJson(),
//       };
// }

// class ListClass {
//   ListClass({
//     this.current,
//     this.former,
//   });

//   List<Current> current;
//   List<Current> former;

//   factory ListClass.fromJson(Map<String, dynamic> json) => ListClass(
//         current:
//             List<Current>.from(json["current"].map((x) => Current.fromJson(x))),
//         former:
//             List<Current>.from(json["former"].map((x) => Current.fromJson(x))),
//       );

//   Map<String, dynamic> toJson() => {
//         "current": List<dynamic>.from(current.map((x) => x.toJson())),
//         "former": List<dynamic>.from(former.map((x) => x.toJson())),
//       };
// }

// class Current {
//   Current({
//     this.id,
//     this.tenure,
//     this.photo,
//     this.photoCategoryId,
//     this.albumNameId,
//     this.photoDescription,
//     this.altTag,
//     this.year,
//     this.status,
//     this.createdBy,
//     this.createdAt,
//     this.updatedAt,
//   });

//   String id;
//   String tenure;
//   String photo;
//   String photoCategoryId;
//   String albumNameId;
//   String photoDescription;
//   String altTag;
//   String year;
//   String status;
//   String createdBy;
//   String createdAt;
//   dynamic updatedAt;

//   factory Current.fromJson(Map<String, dynamic> json) => Current(
//         id: json["id"],
//         tenure: json["tenure"],
//         photo: json["photo"],
//         photoCategoryId: json["photo_category_id"],
//         albumNameId: json["album_name_id"],
//         photoDescription: json["photo_description"],
//         altTag: json["alt_tag"],
//         year: json["year"],
//         status: json["status"],
//         createdBy: json["created_by"],
//         createdAt: json["created_at"],
//         updatedAt: json["updated_at"],
//       );

//   Map<String, dynamic> toJson() => {
//         "id": id,
//         "tenure": tenure,
//         "photo": photo,
//         "photo_category_id": photoCategoryId,
//         "album_name_id": albumNameId,
//         "photo_description": photoDescription,
//         "alt_tag": altTag,
//         "year": year,
//         "status": status,
//         "created_by": createdBy,
//         "created_at": createdAt,
//         "updated_at": updatedAt,
//       };
// }

