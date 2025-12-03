// import 'dart:convert';

// MmtmMainResponse mmtmMainResponseFromJson(String str) =>
//     MmtmMainResponse.fromJson(json.decode(str));

// String mmtmMainResponseToJson(MmtmMainResponse data) =>
//     json.encode(data.toJson());

// class MmtmMainResponse {
//   MmtmMainResponse({
//     this.middleArea,
//     this.bottomArea,
//     this.sliderArea,
//     this.rightArea,
//   });

//   Map<String, MiddleArea>? middleArea;
//   Map<String, BottomArea>? bottomArea;
//   List<SliderArea>? sliderArea;
//   Map<String, RightArea>? rightArea;

//   factory MmtmMainResponse.fromJson(Map<String, dynamic> json) =>
//       MmtmMainResponse(
//         middleArea: json["middle_area"] == null
//             ? null
//             : Map.from(json["middle_area"]).map(
//                 (k, v) => MapEntry<String, MiddleArea>(k, MiddleArea.fromJson(v))),
//         bottomArea: json["bottom_area"] == null
//             ? null
//             : Map.from(json["bottom_area"]).map(
//                 (k, v) => MapEntry<String, BottomArea>(k, BottomArea.fromJson(v))),
//         sliderArea: json["slider_area"] == null
//             ? null
//             : List<SliderArea>.from(
//                 json["slider_area"].map((x) => SliderArea.fromJson(x))),
//         rightArea: json["Right_area"] == null
//             ? null
//             : Map.from(json["Right_area"]).map(
//                 (k, v) => MapEntry<String, RightArea>(k, RightArea.fromJson(v))),
//       );

//   Map<String, dynamic> toJson() => {
//         "middle_area": middleArea == null
//             ? null
//             : Map.from(middleArea!)
//                 .map((k, v) => MapEntry<String, dynamic>(k, v.toJson())),
//         "bottom_area": bottomArea == null
//             ? null
//             : Map.from(bottomArea!)
//                 .map((k, v) => MapEntry<String, dynamic>(k, v.toJson())),
//         "slider_area": sliderArea == null
//             ? null
//             : List<dynamic>.from(sliderArea!.map((x) => x.toJson())),
//         "Right_area": rightArea == null
//             ? null
//             : Map.from(rightArea!)
//                 .map((k, v) => MapEntry<String, dynamic>(k, v.toJson())),
//       };
// }

// class BottomArea {
//   BottomArea({
//     this.media,
//     this.testimonial,
//   });

//   DigitalLibrary? media;
//   Testimonial? testimonial;

//   factory BottomArea.fromJson(Map<String, dynamic> json) => BottomArea(
//         media: json["media"] == null ? null : DigitalLibrary.fromJson(json["media"]),
//         testimonial: json["testimonial"] == null
//             ? null
//             : Testimonial.fromJson(json["testimonial"]),
//       );

//   Map<String, dynamic> toJson() => {
//         "media": media?.toJson(),
//         "testimonial": testimonial?.toJson(),
//       };
// }

// class DigitalLibrary {
//   DigitalLibrary({
//     this.list,
//     this.baseUrl,
//     this.pdfUrl,
//   });

//   List<DigitalLibraryList>? list;
//   String? baseUrl;
//   String? pdfUrl;

//   factory DigitalLibrary.fromJson(Map<String, dynamic> json) => DigitalLibrary(
//         list: json["list"] == null
//             ? null
//             : List<DigitalLibraryList>.from(
//                 json["list"].map((x) => DigitalLibraryList.fromJson(x))),
//         baseUrl: json["base_url"],
//         pdfUrl: json["pdf_url"],
//       );

//   Map<String, dynamic> toJson() => {
//         "list": list == null ? null : List<dynamic>.from(list!.map((x) => x.toJson())),
//         "base_url": baseUrl,
//         "pdf_url": pdfUrl,
//       };
// }

// class DigitalLibraryList {
//   DigitalLibraryList({
//     this.id,
//     this.categoryType,
//     this.title,
//     this.image,
//     this.altText,
//     this.document,
//     this.status,
//     this.createdAt,
//     this.updatedAt,
//     this.description,
//     this.mediaUrl,
//   });

//   String? id;
//   String? categoryType;
//   String? title;
//   String? image;
//   String? altText;
//   String? document;
//   String? status;
//   AtedAt? createdAt;
//   dynamic updatedAt;
//   String? description;
//   String? mediaUrl;

