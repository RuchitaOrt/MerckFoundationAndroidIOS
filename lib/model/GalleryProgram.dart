import 'dart:convert';

GalleryProgramResponse galleryProgramResponseFromJson(String str) =>
    GalleryProgramResponse.fromJson(json.decode(str));

String galleryProgramResponseToJson(GalleryProgramResponse data) =>
    json.encode(data.toJson());

class GalleryProgramResponse {
  GalleryProgramResponse({
    this.baseUrl,
    this.success,
    this.msg,
    this.list,
  });

  String? baseUrl;
  String? success;
  String? msg;
  List<ListElement>? list;

  factory GalleryProgramResponse.fromJson(Map<String, dynamic> json) =>
      GalleryProgramResponse(
        baseUrl: json["base_url"],
        success: json["success"],
        msg: json["msg"],
        list: json["list"] == null
            ? null
            : List<ListElement>.from(
                json["list"].map((x) => ListElement.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "base_url": baseUrl,
        "success": success,
        "msg": msg,
        "list": list?.map((x) => x.toJson()).toList(),
      };
}

class ListElement {
  ListElement({
    this.id,
    this.photo,
    this.photoCategoryId,
    this.albumNameId,
    this.photoDescription,
    this.altTag,
    this.year,
    this.featuredImage,
    this.position,
    this.status,
    this.createdAt,
    this.updatedAt,
  });

  String? id;
  String? photo;
  String? photoCategoryId;
  String? albumNameId;
  String? photoDescription;
  String? altTag;
  String? year;
  String? featuredImage;
  String? position;
  String? status;
  String? createdAt;
  String? updatedAt;

  factory ListElement.fromJson(Map<String, dynamic> json) => ListElement(
        id: json["id"],
        photo: json["photo"],
        photoCategoryId: json["photo_category_id"],
        albumNameId: json["album_name_id"],
        photoDescription: json["photo_description"],
        altTag: json["alt_tag"],
        year: json["year"],
        featuredImage: json["featured_image"],
        position: json["position"],
        status: json["status"],
        createdAt: json["created_at"],
        updatedAt: json["updated_at"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "photo": photo,
        "photo_category_id": photoCategoryId,
        "album_name_id": albumNameId,
        "photo_description": photoDescription,
        "alt_tag": altTag,
        "year": year,
        "featured_image": featuredImage,
        "position": position,
        "status": status,
        "created_at": createdAt,
        "updated_at": updatedAt,
      };
}

// // To parse this JSON data, do
// //
// //     final galleryProgramResponse = galleryProgramResponseFromJson(jsonString);

// import 'dart:convert';

// GalleryProgramResponse galleryProgramResponseFromJson(String str) =>
//     GalleryProgramResponse.fromJson(json.decode(str));

// String galleryProgramResponseToJson(GalleryProgramResponse data) =>
//     json.encode(data.toJson());

// class GalleryProgramResponse {
//   GalleryProgramResponse({
//     this.baseUrl,
//     this.success,
//     this.msg,
//     this.list,
//   });

//   String baseUrl;
//   String success;
//   String msg;
//   List<ListElement> list;

//   factory GalleryProgramResponse.fromJson(Map<String, dynamic> json) =>
//       GalleryProgramResponse(
//         baseUrl: json["base_url"],
//         success: json["success"],
//         msg: json["msg"],
//         list: List<ListElement>.from(
//             json["list"].map((x) => ListElement.fromJson(x))),
//       );

//   Map<String, dynamic> toJson() => {
//         "base_url": baseUrl,
//         "success": success,
//         "msg": msg,
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
//     this.position,
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
//   String position;
//   String status;
//   AtedAt createdAt;
//   dynamic updatedAt;

//   factory ListElement.fromJson(Map<String, dynamic> json) => ListElement(
//         id: json["id"],
//         photo: json["photo"],
//         photoCategoryId: json["photo_category_id"],
//         albumNameId: json["album_name_id"],
//         photoDescription: json["photo_description"],
//         altTag: json["alt_tag"],
//         year: json["year"],
//         featuredImage: json["featured_image"],
//         position: json["position"],
//         status: json["status"],
//         createdAt: atedAtValues.map[json["created_at"]],
//         updatedAt: json["updated_at"],
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
//         "position": position,
//         "status": status,
//         "created_at": atedAtValues.reverse[createdAt],
//         "updated_at": updatedAt,
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
