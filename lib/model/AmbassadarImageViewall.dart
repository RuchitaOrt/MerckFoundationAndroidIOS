import 'dart:convert';

AmbassdarImageResponse ambassdarImageResponseFromJson(String str) =>
    AmbassdarImageResponse.fromJson(json.decode(str));

String ambassdarImageResponseToJson(AmbassdarImageResponse data) =>
    json.encode(data.toJson());

class AmbassdarImageResponse {
  AmbassdarImageResponse({
    required this.baseUrl,
    required this.success,
    required this.msg,
    required this.list,
  });

  final String baseUrl;
  final bool success;
  final String msg;
  final List<ListElement> list;

  factory AmbassdarImageResponse.fromJson(Map<String, dynamic> json) =>
      AmbassdarImageResponse(
        baseUrl: json["base_url"] ?? '',
        success: json["success"] ?? false,
        msg: json["msg"] ?? '',
        list: (json["list"] as List<dynamic>?)
                ?.map((x) => ListElement.fromJson(x))
                .toList() ??
            [],
      );

  Map<String, dynamic> toJson() => {
        "base_url": baseUrl,
        "success": success,
        "msg": msg,
        "list": List<dynamic>.from(list.map((x) => x.toJson())),
      };
}

class ListElement {
  ListElement({
    required this.id,
    required this.photo,
    required this.photoCategoryId,
    required this.albumNameId,
    required this.photoDescription,
    required this.altTag,
    required this.year,
    required this.featuredImage,
    required this.position,
    required this.status,
    this.createdAt,
    this.updatedAt,
  });

  final String id;
  final String photo;
  final String photoCategoryId;
  final String albumNameId;
  final String photoDescription;
  final String altTag;
  final String year;
  final String featuredImage;
  final String position;
  final String status;
  final dynamic createdAt;
  final dynamic updatedAt;

  factory ListElement.fromJson(Map<String, dynamic> json) => ListElement(
        id: json["id"] ?? '',
        photo: json["photo"] ?? '',
        photoCategoryId: json["photo_category_id"] ?? '',
        albumNameId: json["album_name_id"] ?? '',
        photoDescription: json["photo_description"] ?? '',
        altTag: json["alt_tag"] ?? '',
        year: json["year"] ?? '',
        featuredImage: json["featured_image"] ?? '',
        position: json["position"] ?? '',
        status: json["status"] ?? '',
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
// //     final ambassdarImageResponse = ambassdarImageResponseFromJson(jsonString);

// import 'dart:convert';

// AmbassdarImageResponse ambassdarImageResponseFromJson(String str) =>
//     AmbassdarImageResponse.fromJson(json.decode(str));

// String ambassdarImageResponseToJson(AmbassdarImageResponse data) =>
//     json.encode(data.toJson());

// class AmbassdarImageResponse {
//   AmbassdarImageResponse({
//     this.baseUrl,
//     this.success,
//     this.msg,
//     this.list,
//   });

//   String baseUrl;
//   bool success;
//   String msg;
//   List<ListElement> list;

//   factory AmbassdarImageResponse.fromJson(Map<String, dynamic> json) =>
//       AmbassdarImageResponse(
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
//   dynamic createdAt;
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
//         createdAt: json["created_at"],
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
//         "created_at": createdAt,
//         "updated_at": updatedAt,
//       };
// }

// enum CreatedAtEnum { THE_00000000000000 }

// final createdAtEnumValues =
//     EnumValues({"0000-00-00 00:00:00": CreatedAtEnum.THE_00000000000000});

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
