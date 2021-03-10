// To parse this JSON data, do
//
//     final stemprogramResponse = stemprogramResponseFromJson(jsonString);

import 'dart:convert';

StemprogramResponse stemprogramResponseFromJson(String str) =>
    StemprogramResponse.fromJson(json.decode(str));

String stemprogramResponseToJson(StemprogramResponse data) =>
    json.encode(data.toJson());

class StemprogramResponse {
  StemprogramResponse({
    this.middleArea,
    this.sliderArea,
    this.rightArea,
  });

  Map<String, MiddleArea> middleArea;
  List<SliderArea> sliderArea;
  Map<String, RightArea> rightArea;

  factory StemprogramResponse.fromJson(Map<String, dynamic> json) =>
      StemprogramResponse(
        middleArea: Map.from(json["middle_area"]).map(
            (k, v) => MapEntry<String, MiddleArea>(k, MiddleArea.fromJson(v))),
        sliderArea: List<SliderArea>.from(
            json["slider_area"].map((x) => SliderArea.fromJson(x))),
        rightArea: Map.from(json["Right_area"]).map(
            (k, v) => MapEntry<String, RightArea>(k, RightArea.fromJson(v))),
      );

  Map<String, dynamic> toJson() => {
        "middle_area": Map.from(middleArea)
            .map((k, v) => MapEntry<String, dynamic>(k, v.toJson())),
        "slider_area": List<dynamic>.from(sliderArea.map((x) => x.toJson())),
        "Right_area": Map.from(rightArea)
            .map((k, v) => MapEntry<String, dynamic>(k, v.toJson())),
      };
}

class MiddleArea {
  MiddleArea({
    this.content,
    this.videos,
    this.gallery,
    this.latestUpdates,
  });

  Content content;
  Videos videos;
  Gallery gallery;
  LatestUpdates latestUpdates;

  factory MiddleArea.fromJson(Map<String, dynamic> json) => MiddleArea(
        content:
            json["content"] == null ? null : Content.fromJson(json["content"]),
        videos: json["videos"] == null ? null : Videos.fromJson(json["videos"]),
        gallery:
            json["gallery"] == null ? null : Gallery.fromJson(json["gallery"]),
        latestUpdates: json["latest_updates"] == null
            ? null
            : LatestUpdates.fromJson(json["latest_updates"]),
      );