//   factory DigitalLibraryList.fromJson(Map<String, dynamic> json) =>
//       DigitalLibraryList(
//         id: json["id"],
//         categoryType: json["category_type"],
//         title: json["title"],
//         image: json["image"],
//         altText: json["alt_text"],
//         document: json["document"],
//         status: json["status"],
//         createdAt: json["created_at"] == null ? null : atedAtValues.map[json["created_at"]],
//         updatedAt: json["updated_at"],
//         description: json["description"],
//         mediaUrl: json["media_url"],
//       );

//   Map<String, dynamic> toJson() => {
//         "id": id,
//         "category_type": categoryType,
//         "title": title,
//         "image": image,
//         "alt_text": altText,
//         "document": document,
//         "status": status,
//         "created_at": createdAt == null ? null : atedAtValues.reverse[createdAt],
//         "updated_at": updatedAt,
//         "description": description,
//         "media_url": mediaUrl,
//       };
// }

// enum AtedAt { THE_00000000000000 }

// final atedAtValues =
//     EnumValues({"0000-00-00 00:00:00": AtedAt.THE_00000000000000});

// class Testimonial {
//   Testimonial({
//     this.list,
//     this.baseUrl,
//   });

//   List<TestimonialList>? list;
//   String? baseUrl;

//   factory Testimonial.fromJson(Map<String, dynamic> json) => Testimonial(
//         list: json["list"] == null
//             ? null
//             : List<TestimonialList>.from(
//                 json["list"].map((x) => TestimonialList.fromJson(x))),
//         baseUrl: json["base_url"],
//       );

//   Map<String, dynamic> toJson() => {
//         "list": list == null ? null : List<dynamic>.from(list!.map((x) => x.toJson())),
//         "base_url": baseUrl,
//       };
// }

// class TestimonialList {
//   TestimonialList({
//     this.id,
//     this.testimonialName,
//     this.departmentName,
//     this.shortDescription,
//     this.details,
//     this.detailPageUrl,
//     this.image,
//     this.altText,
//     this.metaKeyword,
//     this.metaDescription,
//     this.status,
//     this.createdAt,
//     this.updatedAt,
//     this.articleType,
//     this.title,
//     this.altTag,
//   });

//   String? id;
//   String? testimonialName;
//   String? departmentName;
//   String? shortDescription;
//   String? details;
//   String? detailPageUrl;
//   String? image;
//   String? altText;
//   String? metaKeyword;
//   String? metaDescription;
//   String? status;
//   DateTime? createdAt;
//   DateTime? updatedAt;
//   String? articleType;
//   String? title;
//   String? altTag;

//   factory TestimonialList.fromJson(Map<String, dynamic> json) => TestimonialList(
//         id: json["id"],
//         testimonialName: json["testimonial_name"],
//         departmentName: json["department_name"],
//         shortDescription: json["short_description"],
//         details: json["details"],
//         detailPageUrl: json["detail_page_url"],
//         image: json["image"],
//         altText: json["alt_text"],
//         metaKeyword: json["meta_keyword"],
//         metaDescription: json["meta_description"],
//         status: json["status"],
//         createdAt: json["created_at"] == null ? null : DateTime.parse(json["created_at"]),
//         updatedAt: json["updated_at"] == null ? null : DateTime.parse(json["updated_at"]),
//         articleType: json["article_type"],
//         title: json["title"],
//         altTag: json["alt_tag"],
//       );

//   Map<String, dynamic> toJson() => {
//         "id": id,
//         "testimonial_name": testimonialName,
//         "department_name": departmentName,
//         "short_description": shortDescription,
//         "details": details,
//         "detail_page_url": detailPageUrl,
//         "image": image,
//         "alt_text": altText,
//         "meta_keyword": metaKeyword,
//         "meta_description": metaDescription,
//         "status": status,
//         "created_at": createdAt?.toIso8601String(),
//         "updated_at": updatedAt?.toIso8601String(),
//         "article_type": articleType,
//         "title": title,
//         "alt_tag": altTag,
//       };
// }

// class MiddleArea {
//   MiddleArea({
//     this.content,
//     this.videos,
//     this.gallery,
//     this.latestUpdates,
//   });

//   Content? content;
//   Videos? videos;
//   Mmtm? gallery;
//   Testimonial? latestUpdates;

