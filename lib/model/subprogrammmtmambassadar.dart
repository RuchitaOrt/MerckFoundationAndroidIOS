// To parse this JSON data, do
//
//     final subprommtmambassadarResponse = subprommtmambassadarResponseFromJson(jsonString);

import 'dart:convert';

SubprommtmambassadarResponse subprommtmambassadarResponseFromJson(String str) =>
    SubprommtmambassadarResponse.fromJson(json.decode(str));

String subprommtmambassadarResponseToJson(SubprommtmambassadarResponse data) =>
    json.encode(data.toJson());

class SubprommtmambassadarResponse {
  SubprommtmambassadarResponse({
    this.middleArea,
  });

  Map<String, MiddleArea> middleArea;

  factory SubprommtmambassadarResponse.fromJson(Map<String, dynamic> json) =>
      SubprommtmambassadarResponse(
        middleArea: Map.from(json["middle_area"]).map(
            (k, v) => MapEntry<String, MiddleArea>(k, MiddleArea.fromJson(v))),
      );

  Map<String, dynamic> toJson() => {
        "middle_area": Map.from(middleArea)
            .map((k, v) => MapEntry<String, dynamic>(k, v.toJson())),
      };
}

class MiddleArea {
  MiddleArea({
    this.content,
    this.mmtm,
     this.mmtmAmbFormer,
    this.videos,
    this.gallery,
  });

  Content content;
  Gallery mmtm;
  Gallery mmtmAmbFormer;
  Videos videos;
  Gallery gallery;

  factory MiddleArea.fromJson(Map<String, dynamic> json) => MiddleArea(
        content:
            json["content"] == null ? null : Content.fromJson(json["content"]),
        mmtm: json["mmtm"] == null ? null : Gallery.fromJson(json["mmtm"]),
         mmtmAmbFormer: json["mmtm_amb_former"] == null ? null : Gallery.fromJson(json["mmtm_amb_former"]),
        videos: json["videos"] == null ? null : Videos.fromJson(json["videos"]),
        gallery:
            json["gallery"] == null ? null : Gallery.fromJson(json["gallery"]),
      );

  Map<String, dynamic> toJson() => {
        "content": content == null ? null : content.toJson(),
        "mmtm": mmtm == null ? null : mmtm.toJson(),
         "mmtm_amb_former": mmtmAmbFormer == null ? null : mmtmAmbFormer.toJson(),
        "videos": videos == null ? null : videos.toJson(),
        "gallery": gallery == null ? null : gallery.toJson(),
      };
}

class Content {
  Content({
    this.list,
    this.baseUrl,
  });

  List<ContentList> list;
  String baseUrl;

  factory Content.fromJson(Map<String, dynamic> json) => Content(
        list: List<ContentList>.from(
            json["list"].map((x) => ContentList.fromJson(x))),
        baseUrl: json["base_url"],
      );

  Map<String, dynamic> toJson() => {
        "list": List<dynamic>.from(list.map((x) => x.toJson())),
        "base_url": baseUrl,
      };
}

class ContentList {
  ContentList({
    this.id,
    this.contentType,
    this.pageContent,
    this.title,
    this.shortDescription,
    this.image,
    this.altText,
    this.url,
    this.utubeUrl,
    this.metaKeyword,
    this.metaDescription,
    this.status,
    this.createdAt,
    this.updatedAt,
  });

  String id;
  String contentType;
  String pageContent;
  String title;
  String shortDescription;
  dynamic image;
  String altText;
  String url;
  String utubeUrl;
  String metaKeyword;
  String metaDescription;
  String status;
  DateTime createdAt;
  DateTime updatedAt;

  factory ContentList.fromJson(Map<String, dynamic> json) => ContentList(
        id: json["id"],
        contentType: json["content_type"],
        pageContent: json["page_content"],
        title: json["title"],
        shortDescription: json["short_description"],
        image: json["image"],
        altText: json["alt_text"],
        url: json["url"],
        utubeUrl: json["utube_url"],
        metaKeyword: json["meta_keyword"],
        metaDescription: json["meta_description"],
        status: json["status"],
        createdAt: DateTime.parse(json["created_at"]),
        updatedAt: DateTime.parse(json["updated_at"]),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "content_type": contentType,
        "page_content": pageContent,
        "title": title,
        "short_description": shortDescription,
        "image": image,
        "alt_text": altText,
        "url": url,
        "utube_url": utubeUrl,
        "meta_keyword": metaKeyword,
        "meta_description": metaDescription,
        "status": status,
        "created_at": createdAt.toIso8601String(),
        "updated_at": updatedAt.toIso8601String(),
      };
}

class Gallery {
  Gallery({
    this.list,
    this.baseUrl,
  });

  List<GalleryList> list;
  String baseUrl;

