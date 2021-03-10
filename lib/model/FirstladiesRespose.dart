// To parse this JSON data, do
//
//     final firstladiesResponse = firstladiesResponseFromJson(jsonString);

import 'dart:convert';

FirstladiesResponse firstladiesResponseFromJson(String str) =>
    FirstladiesResponse.fromJson(json.decode(str));

String firstladiesResponseToJson(FirstladiesResponse data) =>
    json.encode(data.toJson());

class FirstladiesResponse {
  FirstladiesResponse({
    this.middleArea,
    this.rightArea,
  });

  Map<String, MiddleArea> middleArea;
  Map<String, RightArea> rightArea;

  factory FirstladiesResponse.fromJson(Map<String, dynamic> json) =>
      FirstladiesResponse(
        middleArea: Map.from(json["middle_area"]).map(
            (k, v) => MapEntry<String, MiddleArea>(k, MiddleArea.fromJson(v))),
        rightArea: Map.from(json["Right_area"]).map(
            (k, v) => MapEntry<String, RightArea>(k, RightArea.fromJson(v))),
      );

  Map<String, dynamic> toJson() => {
        "middle_area": Map.from(middleArea)
            .map((k, v) => MapEntry<String, dynamic>(k, v.toJson())),
        "Right_area": Map.from(rightArea)
            .map((k, v) => MapEntry<String, dynamic>(k, v.toJson())),
      };
}

class MiddleArea {
  MiddleArea({
    this.content,
    this.videos,
    this.gallery,
  });

  Content content;
  Videos videos;
  Mmtm gallery;

  factory MiddleArea.fromJson(Map<String, dynamic> json) => MiddleArea(
        content:
            json["content"] == null ? null : Content.fromJson(json["content"]),
        videos: json["videos"] == null ? null : Videos.fromJson(json["videos"]),
        gallery:
            json["gallery"] == null ? null : Mmtm.fromJson(json["gallery"]),
      );

  Map<String, dynamic> toJson() => {
        "content": content == null ? null : content.toJson(),
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

class Mmtm {
  Mmtm({
    this.list,
    this.baseUrl,
  });

  List<MmtmList> list;
  String baseUrl;

  factory Mmtm.fromJson(Map<String, dynamic> json) => Mmtm(
        list:
            List<MmtmList>.from(json["list"].map((x) => MmtmList.fromJson(x))),
        baseUrl: json["base_url"],
      );

  Map<String, dynamic> toJson() => {
        "list": List<dynamic>.from(list.map((x) => x.toJson())),
        "base_url": baseUrl,
      };
}

class MmtmList {
  MmtmList({
    this.id,
    this.photo,
    this.photoCategoryId,
    this.albumNameId,
    this.photoDescription,
    this.altTag,
    this.year,
    this.featuredImage,
    this.status,
    this.createdAt,
    this.updatedAt,
    this.position,
  });

  String id;
  String photo;
  String photoCategoryId;
  String albumNameId;
  String photoDescription;
  String altTag;
  String year;
  String featuredImage;
  String status;
  AtedAt createdAt;
  dynamic updatedAt;
  String position;

  factory MmtmList.fromJson(Map<String, dynamic> json) => MmtmList(
        id: json["id"],
        photo: json["photo"],
        photoCategoryId: json["photo_category_id"],
        albumNameId: json["album_name_id"],
        photoDescription: json["photo_description"],
        altTag: json["alt_tag"],
        year: json["year"],
        featuredImage: json["featured_image"],
        status: json["status"],
        createdAt: atedAtValues.map[json["created_at"]],
        updatedAt: json["updated_at"],
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
        "featured_image": featuredImage,
        "status": status,
        "created_at": atedAtValues.reverse[createdAt],
        "updated_at": updatedAt,
        "position": position == null ? null : position,
      };
}

enum AtedAt { THE_00000000000000 }

final atedAtValues =
    EnumValues({"0000-00-00 00:00:00": AtedAt.THE_00000000000000});

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
  AtedAt createdAt;
  AtedAt updatedAt;

  factory VideosList.fromJson(Map<String, dynamic> json) => VideosList(
        id: json["id"],
        videoLink: json["video_link"],
        videoDesc: json["video_desc"],
        countryId: json["country_id"],
        categoryId: json["category_id"],
        year: json["year"],
        status: json["status"],
        createdAt: atedAtValues.map[json["created_at"]],
        updatedAt: atedAtValues.map[json["updated_at"]],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "video_link": videoLink,
        "video_desc": videoDesc,
        "country_id": countryId,
        "category_id": categoryId,
        "year": year,
        "status": status,
        "created_at": atedAtValues.reverse[createdAt],
        "updated_at": atedAtValues.reverse[updatedAt],
      };
}

class RightArea {
  RightArea({
    this.mmtm,
    this.digitalLibrary,
  });

  Mmtm mmtm;
  DigitalLibrary digitalLibrary;

  factory RightArea.fromJson(Map<String, dynamic> json) => RightArea(
        mmtm: json["mmtm"] == null ? null : Mmtm.fromJson(json["mmtm"]),
        digitalLibrary: json["digital_library"] == null
            ? null
            : DigitalLibrary.fromJson(json["digital_library"]),
      );

  Map<String, dynamic> toJson() => {
        "mmtm": mmtm == null ? null : mmtm.toJson(),
        "digital_library":
            digitalLibrary == null ? null : digitalLibrary.toJson(),
      };
}

class DigitalLibrary {
  DigitalLibrary({
    this.list,
    this.baseUrl,
  });

  List<DigitalLibraryList> list;
  String baseUrl;

  factory DigitalLibrary.fromJson(Map<String, dynamic> json) => DigitalLibrary(
        list: List<DigitalLibraryList>.from(
            json["list"].map((x) => DigitalLibraryList.fromJson(x))),
        baseUrl: json["base_url"],
      );

  Map<String, dynamic> toJson() => {
        "list": List<dynamic>.from(list.map((x) => x.toJson())),
        "base_url": baseUrl,
      };
}

class DigitalLibraryList {
  DigitalLibraryList({
    this.id,
    this.categoryType,
    this.title,
    this.image,
    this.altText,
    this.document,
    this.status,
    this.createdAt,
    this.updatedAt,
  });

  String id;
  String categoryType;
  String title;
  String image;
  String altText;
  String document;
  String status;
  AtedAt createdAt;
  AtedAt updatedAt;

  factory DigitalLibraryList.fromJson(Map<String, dynamic> json) =>
      DigitalLibraryList(
        id: json["id"],
        categoryType: json["category_type"],
        title: json["title"],
        image: json["image"],
        altText: json["alt_text"],
        document: json["document"],
        status: json["status"],
        createdAt: atedAtValues.map[json["created_at"]],
        updatedAt: atedAtValues.map[json["updated_at"]],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "category_type": categoryType,
        "title": title,
        "image": image,
        "alt_text": altText,
        "document": document,
        "status": status,
        "created_at": atedAtValues.reverse[createdAt],
        "updated_at": atedAtValues.reverse[updatedAt],
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
