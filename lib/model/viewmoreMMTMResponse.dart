// To parse this JSON data, do
//
//     final viewmoremmtmResponse = viewmoremmtmResponseFromJson(jsonString);

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

  String baseUrl;
  int objectCount;
  String success;
  String msg;
  Data data;

  factory ViewmoremmtmResponse.fromJson(Map<String, dynamic> json) =>
      ViewmoremmtmResponse(
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

  ListClass list;

  factory Data.fromJson(Map<String, dynamic> json) => Data(
        list: ListClass.fromJson(json["list"]),
      );

  Map<String, dynamic> toJson() => {
        "list": list.toJson(),
      };
}

class ListClass {
  ListClass({
    this.current,
    this.former,
  });

  List<Current> current;
  List<Current> former;

  factory ListClass.fromJson(Map<String, dynamic> json) => ListClass(
        current:
            List<Current>.from(json["current"].map((x) => Current.fromJson(x))),
        former:
            List<Current>.from(json["former"].map((x) => Current.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "current": List<dynamic>.from(current.map((x) => x.toJson())),
        "former": List<dynamic>.from(former.map((x) => x.toJson())),
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

  String id;
  String tenure;
  String photo;
  String photoCategoryId;
  String albumNameId;
  String photoDescription;
  String altTag;
  String year;
  String status;
  String createdBy;
  String createdAt;
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
//     this.photo,
//     this.photoCategoryId,
//     this.albumNameId,
//     this.photoDescription,
//     this.altTag,
//     this.year,
//     this.featuredImage,
//     this.status,
//     this.createdAt,
//     this.updatedAt,
//   });

//   String id;
//   String photo;
//   String photoCategoryId;
//   String albumNameId;
//   String photoDescription;
//   String altTag;
//   String year;
//   String featuredImage;
//   String status;
//   AtedAt createdAt;
//   AtedAt updatedAt;

//   factory ListElement.fromJson(Map<String, dynamic> json) => ListElement(
//         id: json["id"],
//         photo: json["photo"],
//         photoCategoryId: json["photo_category_id"],
//         albumNameId: json["album_name_id"],
//         photoDescription: json["photo_description"],
//         altTag: json["alt_tag"],
//         year: json["year"],
//         featuredImage: json["featured_image"],
//         status: json["status"],
//         createdAt: atedAtValues.map[json["created_at"]],
//         updatedAt: atedAtValues.map[json["updated_at"]],
//       );

//   Map<String, dynamic> toJson() => {
//         "id": id,
//         "photo": photo,
//         "photo_category_id": photoCategoryId,
//         "album_name_id": albumNameId,
//         "photo_description": photoDescription,
//         "alt_tag": altTag,
//         "year": year,
//         "featured_image": featuredImage,
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
//     this.photo,
//     this.photoCategoryId,
//     this.albumNameId,
//     this.photoDescription,
//     this.altTag,
//     this.year,
//     this.featuredImage,
//     this.status,
//     this.createdAt,
//     this.updatedAt,
//   });

//   String id;
//   String photo;
//   String photoCategoryId;
//   String albumNameId;
//   String photoDescription;
//   String altTag;
//   String year;
//   String featuredImage;
//   String status;
//   AtedAt createdAt;
//   AtedAt updatedAt;

//   factory ListElement.fromJson(Map<String, dynamic> json) => ListElement(
//         id: json["id"],
//         photo: json["photo"],
//         photoCategoryId: json["photo_category_id"],
//         albumNameId: json["album_name_id"],
//         photoDescription: json["photo_description"],
//         altTag: json["alt_tag"],
//         year: json["year"],
//         featuredImage: json["featured_image"],
//         status: json["status"],
//         createdAt: atedAtValues.map[json["created_at"]],
//         updatedAt: atedAtValues.map[json["updated_at"]],
//       );

//   Map<String, dynamic> toJson() => {
//         "id": id,
//         "photo": photo,
//         "photo_category_id": photoCategoryId,
//         "album_name_id": albumNameId,
//         "photo_description": photoDescription,
//         "alt_tag": altTag,
//         "year": year,
//         "featured_image": featuredImage,
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
