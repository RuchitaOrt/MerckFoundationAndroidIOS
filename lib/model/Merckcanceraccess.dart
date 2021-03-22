// To parse this JSON data, do
//
//     final merckcanceraccessResponse = merckcanceraccessResponseFromJson(jsonString);

import 'dart:convert';

MerckcanceraccessResponse merckcanceraccessResponseFromJson(String str) =>
    MerckcanceraccessResponse.fromJson(json.decode(str));

String merckcanceraccessResponseToJson(MerckcanceraccessResponse data) =>
    json.encode(data.toJson());

class MerckcanceraccessResponse {
  MerckcanceraccessResponse({
    this.sliderArea,
    this.middleArea,
    this.rightArea,
  });

  List<SliderArea> sliderArea;
  Map<String, MiddleArea> middleArea;
  RightArea rightArea;

  factory MerckcanceraccessResponse.fromJson(Map<String, dynamic> json) =>
      MerckcanceraccessResponse(
        sliderArea: List<SliderArea>.from(
            json["slider_area"].map((x) => SliderArea.fromJson(x))),
        middleArea: Map.from(json["middle_area"]).map(
            (k, v) => MapEntry<String, MiddleArea>(k, MiddleArea.fromJson(v))),
        rightArea: RightArea.fromJson(json["Right_area"]),
      );

  Map<String, dynamic> toJson() => {
        "slider_area": List<dynamic>.from(sliderArea.map((x) => x.toJson())),
        "middle_area": Map.from(middleArea)
            .map((k, v) => MapEntry<String, dynamic>(k, v.toJson())),
        "Right_area": rightArea.toJson(),
      };
}

class MiddleArea {
  MiddleArea({
    this.content,
    this.awards,
    this.videos,
    this.latestUpdates,
    this.media,
    this.testimonial,
  });

  Content content;
  DigitalLibrary awards;
  Videos videos;
  LatestUpdates latestUpdates;
  DigitalLibrary media;
  LatestUpdates testimonial;

  factory MiddleArea.fromJson(Map<String, dynamic> json) => MiddleArea(
        content:
            json["content"] == null ? null : Content.fromJson(json["content"]),
        awards: json["awards"] == null
            ? null
            : DigitalLibrary.fromJson(json["awards"]),
        videos: json["videos"] == null ? null : Videos.fromJson(json["videos"]),
        latestUpdates: json["latest_updates"] == null
            ? null
            : LatestUpdates.fromJson(json["latest_updates"]),
        media: json["media"] == null
            ? null
            : DigitalLibrary.fromJson(json["media"]),
        testimonial: json["testimonial"] == null
            ? null
            : LatestUpdates.fromJson(json["testimonial"]),
      );

  Map<String, dynamic> toJson() => {
        "content": content == null ? null : content.toJson(),
        "awards": awards == null ? null : awards.toJson(),
        "videos": videos == null ? null : videos.toJson(),
        "latest_updates": latestUpdates == null ? null : latestUpdates.toJson(),
        "media": media == null ? null : media.toJson(),
        "testimonial": testimonial == null ? null : testimonial.toJson(),
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
    this.pageUrl,
    this.description,
    this.mediaUrl,
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
  String pageUrl;
  String description;
  String mediaUrl;

  factory DigitalLibraryList.fromJson(Map<String, dynamic> json) =>
      DigitalLibraryList(
        id: json["id"],
        categoryType:
            json["category_type"] == null ? null : json["category_type"],
        title: json["title"],
        image: json["image"],
        altText: json["alt_text"],
        document: json["document"] == null ? null : json["document"],
        status: json["status"],
        createdAt: json["created_at"],
        updatedAt: json["updated_at"],
        pageUrl: json["page_url"] == null ? null : json["page_url"],
        description: json["description"] == null ? null : json["description"],
        mediaUrl: json["media_url"] == null ? null : json["media_url"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "category_type": categoryType == null ? null : categoryType,
        "title": title,
        "image": image,
        "alt_text": altText,
        "document": document == null ? null : document,
        "status": status,
        "created_at": createdAt,
        "updated_at": updatedAt,
        "page_url": pageUrl == null ? null : pageUrl,
        "description": description == null ? null : description,
        "media_url": mediaUrl == null ? null : mediaUrl,
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
    this.testimonialName,
    this.departmentName,
    this.altText,
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
  String testimonialName;
  String departmentName;
  String altText;

  factory LatestUpdatesList.fromJson(Map<String, dynamic> json) =>
      LatestUpdatesList(
        id: json["id"],
        articleType: json["article_type"] == null ? null : json["article_type"],
        title: json["title"] == null ? null : json["title"],
        shortDescription: json["short_description"],
        details: json["details"],
        detailPageUrl: json["detail_page_url"],
        image: json["image"],
        altTag: json["alt_tag"] == null ? null : json["alt_tag"],
        metaKeyword: json["meta_keyword"],
        metaDescription: json["meta_description"],
        status: json["status"],
        createdAt: DateTime.parse(json["created_at"]),
        updatedAt: DateTime.parse(json["updated_at"]),
        testimonialName:
            json["testimonial_name"] == null ? null : json["testimonial_name"],
        departmentName:
            json["department_name"] == null ? null : json["department_name"],
        altText: json["alt_text"] == null ? null : json["alt_text"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "article_type": articleType == null ? null : articleType,
        "title": title == null ? null : title,
        "short_description": shortDescription,
        "details": details,
        "detail_page_url": detailPageUrl,
        "image": image,
        "alt_tag": altTag == null ? null : altTag,
        "meta_keyword": metaKeyword,
        "meta_description": metaDescription,
        "status": status,
        "created_at": createdAt.toIso8601String(),
        "updated_at": updatedAt.toIso8601String(),
        "testimonial_name": testimonialName == null ? null : testimonialName,
        "department_name": departmentName == null ? null : departmentName,
        "alt_text": altText == null ? null : altText,
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
    this.the3,
  });

  The3 the3;

  factory RightArea.fromJson(Map<String, dynamic> json) => RightArea(
        the3: The3.fromJson(json["3"]),
      );

  Map<String, dynamic> toJson() => {
        "3": the3.toJson(),
      };
}

class The3 {
  The3({
    this.digitalLibrary,
  });

  DigitalLibrary digitalLibrary;

  factory The3.fromJson(Map<String, dynamic> json) => The3(
        digitalLibrary: DigitalLibrary.fromJson(json["digital_library"]),
      );

  Map<String, dynamic> toJson() => {
        "digital_library": digitalLibrary.toJson(),
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
