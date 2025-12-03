import 'dart:convert';

OurGalleryDetailsResponse ourGalleryDetailsResponseFromJson(String str) =>
    OurGalleryDetailsResponse.fromJson(json.decode(str));

String ourGalleryDetailsResponseToJson(OurGalleryDetailsResponse data) =>
    json.encode(data.toJson());

class OurGalleryDetailsResponse {
  String? baseUrl;
  String? success;
  String? msg;
  Map<String, List<ListElement>>? list;

  OurGalleryDetailsResponse({
    this.baseUrl,
    this.success,
    this.msg,
    this.list,
  });

  factory OurGalleryDetailsResponse.fromJson(Map<String, dynamic> json) =>
      OurGalleryDetailsResponse(
        baseUrl: json["base_url"],
        success: json["success"],
        msg: json["msg"],
        list: json["list"] == null
            ? null
            : Map.from(json["list"]).map((k, v) => MapEntry<String,
                    List<ListElement>>(k,
                List<ListElement>.from(v.map((x) => ListElement.fromJson(x))))),
      );

  Map<String, dynamic> toJson() => {
        "base_url": baseUrl,
        "success": success,
        "msg": msg,
        "list": list == null
            ? null
            : Map.from(list!).map((k, v) =>
                MapEntry<String, dynamic>(k, List<dynamic>.from(v.map((x) => x.toJson())))),
      };
}

class ListElement {
  String? id;
  String? categoryId;
  String? albumName;
  String? url;
  String? position;
  String? status;
  DateTime? createdAt;
  dynamic updatedAt;
  String? photoId;
  String? photo;
  String? photoCategoryId;
  String? albumNameId;
  String? photoDescription;
  String? year;
  String? altTag;

  ListElement({
    this.id,
    this.categoryId,
    this.albumName,
    this.url,
    this.position,
    this.status,
    this.createdAt,
    this.updatedAt,
    this.photoId,
    this.photo,
    this.photoCategoryId,
    this.albumNameId,
    this.photoDescription,
    this.year,
    this.altTag,
  });

  factory ListElement.fromJson(Map<String, dynamic> json) => ListElement(
        id: json["id"],
        categoryId: json["category_id"],
        albumName: json["album_name"],
        url: json["url"],
        position: json["position"],
        status: json["status"],
        createdAt: json["created_at"] == null || json["created_at"] == "0000-00-00 00:00:00"
            ? null
            : DateTime.tryParse(json["created_at"]),
        updatedAt: json["updated_at"],
        photoId: json["photo_id"],
        photo: json["photo"],
        photoCategoryId: json["photo_category_id"],
        albumNameId: json["album_name_id"],
        photoDescription: json["photo_description"],
        year: json["year"],
        altTag: json["alt_tag"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "category_id": categoryId,
        "album_name": albumName,
        "url": url,
        "position": position,
        "status": status,
        "created_at": createdAt?.toIso8601String(),
        "updated_at": updatedAt,
        "photo_id": photoId,
        "photo": photo,
        "photo_category_id": photoCategoryId,
        "album_name_id": albumNameId,
        "photo_description": photoDescription,
        "year": year,
        "alt_tag": altTag,
      };
}

// // To parse this JSON data, do
// //
// //     final ourGalleryDetailsResponse = ourGalleryDetailsResponseFromJson(jsonString);

// import 'dart:convert';

// OurGalleryDetailsResponse ourGalleryDetailsResponseFromJson(String str) =>
//     OurGalleryDetailsResponse.fromJson(json.decode(str));

// String ourGalleryDetailsResponseToJson(OurGalleryDetailsResponse data) =>
//     json.encode(data.toJson());

// class OurGalleryDetailsResponse {
//   OurGalleryDetailsResponse({
//     this.baseUrl,
//     this.success,
//     this.msg,
//     this.list,
//   });

//   String baseUrl;
//   String success;
//   String msg;
//   Map<String, List<ListElement>> list;

//   factory OurGalleryDetailsResponse.fromJson(Map<String, dynamic> json) =>
//       OurGalleryDetailsResponse(
//         baseUrl: json["base_url"] == null ? null : json["base_url"],
//         success: json["success"] == null ? null : json["success"],
//         msg: json["msg"] == null ? null : json["msg"],
//         list: json["list"] == null
//             ? null
//             : Map.from(json["list"]).map((k, v) => MapEntry<String,
//                     List<ListElement>>(k,
//                 List<ListElement>.from(v.map((x) => ListElement.fromJson(x))))),
//       );

//   Map<String, dynamic> toJson() => {
//         "base_url": baseUrl == null ? null : baseUrl,
//         "success": success == null ? null : success,
//         "msg": msg == null ? null : msg,
//         "list": list == null
//             ? null
//             : Map.from(list).map((k, v) => MapEntry<String, dynamic>(
//                 k, List<dynamic>.from(v.map((x) => x.toJson())))),
//       };
// }

// class ListElement {
//   ListElement({
//     this.id,
//     this.categoryId,
//     this.albumName,
//     this.url,
//     this.position,
//     this.status,
//     this.createdAt,
//     this.updatedAt,
//     this.photoId,
//     this.photo,
//     this.photoCategoryId,
//     this.albumNameId,
//     this.photoDescription,
//     this.year,
//     this.altTag,
//   });

//   String id;
//   String categoryId;
//   String albumName;
//   String url;
//   String position;
//   String status;
//   AtedAt createdAt;
//   dynamic updatedAt;
//   String photoId;
//   String photo;
//   String photoCategoryId;
//   String albumNameId;
//   String photoDescription;
//   String year;
//   String altTag;

//   factory ListElement.fromJson(Map<String, dynamic> json) => ListElement(
//         id: json["id"] == null ? null : json["id"],
//         categoryId: json["category_id"] == null ? null : json["category_id"],
//         albumName: json["album_name"] == null ? null : json["album_name"],
//         url: json["url"] == null ? null : json["url"],
//         position: json["position"] == null ? null : json["position"],
//         status: json["status"] == null ? null : json["status"],
//         createdAt: json["created_at"] == null
//             ? null
//             : atedAtValues.map[json["created_at"]],
//         updatedAt: json["updated_at"],
//         photoId: json["photo_id"] == null ? null : json["photo_id"],
//         photo: json["photo"] == null ? null : json["photo"],
//         photoCategoryId: json["photo_category_id"] == null
//             ? null
//             : json["photo_category_id"],
//         albumNameId:
//             json["album_name_id"] == null ? null : json["album_name_id"],
//         photoDescription: json["photo_description"] == null
//             ? null
//             : json["photo_description"],
//         year: json["year"] == null ? null : json["year"],
//         altTag: json["alt_tag"] == null ? null : json["alt_tag"],
//       );

//   Map<String, dynamic> toJson() => {
//         "id": id == null ? null : id,
//         "category_id": categoryId == null ? null : categoryId,
//         "album_name": albumName == null ? null : albumName,
//         "url": url == null ? null : url,
//         "position": position == null ? null : position,
//         "status": status == null ? null : status,
//         "created_at":
//             createdAt == null ? null : atedAtValues.reverse[createdAt],
//         "updated_at": updatedAt,
//         "photo_id": photoId == null ? null : photoId,
//         "photo": photo == null ? null : photo,
//         "photo_category_id": photoCategoryId == null ? null : photoCategoryId,
//         "album_name_id": albumNameId == null ? null : albumNameId,
//         "photo_description": photoDescription == null ? null : photoDescription,
//         "year": year == null ? null : year,
//         "alt_tag": altTag == null ? null : altTag,
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