//   factory MiddleArea.fromJson(Map<String, dynamic> json) => MiddleArea(
//         content: json["content"] == null ? null : Content.fromJson(json["content"]),
//         videos: json["videos"] == null ? null : Videos.fromJson(json["videos"]),
//         gallery: json["gallery"] == null ? null : Mmtm.fromJson(json["gallery"]),
//         latestUpdates:
//             json["latest_updates"] == null ? null : Testimonial.fromJson(json["latest_updates"]),
//       );

//   Map<String, dynamic> toJson() => {
//         "content": content?.toJson(),
//         "videos": videos?.toJson(),
//         "gallery": gallery?.toJson(),
//         "latest_updates": latestUpdates?.toJson(),
//       };
// }

// class Content {
//   Content({
//     this.list,
//     this.baseUrl,
//   });

//   List<ContentList>? list;
//   String? baseUrl;

//   factory Content.fromJson(Map<String, dynamic> json) => Content(
//         list: json["list"] == null
//             ? null
//             : List<ContentList>.from(json["list"].map((x) => ContentList.fromJson(x))),
//         baseUrl: json["base_url"],
//       );

//   Map<String, dynamic> toJson() => {
//         "list": list == null ? null : List<dynamic>.from(list!.map((x) => x.toJson())),
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

//   String? id;
//   String? contentType;
//   String? pageContent;
//   String? title;
//   String? shortDescription;
//   dynamic image;
//   String? altText;
//   String? url;
//   String? utubeUrl;
//   String? metaKeyword;
//   String? metaDescription;
//   String? status;
//   DateTime? createdAt;
//   DateTime? updatedAt;

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
//         createdAt: json["created_at"] == null ? null : DateTime.parse(json["created_at"]),
//         updatedAt: json["updated_at"] == null ? null : DateTime.parse(json["updated_at"]),
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
//         "created_at": createdAt?.toIso8601String(),
//         "updated_at": updatedAt?.toIso8601String(),
//       };
// }

// class Mmtm {
//   Mmtm({
//     this.list,
//     this.baseUrl,
//   });

//   List<MmtmList>? list;
//   String? baseUrl;

//   factory Mmtm.fromJson(Map<String, dynamic> json) => Mmtm(
//         list: json["list"] == null
//             ? null
//             : List<MmtmList>.from(json["list"].map((x) => MmtmList.fromJson(x))),
//         baseUrl: json["base_url"],
//       );

//   Map<String, dynamic> toJson() => {
//         "list": list == null ? null : List<dynamic>.from(list!.map((x) => x.toJson())),
//         "base_url": baseUrl,
//       };
// }

// class MmtmList {
//   MmtmList({
//     this.id,
//     this.categoryType,
//     this.title,
//     this.image,
//     this.altText,
//     this.status,
//     this.createdAt,
//     this.updatedAt,
//   });

//   String? id;
//   String? categoryType;
//   String? title;
//   String? image;
//   String? altText;
//   String? status;
//   DateTime? createdAt;
//   DateTime? updatedAt;

//   factory MmtmList.fromJson(Map<String, dynamic> json) => MmtmList(
//         id: json["id"],
//         categoryType: json["category_type"],
//         title: json["title"],
//         image: json["image"],
//         altText: json["alt_text"],
//         status: json["status"],
//         createdAt: json["created_at"] == null ? null : DateTime.parse(json["created_at"]),
//         updatedAt: json["updated_at"] == null ? null : DateTime.parse(json["updated_at"]),
//       );

//   Map<String, dynamic> toJson() => {
//         "id": id,
//         "category_type": categoryType,
//         "title": title,
//         "image": image,
//         "alt_text": altText,
//         "status": status,
//         "created_at": createdAt?.toIso8601String(),
//         "updated_at": updatedAt?.toIso8601String(),
//       };
// }

// class SliderArea {
//   SliderArea({
//     this.id,
//     this.image,
//     this.title,
//     this.status,
//     this.createdAt,
//     this.updatedAt,
//     this.imageAltText,
//   });

//   String? id;
//   String? image;
//   String? title;
//   String? status;
//   DateTime? createdAt;
//   DateTime? updatedAt;
//   String? imageAltText;

//   factory SliderArea.fromJson(Map<String, dynamic> json) => SliderArea(
//         id: json["id"],
//         image: json["image"],
//         title: json["title"],
//         status: json["status"],
//         createdAt: json["created_at"] == null ? null : DateTime.parse(json["created_at"]),
//         updatedAt: json["updated_at"] == null ? null : DateTime.parse(json["updated_at"]),
//         imageAltText: json["image_alt_text"],
//       );