  factory Gallery.fromJson(Map<String, dynamic> json) => Gallery(
        list: List<GalleryList>.from(
            json["list"].map((x) => GalleryList.fromJson(x))),
        baseUrl: json["base_url"],
      );

  Map<String, dynamic> toJson() => {
        "list": List<dynamic>.from(list.map((x) => x.toJson())),
        "base_url": baseUrl,
      };
}

class GalleryList {
  GalleryList({
    this.id,
    this.photo,
    this.photoCategoryId,
    this.albumNameId,
    this.photoDescription,
    this.altTag,
    this.year,
    this.status,
    this.createdAt,
    this.updatedAt,
    this.featuredImage,
    this.position,
  });

  String id;
  String photo;
  String photoCategoryId;
  String albumNameId;
  String photoDescription;
  String altTag;
  String year;
  String status;
  CreatedAtEnum createdAt;
  dynamic updatedAt;
  String featuredImage;
  String position;

  factory GalleryList.fromJson(Map<String, dynamic> json) => GalleryList(
        id: json["id"],
        photo: json["photo"],
        photoCategoryId: json["photo_category_id"],
        albumNameId: json["album_name_id"],
        photoDescription: json["photo_description"],
        altTag: json["alt_tag"],
        year: json["year"],
        status: json["status"],
        createdAt: createdAtEnumValues.map[json["created_at"]],
        updatedAt: json["updated_at"],
        featuredImage:
            json["featured_image"] == null ? null : json["featured_image"],
        position: json["position"] == null ? null : json["position"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "photo": photo,
        "photo_category_id": photoCategoryId,
        "album_name_id": albumNameId,
        "photo_description": photoDescription,
        "alt_tag": altTag,
        "year": year,
        "status": status,
        "created_at": createdAtEnumValues.reverse[createdAt],
        "updated_at": updatedAt,
        "featured_image": featuredImage == null ? null : featuredImage,
        "position": position == null ? null : position,
      };
}

enum CreatedAtEnum { THE_00000000000000 }

final createdAtEnumValues =
    EnumValues({"0000-00-00 00:00:00": CreatedAtEnum.THE_00000000000000});

class Videos {
  Videos({
    this.list,
  });

  List<VideosList> list;