  Map<String, dynamic> toJson() => {
        "content": content == null ? null : content.toJson(),
        "videos": videos == null ? null : videos.toJson(),
        "gallery": gallery == null ? null : gallery.toJson(),
        "latest_updates": latestUpdates == null ? null : latestUpdates.toJson(),
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
    this.featuredImage,
    this.position,
    this.status,
    this.createdAt,
    this.updatedAt,
  });

  String id;
  String photo;
  String photoCategoryId;
  String albumNameId;
  String photoDescription;
  String altTag;
  String year;
  String featuredImage;
  String position;
  String status;
  String createdAt;
  String updatedAt;

  factory GalleryList.fromJson(Map<String, dynamic> json) => GalleryList(
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

class LatestUpdates {
  LatestUpdates({
    this.list,
    this.baseUrl,
  });

  List<LatestUpdatesList> list;
  String baseUrl;

  factory LatestUpdates.fromJson(Map<String, dynamic> json) => LatestUpdates(
        list: List<LatestUpdatesList>.from(
            json["list"].map((x) => LatestUpdatesList.fromJson(x))),
        baseUrl: json["base_url"],
      );

  Map<String, dynamic> toJson() => {
        "list": List<dynamic>.from(list.map((x) => x.toJson())),
        "base_url": baseUrl,
      };
}

class LatestUpdatesList {
  LatestUpdatesList({
    this.id,
    this.articleType,
    this.title,
    this.shortDescription,
    this.details,
    this.detailPageUrl,
    this.image,
    this.altTag,
    this.metaKeyword,
    this.metaDescription,
    this.status,
    this.createdAt,
    this.updatedAt,
  });

  String id;
  String articleType;
  String title;
  String shortDescription;
  String details;
  String detailPageUrl;
  String image;
  String altTag;
  String metaKeyword;
  String metaDescription;
  String status;
  DateTime createdAt;
  DateTime updatedAt;

  factory LatestUpdatesList.fromJson(Map<String, dynamic> json) =>
      LatestUpdatesList(
        id: json["id"],
        articleType: json["article_type"],
        title: json["title"],
        shortDescription: json["short_description"],
        details: json["details"],
        detailPageUrl: json["detail_page_url"],
        image: json["image"],
        altTag: json["alt_tag"],
        metaKeyword: json["meta_keyword"],
        metaDescription: json["meta_description"],
        status: json["status"],
        createdAt: DateTime.parse(json["created_at"]),
        updatedAt: DateTime.parse(json["updated_at"]),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "article_type": articleType,
        "title": title,
        "short_description": shortDescription,
        "details": details,
        "detail_page_url": detailPageUrl,
        "image": image,
        "alt_tag": altTag,
        "meta_keyword": metaKeyword,
        "meta_description": metaDescription,
        "status": status,
        "created_at": createdAt.toIso8601String(),
        "updated_at": updatedAt.toIso8601String(),
      };
}

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
  String createdAt;
  String updatedAt;

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

class RightArea {
  RightArea({
    this.callForApp,
    this.digitalLibrary,
  });

  CallForApp callForApp;
  DigitalLibrary digitalLibrary;

  factory RightArea.fromJson(Map<String, dynamic> json) => RightArea(
        callForApp: json["call_for_app"] == null
            ? null
            : CallForApp.fromJson(json["call_for_app"]),
        digitalLibrary: json["digital_library"] == null
            ? null
            : DigitalLibrary.fromJson(json["digital_library"]),
      );

  Map<String, dynamic> toJson() => {
        "call_for_app": callForApp == null ? null : callForApp.toJson(),
        "digital_library":
            digitalLibrary == null ? null : digitalLibrary.toJson(),
      };
}

class CallForApp {
  CallForApp({
    this.list,
    this.baseUrl,
  });

  List<CallForAppList> list;
  String baseUrl;

  factory CallForApp.fromJson(Map<String, dynamic> json) => CallForApp(
        list: List<CallForAppList>.from(
            json["list"].map((x) => CallForAppList.fromJson(x))),
        baseUrl: json["base_url"],
      );

  Map<String, dynamic> toJson() => {
        "list": List<dynamic>.from(list.map((x) => x.toJson())),
        "base_url": baseUrl,
      };
}

class CallForAppList {
  CallForAppList({
    this.id,
    this.title,
    this.eventType,
    this.eventStartDate,
    this.eventEndDate,
    this.pdfFile,
    this.appImg,
    this.altText,
    this.status,
    this.createdAt,
    this.updatedAt,
  });

  String id;
  String title;
  String eventType;
  DateTime eventStartDate;
  DateTime eventEndDate;
  String pdfFile;
  String appImg;
  String altText;
  String status;
  String createdAt;
  String updatedAt;

  factory CallForAppList.fromJson(Map<String, dynamic> json) => CallForAppList(
        id: json["id"],
        title: json["title"],
        eventType: json["event_type"],
        eventStartDate: DateTime.parse(json["event_start_date"]),
        eventEndDate: DateTime.parse(json["event_end_date"]),
        pdfFile: json["pdf_file"],
        appImg: json["app_img"],
        altText: json["alt_text"],
        status: json["status"],
        createdAt: json["created_at"],
        updatedAt: json["updated_at"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "title": title,
        "event_type": eventType,
        "event_start_date":
            "${eventStartDate.year.toString().padLeft(4, '0')}-${eventStartDate.month.toString().padLeft(2, '0')}-${eventStartDate.day.toString().padLeft(2, '0')}",
        "event_end_date":
            "${eventEndDate.year.toString().padLeft(4, '0')}-${eventEndDate.month.toString().padLeft(2, '0')}-${eventEndDate.day.toString().padLeft(2, '0')}",
        "pdf_file": pdfFile,
        "app_img": appImg,
        "alt_text": altText,
        "status": status,
        "created_at": createdAt,
        "updated_at": updatedAt,
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
  String createdAt;
  String updatedAt;

  factory DigitalLibraryList.fromJson(Map<String, dynamic> json) =>
      DigitalLibraryList(
        id: json["id"],
        categoryType: json["category_type"],
        title: json["title"],
        image: json["image"],
        altText: json["alt_text"],
        document: json["document"],
        status: json["status"],
        createdAt: json["created_at"],
        updatedAt: json["updated_at"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "category_type": categoryType,
        "title": title,
        "image": image,
        "alt_text": altText,
        "document": document,
        "status": status,
        "created_at": createdAt,
        "updated_at": updatedAt,
      };
}

class SliderArea {
  SliderArea({
    this.slider,
  });

  Slider slider;

  factory SliderArea.fromJson(Map<String, dynamic> json) => SliderArea(
        slider: Slider.fromJson(json["slider"]),
      );

  Map<String, dynamic> toJson() => {
        "slider": slider.toJson(),
      };
}

class Slider {
  Slider({
    this.list,
    this.baseUrl,
  });

  List<SliderList> list;
  String baseUrl;

  factory Slider.fromJson(Map<String, dynamic> json) => Slider(
        list: List<SliderList>.from(
            json["list"].map((x) => SliderList.fromJson(x))),
        baseUrl: json["base_url"],
      );

  Map<String, dynamic> toJson() => {
        "list": List<dynamic>.from(list.map((x) => x.toJson())),
        "base_url": baseUrl,
      };
}

class SliderList {
  SliderList({
    this.id,
    this.menuId,
    this.imageTitle,
    this.imageDesc,
    this.links,
    this.image,
    this.altText,
    this.status,
    this.createdAt,
    this.updatedAt,
  });

  String id;
  String menuId;
  String imageTitle;
  String imageDesc;
  String links;
  String image;
  String altText;
  String status;
  DateTime createdAt;
  DateTime updatedAt;

  factory SliderList.fromJson(Map<String, dynamic> json) => SliderList(
        id: json["id"],
        menuId: json["menu_id"],
        imageTitle: json["image_title"],
        imageDesc: json["image_desc"],
        links: json["links"],
        image: json["image"],
        altText: json["alt_text"],
        status: json["status"],
        createdAt: DateTime.parse(json["created_at"]),
        updatedAt: DateTime.parse(json["updated_at"]),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "menu_id": menuId,
        "image_title": imageTitle,
        "image_desc": imageDesc,
        "links": links,
        "image": image,
        "alt_text": altText,
        "status": status,
        "created_at": createdAt.toIso8601String(),
        "updated_at": updatedAt.toIso8601String(),
      };
}