//   Map<String, dynamic> toJson() => {
//         "id": id,
//         "image": image,
//         "title": title,
//         "status": status,
//         "created_at": createdAt?.toIso8601String(),
//         "updated_at": updatedAt?.toIso8601String(),
//         "image_alt_text": imageAltText,
//       };
// }

// class Videos {
//   Videos({
//     this.list,
//     this.baseUrl,
//   });

//   List<VideosList>? list;
//   String? baseUrl;

//   factory Videos.fromJson(Map<String, dynamic> json) => Videos(
//         list: json["list"] == null
//             ? null
//             : List<VideosList>.from(json["list"].map((x) => VideosList.fromJson(x))),
//         baseUrl: json["base_url"],
//       );

//   Map<String, dynamic> toJson() => {
//         "list": list == null ? null : List<dynamic>.from(list!.map((x) => x.toJson())),
//         "base_url": baseUrl,
//       };
// }

// class VideosList {
//   VideosList({
//     this.id,
//     this.title,
//     this.description,
//     this.videoUrl,
//     this.status,
//     this.createdAt,
//     this.updatedAt,
//   });

//   String? id;
//   String? title;
//   String? description;
//   String? videoUrl;
//   String? status;
//   DateTime? createdAt;
//   DateTime? updatedAt;

//   factory VideosList.fromJson(Map<String, dynamic> json) => VideosList(
//         id: json["id"],
//         title: json["title"],
//         description: json["description"],
//         videoUrl: json["video_url"],
//         status: json["status"],
//         createdAt: json["created_at"] == null ? null : DateTime.parse(json["created_at"]),
//         updatedAt: json["updated_at"] == null ? null : DateTime.parse(json["updated_at"]),
//       );

//   Map<String, dynamic> toJson() => {
//         "id": id,
//         "title": title,
//         "description": description,
//         "video_url": videoUrl,
//         "status": status,
//         "created_at": createdAt?.toIso8601String(),
//         "updated_at": updatedAt?.toIso8601String(),
//       };
// }

// class RightArea {
//   RightArea({
//     this.media,
//     this.latestUpdates,
//     this.testimonial,
//   });

//   DigitalLibrary? media;
//   Testimonial? latestUpdates;
//   Testimonial? testimonial;

//   factory RightArea.fromJson(Map<String, dynamic> json) => RightArea(
//         media: json["media"] == null ? null : DigitalLibrary.fromJson(json["media"]),
//         latestUpdates: json["latest_updates"] == null
//             ? null
//             : Testimonial.fromJson(json["latest_updates"]),
//         testimonial: json["testimonial"] == null
//             ? null
//             : Testimonial.fromJson(json["testimonial"]),
//       );

//   Map<String, dynamic> toJson() => {
//         "media": media?.toJson(),
//         "latest_updates": latestUpdates?.toJson(),
//         "testimonial": testimonial?.toJson(),
//       };
// }

// class EnumValues<T> {
//   Map<String, T> map;
//   late Map<T, String> reverseMap;

//   EnumValues(this.map);

//   Map<T, String> get reverse {
//     reverseMap = map.map((k, v) => MapEntry(v, k));
//     return reverseMap;
//   }
// }

// To parse this JSON data, do
//
//     final mmtmMainResponse = mmtmMainResponseFromJson(jsonString);

import 'dart:convert';

MmtmMainResponse mmtmMainResponseFromJson(String str) =>
    MmtmMainResponse.fromJson(json.decode(str));

String mmtmMainResponseToJson(MmtmMainResponse data) =>
    json.encode(data.toJson());

class MmtmMainResponse {
  MmtmMainResponse({
    this.middleArea,
    this.bottomArea,
    this.sliderArea,
    this.rightArea,
  });

  Map<String, MiddleArea>? middleArea;
  Map<String, BottomArea>? bottomArea;
  List<SliderArea>? sliderArea;
  Map<String, RightArea>? rightArea;