  factory Videos.fromJson(Map<String, dynamic> json) => Videos(
        list: List<VideosList>.from(
            json["list"].map((x) => VideosList.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "list": List<dynamic>.from(list.map((x) => x.toJson())),
      };
}

class VideosList {
  VideosList({
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

  String id;
  String videoLink;
  String videoDesc;
  String countryId;
  String categoryId;
  String year;
  String status;
  dynamic createdAt;
  dynamic updatedAt;

  factory VideosList.fromJson(Map<String, dynamic> json) => VideosList(
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

class EnumValues<T> {
  Map<String, T> map;
  Map<T, String> reverseMap;

  EnumValues(this.map);

  Map<T, String> get reverse {
    if (reverseMap == null) {
      reverseMap = map.map((k, v) => new MapEntry(v, k));
    }
    return reverseMap;
  }
}

// // To parse this JSON data, do
// //
// //     final subprommtmambassadarResponse = subprommtmambassadarResponseFromJson(jsonString);

// import 'dart:convert';

// SubprommtmambassadarResponse subprommtmambassadarResponseFromJson(String str) =>
//     SubprommtmambassadarResponse.fromJson(json.decode(str));

// String subprommtmambassadarResponseToJson(SubprommtmambassadarResponse data) =>
//     json.encode(data.toJson());

// class SubprommtmambassadarResponse {
//   SubprommtmambassadarResponse({
//     this.middleArea,
//   });

//   Map<String, MiddleArea> middleArea;

//   factory SubprommtmambassadarResponse.fromJson(Map<String, dynamic> json) =>
//       SubprommtmambassadarResponse(
//         middleArea: Map.from(json["middle_area"]).map(
//             (k, v) => MapEntry<String, MiddleArea>(k, MiddleArea.fromJson(v))),
//       );

//   Map<String, dynamic> toJson() => {
//         "middle_area": Map.from(middleArea)
//             .map((k, v) => MapEntry<String, dynamic>(k, v.toJson())),
//       };
// }

// class MiddleArea {
//   MiddleArea({
//     this.content,
//     this.ambasdars,
//     this.videos,
//     this.gallery,
//   });

//   Content content;
//   Ambasdars ambasdars;
//   Videos videos;
//   Ambasdars gallery;

//   factory MiddleArea.fromJson(Map<String, dynamic> json) => MiddleArea(
//         content:
//             json["content"] == null ? null : Content.fromJson(json["content"]),
//         ambasdars: json["ambasdars"] == null
//             ? null
//             : Ambasdars.fromJson(json["ambasdars"]),
//         videos: json["videos"] == null ? null : Videos.fromJson(json["videos"]),
//         gallery: json["gallery"] == null
//             ? null
//             : Ambasdars.fromJson(json["gallery"]),
//       );

//   Map<String, dynamic> toJson() => {
//         "content": content == null ? null : content.toJson(),
//         "ambasdars": ambasdars == null ? null : ambasdars.toJson(),
//         "videos": videos == null ? null : videos.toJson(),
//         "gallery": gallery == null ? null : gallery.toJson(),
//       };
// }

// class Ambasdars {
//   Ambasdars({
//     this.list,
//     this.baseUrl,
//   });

//   List<AmbasdarsList> list;
//   String baseUrl;

//   factory Ambasdars.fromJson(Map<String, dynamic> json) => Ambasdars(
//         list: List<AmbasdarsList>.from(
//             json["list"].map((x) => AmbasdarsList.fromJson(x))),
//         baseUrl: json["base_url"],
//       );

//   Map<String, dynamic> toJson() => {
//         "list": List<dynamic>.from(list.map((x) => x.toJson())),
//         "base_url": baseUrl,
//       };
// }

// class AmbasdarsList {
//   AmbasdarsList({
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
//     this.position,
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
//   String position;

//   factory AmbasdarsList.fromJson(Map<String, dynamic> json) => AmbasdarsList(
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
//         position: json["position"] == null ? null : json["position"],
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
//         "position": position == null ? null : position,
//       };
// }

// enum AtedAt { THE_00000000000000 }

// final atedAtValues =
//     EnumValues({"0000-00-00 00:00:00": AtedAt.THE_00000000000000});

// class Content {
//   Content({
//     this.list,
//     this.baseUrl,
//   });

//   List<ContentList> list;
//   String baseUrl;

//   factory Content.fromJson(Map<String, dynamic> json) => Content(
//         list: List<ContentList>.from(
//             json["list"].map((x) => ContentList.fromJson(x))),
//         baseUrl: json["base_url"],
//       );

//   Map<String, dynamic> toJson() => {
//         "list": List<dynamic>.from(list.map((x) => x.toJson())),
//         "base_url": baseUrl,
//       };
// }

// class ContentList {
//   ContentList({
//     this.id,
//     this.contentType,
//     this.pageContent,
//     this.title,
//     this.shortDescription,
//     this.image,
//     this.altText,
//     this.url,
//     this.utubeUrl,
//     this.metaKeyword,
//     this.metaDescription,
//     this.status,
//     this.createdAt,
//     this.updatedAt,
//   });

//   String id;
//   String contentType;
//   String pageContent;
//   String title;
//   String shortDescription;
//   dynamic image;
//   String altText;
//   String url;
//   String utubeUrl;
//   String metaKeyword;
//   String metaDescription;
//   String status;
//   DateTime createdAt;
//   DateTime updatedAt;

//   factory ContentList.fromJson(Map<String, dynamic> json) => ContentList(
//         id: json["id"],
//         contentType: json["content_type"],
//         pageContent: json["page_content"],
//         title: json["title"],
//         shortDescription: json["short_description"],
//         image: json["image"],
//         altText: json["alt_text"],
//         url: json["url"],
//         utubeUrl: json["utube_url"],
//         metaKeyword: json["meta_keyword"],
//         metaDescription: json["meta_description"],
//         status: json["status"],
//         createdAt: DateTime.parse(json["created_at"]),
//         updatedAt: DateTime.parse(json["updated_at"]),
//       );

//   Map<String, dynamic> toJson() => {
//         "id": id,
//         "content_type": contentType,
//         "page_content": pageContent,
//         "title": title,
//         "short_description": shortDescription,
//         "image": image,
//         "alt_text": altText,
//         "url": url,
//         "utube_url": utubeUrl,
//         "meta_keyword": metaKeyword,
//         "meta_description": metaDescription,
//         "status": status,
//         "created_at": createdAt.toIso8601String(),
//         "updated_at": updatedAt.toIso8601String(),
//       };
// }

// class Videos {
//   Videos({
//     this.list,
//   });

//   List<VideosList> list;

//   factory Videos.fromJson(Map<String, dynamic> json) => Videos(
//         list: List<VideosList>.from(
//             json["list"].map((x) => VideosList.fromJson(x))),
//       );

//   Map<String, dynamic> toJson() => {
//         "list": List<dynamic>.from(list.map((x) => x.toJson())),
//       };
// }

// class VideosList {
//   VideosList({
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

//   factory VideosList.fromJson(Map<String, dynamic> json) => VideosList(
//         id: json["id"],
//         videoLink: json["video_link"],
//         videoDesc: json["video_desc"],
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