  factory MmtmMainResponse.fromJson(Map<String, dynamic> json) =>
      MmtmMainResponse(
        middleArea: Map.from(json["middle_area"]).map(
            (k, v) => MapEntry<String, MiddleArea>(k, MiddleArea.fromJson(v))),
        bottomArea: Map.from(json["bottom_area"]).map(
            (k, v) => MapEntry<String, BottomArea>(k, BottomArea.fromJson(v))),
        sliderArea: List<SliderArea>.from(
            json["slider_area"].map((x) => SliderArea.fromJson(x))),
        rightArea: Map.from(json["Right_area"]).map(
            (k, v) => MapEntry<String, RightArea>(k, RightArea.fromJson(v))),
      );

  Map<String, dynamic> toJson() => {
        "middle_area": Map.from(middleArea!)
            .map((k, v) => MapEntry<String, dynamic>(k, v.toJson())),
        "bottom_area": Map.from(bottomArea!)
            .map((k, v) => MapEntry<String, dynamic>(k, v.toJson())),
        "slider_area": List<dynamic>.from(sliderArea!.map((x) => x.toJson())),
        "Right_area": Map.from(rightArea!)
            .map((k, v) => MapEntry<String, dynamic>(k, v.toJson())),
      };
}

class BottomArea {
  BottomArea({
    this.media,
    this.testimonial,
  });

  DigitalLibrary? media;
  Testimonial? testimonial;

  factory BottomArea.fromJson(Map<String, dynamic> json) => BottomArea(
        media: json["media"] == null
            ? null
            : DigitalLibrary.fromJson(json["media"]),
        testimonial: json["testimonial"] == null
            ? null
            : Testimonial.fromJson(json["testimonial"]),
      );

  Map<String, dynamic> toJson() => {
        "media": media == null ? null : media!.toJson(),
        "testimonial": testimonial == null ? null : testimonial!.toJson(),
      };
}

class DigitalLibrary {
  DigitalLibrary({
    this.list,
    this.baseUrl,
    this.pdfUrl,
  });

  List<DigitalLibraryList>? list;
  dynamic baseUrl;
   dynamic pdfUrl;

  factory DigitalLibrary.fromJson(Map<String, dynamic> json) => DigitalLibrary(
        list: List<DigitalLibraryList>.from(
            json["list"].map((x) => DigitalLibraryList.fromJson(x))),
        baseUrl: json["base_url"],
        pdfUrl: json["pdf_url"],
      );

  Map<String, dynamic> toJson() => {
        "list": List<dynamic>.from(list!.map((x) => x.toJson())),
        "base_url": baseUrl,
         "pdf_url": pdfUrl,
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
    this.description,
    this.mediaUrl,
  });

  dynamic id;
  dynamic categoryType;
  dynamic title;
  dynamic image;
  dynamic altText;
  dynamic document;
  dynamic status;
  dynamic createdAt;
  dynamic updatedAt;
  dynamic description;
  dynamic mediaUrl;

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
        "created_at":createdAt,
        "updated_at": updatedAt,
        "description": description == null ? null : description,
        "media_url": mediaUrl == null ? null : mediaUrl,
      };
}

class Testimonial {
  Testimonial({
    this.list,
    this.baseUrl,
  });

  List<TestimonialList>? list;
  dynamic baseUrl;

  factory Testimonial.fromJson(Map<String, dynamic> json) => Testimonial(
        list: List<TestimonialList>.from(
            json["list"].map((x) => TestimonialList.fromJson(x))),
        baseUrl: json["base_url"],
      );

  Map<String, dynamic> toJson() => {
        "list": List<dynamic>.from(list!.map((x) => x.toJson())),
        "base_url": baseUrl,
      };
}

class TestimonialList {
  TestimonialList({
    this.id,
    this.testimonialName,
    this.departmentName,
    this.shortDescription,
    this.details,
    this.detailPageUrl,
    this.image,
    this.altText,
    this.metaKeyword,
    this.metaDescription,
    this.status,
    this.createdAt,
    this.updatedAt,
    this.articleType,
    this.title,
    this.altTag,
  });

  dynamic id;
  dynamic testimonialName;
  dynamic departmentName;
  dynamic shortDescription;
  dynamic details;
  dynamic detailPageUrl;
  dynamic image;
  dynamic altText;
  dynamic metaKeyword;
  dynamic metaDescription;
  dynamic status;
  DateTime? createdAt;
  DateTime? updatedAt;
  dynamic articleType;
  dynamic title;
  dynamic altTag;

  factory TestimonialList.fromJson(Map<String, dynamic> json) =>
      TestimonialList(
        id: json["id"],
        testimonialName:
            json["testimonial_name"] == null ? null : json["testimonial_name"],
        departmentName:
            json["department_name"] == null ? null : json["department_name"],
        shortDescription: json["short_description"],
        details: json["details"],
        detailPageUrl: json["detail_page_url"],
        image: json["image"],
        altText: json["alt_text"] == null ? null : json["alt_text"],
        metaKeyword: json["meta_keyword"],
        metaDescription: json["meta_description"],
        status: json["status"],
        createdAt: DateTime.parse(json["created_at"]),
        updatedAt: DateTime.parse(json["updated_at"]),
        articleType: json["article_type"] == null ? null : json["article_type"],
        title: json["title"] == null ? null : json["title"],
        altTag: json["alt_tag"] == null ? null : json["alt_tag"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "testimonial_name": testimonialName == null ? null : testimonialName,
        "department_name": departmentName == null ? null : departmentName,
        "short_description": shortDescription,
        "details": details,
        "detail_page_url": detailPageUrl,
        "image": image,
        "alt_text": altText == null ? null : altText,
        "meta_keyword": metaKeyword,
        "meta_description": metaDescription,
        "status": status,
        "created_at": createdAt!.toIso8601String(),
        "updated_at": updatedAt!.toIso8601String(),
        "article_type": articleType == null ? null : articleType,
        "title": title == null ? null : title,
        "alt_tag": altTag == null ? null : altTag,
      };
}

class MiddleArea {
  MiddleArea({
    this.content,
    this.videos,
    this.gallery,
    this.latestUpdates,
  });

  Content? content;
  Videos? videos;
  Mmtm? gallery;
  Testimonial? latestUpdates;

  factory MiddleArea.fromJson(Map<String, dynamic> json) => MiddleArea(
        content:
            json["content"] == null ? null : Content.fromJson(json["content"]),
        videos: json["videos"] == null ? null : Videos.fromJson(json["videos"]),
        gallery:
            json["gallery"] == null ? null : Mmtm.fromJson(json["gallery"]),
        latestUpdates: json["latest_updates"] == null
            ? null
            : Testimonial.fromJson(json["latest_updates"]),
      );

  Map<String, dynamic> toJson() => {
        "content": content == null ? null : content!.toJson(),
        "videos": videos == null ? null : videos!.toJson(),
        "gallery": gallery == null ? null : gallery!.toJson(),
        "latest_updates": latestUpdates == null ? null : latestUpdates!.toJson(),
      };
}

class Content {
  Content({
    this.list,
    this.baseUrl,
  });

  List<ContentList>? list;
  dynamic baseUrl;

  factory Content.fromJson(Map<String, dynamic> json) => Content(
        list: List<ContentList>.from(
            json["list"].map((x) => ContentList.fromJson(x))),
        baseUrl: json["base_url"],
      );

  Map<String, dynamic> toJson() => {
        "list": List<dynamic>.from(list!.map((x) => x.toJson())),
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

  dynamic id;
  dynamic contentType;
  dynamic pageContent;
  dynamic title;
  dynamic shortDescription;
  dynamic image;
  dynamic altText;
  dynamic url;
  dynamic utubeUrl;
  dynamic metaKeyword;
  dynamic metaDescription;
  dynamic status;
  DateTime? createdAt;
  DateTime? updatedAt;

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
        "created_at": createdAt!.toIso8601String(),
        "updated_at": updatedAt!.toIso8601String(),
      };
}

class Mmtm {
  Mmtm({
    this.list,
    this.baseUrl,
  });

  List<MmtmList>? list;
  dynamic baseUrl;

  factory Mmtm.fromJson(Map<String, dynamic> json) => Mmtm(
        list:
            List<MmtmList>.from(json["list"].map((x) => MmtmList.fromJson(x))),
        baseUrl: json["base_url"],
      );

  Map<String, dynamic> toJson() => {
        "list": List<dynamic>.from(list!.map((x) => x.toJson())),
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

  dynamic id;
  dynamic photo;
  dynamic photoCategoryId;
  dynamic albumNameId;
  dynamic photoDescription;
  dynamic altTag;
  dynamic year;
  dynamic featuredImage;
  dynamic status;
  dynamic createdAt;
  dynamic updatedAt;
  dynamic position;

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
        createdAt:json["created_at"],
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
        "created_at":createdAt,
        "updated_at": updatedAt,
        "position": position == null ? null : position,
      };
}

class Videos {
  Videos({
    this.list,
  });

  List<VideosList>? list;

  factory Videos.fromJson(Map<String, dynamic> json) => Videos(
        list: List<VideosList>.from(
            json["list"].map((x) => VideosList.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "list": List<dynamic>.from(list!.map((x) => x.toJson())),
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

  dynamic id;
  dynamic videoLink;
  dynamic videoDesc;
  dynamic countryId;
  dynamic categoryId;
  dynamic year;
  dynamic status;
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

class RightArea {
  RightArea({
    this.callForApp,
    this.mmtm,
    this.digitalLibrary,
  });

  CallForApp? callForApp;
  Mmtm? mmtm;
  DigitalLibrary? digitalLibrary;

  factory RightArea.fromJson(Map<String, dynamic> json) => RightArea(
        callForApp: json["call_for_app"] == null
            ? null
            : CallForApp.fromJson(json["call_for_app"]),
        mmtm: json["mmtm"] == null ? null : Mmtm.fromJson(json["mmtm"]),
        digitalLibrary: json["digital_library"] == null
            ? null
            : DigitalLibrary.fromJson(json["digital_library"]),
      );

  Map<String, dynamic> toJson() => {
        "call_for_app": callForApp == null ? null : callForApp!.toJson(),
        "mmtm": mmtm == null ? null : mmtm!.toJson(),
        "digital_library":
            digitalLibrary == null ? null : digitalLibrary!.toJson(),
      };
}

class CallForApp {
    List<CallForAppList>? list;
    dynamic baseUrl;
    dynamic pdfUrl;

    CallForApp({
        this.list,
        this.baseUrl,
        this.pdfUrl,
    });

    factory CallForApp.fromJson(Map<String, dynamic> json) => CallForApp(
        list: List<CallForAppList>.from(json["list"].map((x) => CallForAppList.fromJson(x))),
        baseUrl: json["base_url"],
        pdfUrl: json["pdf_url"],
    );

    Map<String, dynamic> toJson() => {
        "list": List<dynamic>.from(list!.map((x) => x.toJson())),
        "base_url": baseUrl,
        "pdf_url": pdfUrl,
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

  dynamic id;
  dynamic title;
  dynamic eventType;
  DateTime? eventStartDate;
  DateTime? eventEndDate;
  dynamic pdfFile;
  dynamic appImg;
  dynamic altText;
  dynamic status;
  dynamic createdAt;
  dynamic updatedAt;

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
        createdAt:json["created_at"],
        updatedAt:json["updated_at"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "title": title,
        "event_type": eventType,
        "event_start_date":
            "${eventStartDate!.year.toString().padLeft(4, '0')}-${eventStartDate!.month.toString().padLeft(2, '0')}-${eventStartDate!.day.toString().padLeft(2, '0')}",
        "event_end_date":
            "${eventEndDate!.year.toString().padLeft(4, '0')}-${eventEndDate!.month.toString().padLeft(2, '0')}-${eventEndDate!.day.toString().padLeft(2, '0')}",
        "pdf_file": pdfFile,
        "app_img": appImg,
        "alt_text": altText,
        "status": status,
        "created_at": createdAt,
        "updated_at": updatedAt,
      };
}

class SliderArea {
  SliderArea({
    this.slider,
  });

  Slider? slider;

  factory SliderArea.fromJson(Map<String, dynamic> json) => SliderArea(
        slider: Slider.fromJson(json["slider"]),
      );

  Map<String, dynamic> toJson() => {
        "slider": slider!.toJson(),
      };
}

class Slider {
  Slider({
    this.list,
    this.baseUrl,
  });

  List<SliderList>? list;
  dynamic baseUrl;

  factory Slider.fromJson(Map<String, dynamic> json) => Slider(
        list: List<SliderList>.from(
            json["list"].map((x) => SliderList.fromJson(x))),
        baseUrl: json["base_url"],
      );

  Map<String, dynamic> toJson() => {
        "list": List<dynamic>.from(list!.map((x) => x.toJson())),
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

  dynamic id;
  dynamic menuId;
  dynamic imageTitle;
  dynamic imageDesc;
  dynamic links;
  dynamic image;
  dynamic altText;
  dynamic status;
  DateTime? createdAt;
  DateTime? updatedAt;

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
        "created_at": createdAt!.toIso8601String(),
        "updated_at": updatedAt!.toIso8601String(),
      };
}

