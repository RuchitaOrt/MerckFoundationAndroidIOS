import 'dart:convert';

CancersubprogramcommunityawaremnessResponse
    cancersubprogramcommunityawaremnessResponseFromJson(String str) =>
        CancersubprogramcommunityawaremnessResponse.fromJson(json.decode(str));

String cancersubprogramcommunityawaremnessResponseToJson(
        CancersubprogramcommunityawaremnessResponse data) =>
    json.encode(data.toJson());

class CancersubprogramcommunityawaremnessResponse {
  CancersubprogramcommunityawaremnessResponse({
    this.middleArea,
    this.sliderArea,
  });

  Map<String, MiddleArea>? middleArea;
  List<SliderArea>? sliderArea;

  factory CancersubprogramcommunityawaremnessResponse.fromJson(
          Map<String, dynamic> json) =>
      CancersubprogramcommunityawaremnessResponse(
        middleArea: json["middle_area"] != null
            ? Map.from(json["middle_area"]).map(
                (k, v) => MapEntry(k, MiddleArea.fromJson(v)),
              )
            : null,
        sliderArea: json["slider_area"] != null
            ? List<SliderArea>.from(
                json["slider_area"].map((x) => SliderArea.fromJson(x)))
            : null,
      );

  Map<String, dynamic> toJson() => {
        "middle_area": middleArea?.map((k, v) => MapEntry(k, v.toJson())),
        "slider_area": sliderArea?.map((x) => x.toJson()).toList(),
      };
}

class MiddleArea {
  MiddleArea({
    this.content,
    this.videos,
  });

  Content? content;
  Videos? videos;

  factory MiddleArea.fromJson(Map<String, dynamic> json) => MiddleArea(
        content:
            json["content"] != null ? Content.fromJson(json["content"]) : null,
        videos:
            json["videos"] != null ? Videos.fromJson(json["videos"]) : null,
      );

  Map<String, dynamic> toJson() => {
        "content": content?.toJson(),
        "videos": videos?.toJson(),
      };
}

class Content {
  Content({
    this.list,
    this.baseUrl,
  });

  List<ContentList>? list;
  String? baseUrl;

  factory Content.fromJson(Map<String, dynamic> json) => Content(
        list: json["list"] != null
            ? List<ContentList>.from(
                json["list"].map((x) => ContentList.fromJson(x)))
            : null,
        baseUrl: json["base_url"],
      );

  Map<String, dynamic> toJson() => {
        "list": list?.map((x) => x.toJson()).toList(),
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

  String? id;
  String? contentType;
  String? pageContent;
  String? title;
  String? shortDescription;
  dynamic image;
  String? altText;
  String? url;
  String? utubeUrl;
  String? metaKeyword;
  String? metaDescription;
  String? status;
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
        createdAt: json["created_at"] != null
            ? DateTime.tryParse(json["created_at"])
            : null,
        updatedAt: json["updated_at"] != null
            ? DateTime.tryParse(json["updated_at"])
            : null,
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
        "created_at": createdAt?.toIso8601String(),
        "updated_at": updatedAt?.toIso8601String(),
      };
}

class Videos {
  Videos({
    this.list,
  });

  List<VideosList>? list;

  factory Videos.fromJson(Map<String, dynamic> json) => Videos(
        list: json["list"] != null
            ? List<VideosList>.from(
                json["list"].map((x) => VideosList.fromJson(x)))
            : null,
      );

  Map<String, dynamic> toJson() => {
        "list": list?.map((x) => x.toJson()).toList(),
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

  String? id;
  String? videoLink;
  String? videoDesc;
  String? countryId;
  String? categoryId;
  String? year;
  String? status;
  DateTime? createdAt;
  DateTime? updatedAt;

  factory VideosList.fromJson(Map<String, dynamic> json) => VideosList(
        id: json["id"],
        videoLink: json["video_link"],
        videoDesc: json["video_desc"],
        countryId: json["country_id"],
        categoryId: json["category_id"],
        year: json["year"],
        status: json["status"],
        createdAt: json["created_at"] != null
            ? DateTime.tryParse(json["created_at"])
            : null,
        updatedAt: json["updated_at"] != null
            ? DateTime.tryParse(json["updated_at"])
            : null,
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "video_link": videoLink,
        "video_desc": videoDesc,
        "country_id": countryId,
        "category_id": categoryId,
        "year": year,
        "status": status,
        "created_at": createdAt?.toIso8601String(),
        "updated_at": updatedAt?.toIso8601String(),
      };
}

class SliderArea {
  SliderArea({
    this.slider,
  });

  Slider? slider;

  factory SliderArea.fromJson(Map<String, dynamic> json) => SliderArea(
        slider:
            json["slider"] != null ? Slider.fromJson(json["slider"]) : null,
      );

  Map<String, dynamic> toJson() => {
        "slider": slider?.toJson(),
      };
}

class Slider {
  Slider({
    this.list,
    this.baseUrl,
  });

  List<SliderList>? list;
  String? baseUrl;

  factory Slider.fromJson(Map<String, dynamic> json) => Slider(
        list: json["list"] != null
            ? List<SliderList>.from(
                json["list"].map((x) => SliderList.fromJson(x)))
            : null,
        baseUrl: json["base_url"],
      );

  Map<String, dynamic> toJson() => {
        "list": list?.map((x) => x.toJson()).toList(),
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

  String? id;
  String? menuId;
  String? imageTitle;
  String? imageDesc;
  String? links;
  String? image;
  String? altText;
  String? status;
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
        createdAt: json["created_at"] != null
            ? DateTime.tryParse(json["created_at"])
            : null,
        updatedAt: json["updated_at"] != null
            ? DateTime.tryParse(json["updated_at"])
            : null,
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
        "created_at": createdAt?.toIso8601String(),
        "updated_at": updatedAt?.toIso8601String(),
  };
}

// // To parse this JSON data, do
// //
// //     final cancersubprogramcommunityawaremnessResponse = cancersubprogramcommunityawaremnessResponseFromJson(jsonString);

// import 'dart:convert';

// CancersubprogramcommunityawaremnessResponse
//     cancersubprogramcommunityawaremnessResponseFromJson(String str) =>
//         CancersubprogramcommunityawaremnessResponse.fromJson(json.decode(str));

// String cancersubprogramcommunityawaremnessResponseToJson(
//         CancersubprogramcommunityawaremnessResponse data) =>
//     json.encode(data.toJson());

// class CancersubprogramcommunityawaremnessResponse {
//   CancersubprogramcommunityawaremnessResponse({
//     this.middleArea,
//     this.sliderArea,
//   });

//   Map<String, MiddleArea> middleArea;
//   List<SliderArea> sliderArea;

//   factory CancersubprogramcommunityawaremnessResponse.fromJson(
//           Map<String, dynamic> json) =>
//       CancersubprogramcommunityawaremnessResponse(
//         middleArea: Map.from(json["middle_area"]).map(
//             (k, v) => MapEntry<String, MiddleArea>(k, MiddleArea.fromJson(v))),
//         sliderArea: List<SliderArea>.from(
//             json["slider_area"].map((x) => SliderArea.fromJson(x))),
//       );

//   Map<String, dynamic> toJson() => {
//         "middle_area": Map.from(middleArea)
//             .map((k, v) => MapEntry<String, dynamic>(k, v.toJson())),
//         "slider_area": List<dynamic>.from(sliderArea.map((x) => x.toJson())),
//       };
// }

// class MiddleArea {
//   MiddleArea({
//     this.content,
//     this.videos,
//   });

//   Content content;
//   Videos videos;

//   factory MiddleArea.fromJson(Map<String, dynamic> json) => MiddleArea(
//         content:
//             json["content"] == null ? null : Content.fromJson(json["content"]),
//         videos: json["videos"] == null ? null : Videos.fromJson(json["videos"]),
//       );

//   Map<String, dynamic> toJson() => {
//         "content": content == null ? null : content.toJson(),
//         "videos": videos == null ? null : videos.toJson(),
//       };
// }

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
//   DateTime createdAt;
//   DateTime updatedAt;

//   factory VideosList.fromJson(Map<String, dynamic> json) => VideosList(
//         id: json["id"],
//         videoLink: json["video_link"],
//         videoDesc: json["video_desc"],
//         countryId: json["country_id"],
//         categoryId: json["category_id"],
//         year: json["year"],
//         status: json["status"],
//         createdAt: DateTime.parse(json["created_at"]),
//         updatedAt: DateTime.parse(json["updated_at"]),
//       );

//   Map<String, dynamic> toJson() => {
//         "id": id,
//         "video_link": videoLink,
//         "video_desc": videoDesc,
//         "country_id": countryId,
//         "category_id": categoryId,
//         "year": year,
//         "status": status,
//         "created_at": createdAt.toIso8601String(),
//         "updated_at": updatedAt.toIso8601String(),
//       };
// }

// class SliderArea {
//   SliderArea({
//     this.slider,
//   });

//   Slider slider;

//   factory SliderArea.fromJson(Map<String, dynamic> json) => SliderArea(
//         slider: Slider.fromJson(json["slider"]),
//       );

//   Map<String, dynamic> toJson() => {
//         "slider": slider.toJson(),
//       };
// }

// class Slider {
//   Slider({
//     this.list,
//     this.baseUrl,
//   });

//   List<SliderList> list;
//   String baseUrl;

//   factory Slider.fromJson(Map<String, dynamic> json) => Slider(
//         list: List<SliderList>.from(
//             json["list"].map((x) => SliderList.fromJson(x))),
//         baseUrl: json["base_url"],
//       );

//   Map<String, dynamic> toJson() => {
//         "list": List<dynamic>.from(list.map((x) => x.toJson())),
//         "base_url": baseUrl,
//       };
// }

// class SliderList {
//   SliderList({
//     this.id,
//     this.menuId,
//     this.imageTitle,
//     this.imageDesc,
//     this.links,
//     this.image,
//     this.altText,
//     this.status,
//     this.createdAt,
//     this.updatedAt,
//   });

//   String id;
//   String menuId;
//   String imageTitle;
//   String imageDesc;
//   String links;
//   String image;
//   String altText;
//   String status;
//   DateTime createdAt;
//   DateTime updatedAt;

//   factory SliderList.fromJson(Map<String, dynamic> json) => SliderList(
//         id: json["id"],
//         menuId: json["menu_id"],
//         imageTitle: json["image_title"],
//         imageDesc: json["image_desc"],
//         links: json["links"],
//         image: json["image"],
//         altText: json["alt_text"],
//         status: json["status"],
//         createdAt: DateTime.parse(json["created_at"]),
//         updatedAt: DateTime.parse(json["updated_at"]),
//       );

//   Map<String, dynamic> toJson() => {
//         "id": id,
//         "menu_id": menuId,
//         "image_title": imageTitle,
//         "image_desc": imageDesc,
//         "links": links,
//         "image": image,
//         "alt_text": altText,
//         "status": status,
//         "created_at": createdAt.toIso8601String(),
//         "updated_at": updatedAt.toIso8601String(),
//       };
// }

// // // To parse this JSON data, do
// // //
// // //     final cancersubprogramcommunityawaremnessResponse = cancersubprogramcommunityawaremnessResponseFromJson(jsonString);

// // import 'dart:convert';

// // CancersubprogramcommunityawaremnessResponse
// //     cancersubprogramcommunityawaremnessResponseFromJson(String str) =>
// //         CancersubprogramcommunityawaremnessResponse.fromJson(json.decode(str));

// // String cancersubprogramcommunityawaremnessResponseToJson(
// //         CancersubprogramcommunityawaremnessResponse data) =>
// //     json.encode(data.toJson());

// // class CancersubprogramcommunityawaremnessResponse {
// //   CancersubprogramcommunityawaremnessResponse({
// //     this.middleArea,
// //   });

// //   Map<String, MiddleArea> middleArea;

// //   factory CancersubprogramcommunityawaremnessResponse.fromJson(
// //           Map<String, dynamic> json) =>
// //       CancersubprogramcommunityawaremnessResponse(
// //         middleArea: Map.from(json["middle_area"]).map(
// //             (k, v) => MapEntry<String, MiddleArea>(k, MiddleArea.fromJson(v))),
// //       );

// //   Map<String, dynamic> toJson() => {
// //         "middle_area": Map.from(middleArea)
// //             .map((k, v) => MapEntry<String, dynamic>(k, v.toJson())),
// //       };
// // }

// // class MiddleArea {
// //   MiddleArea({
// //     this.content,
// //     this.videos,
// //   });

// //   Content content;
// //   Videos videos;

// //   factory MiddleArea.fromJson(Map<String, dynamic> json) => MiddleArea(
// //         content:
// //             json["content"] == null ? null : Content.fromJson(json["content"]),
// //         videos: json["videos"] == null ? null : Videos.fromJson(json["videos"]),
// //       );

// //   Map<String, dynamic> toJson() => {
// //         "content": content == null ? null : content.toJson(),
// //         "videos": videos == null ? null : videos.toJson(),
// //       };
// // }

// // class Content {
// //   Content({
// //     this.list,
// //     this.baseUrl,
// //   });

// //   List<ContentList> list;
// //   String baseUrl;

// //   factory Content.fromJson(Map<String, dynamic> json) => Content(
// //         list: List<ContentList>.from(
// //             json["list"].map((x) => ContentList.fromJson(x))),
// //         baseUrl: json["base_url"],
// //       );

// //   Map<String, dynamic> toJson() => {
// //         "list": List<dynamic>.from(list.map((x) => x.toJson())),
// //         "base_url": baseUrl,
// //       };
// // }

// // class ContentList {
// //   ContentList({
// //     this.id,
// //     this.contentType,
// //     this.pageContent,
// //     this.title,
// //     this.shortDescription,
// //     this.image,
// //     this.altText,
// //     this.url,
// //     this.utubeUrl,
// //     this.metaKeyword,
// //     this.metaDescription,
// //     this.status,
// //     this.createdAt,
// //     this.updatedAt,
// //   });

// //   String id;
// //   String contentType;
// //   String pageContent;
// //   String title;
// //   String shortDescription;
// //   dynamic image;
// //   String altText;
// //   String url;
// //   String utubeUrl;
// //   String metaKeyword;
// //   String metaDescription;
// //   String status;
// //   DateTime createdAt;
// //   DateTime updatedAt;

// //   factory ContentList.fromJson(Map<String, dynamic> json) => ContentList(
// //         id: json["id"],
// //         contentType: json["content_type"],
// //         pageContent: json["page_content"],
// //         title: json["title"],
// //         shortDescription: json["short_description"],
// //         image: json["image"],
// //         altText: json["alt_text"],
// //         url: json["url"],
// //         utubeUrl: json["utube_url"],
// //         metaKeyword: json["meta_keyword"],
// //         metaDescription: json["meta_description"],
// //         status: json["status"],
// //         createdAt: DateTime.parse(json["created_at"]),
// //         updatedAt: DateTime.parse(json["updated_at"]),
// //       );

// //   Map<String, dynamic> toJson() => {
// //         "id": id,
// //         "content_type": contentType,
// //         "page_content": pageContent,
// //         "title": title,
// //         "short_description": shortDescription,
// //         "image": image,
// //         "alt_text": altText,
// //         "url": url,
// //         "utube_url": utubeUrl,
// //         "meta_keyword": metaKeyword,
// //         "meta_description": metaDescription,
// //         "status": status,
// //         "created_at": createdAt.toIso8601String(),
// //         "updated_at": updatedAt.toIso8601String(),
// //       };
// // }

// // class Videos {
// //   Videos({
// //     this.list,
// //   });

// //   List<VideosList> list;

// //   factory Videos.fromJson(Map<String, dynamic> json) => Videos(
// //         list: List<VideosList>.from(
// //             json["list"].map((x) => VideosList.fromJson(x))),
// //       );

// //   Map<String, dynamic> toJson() => {
// //         "list": List<dynamic>.from(list.map((x) => x.toJson())),
// //       };
// // }

// // class VideosList {
// //   VideosList({
// //     this.id,
// //     this.videoLink,
// //     this.videoDesc,
// //     this.countryId,
// //     this.categoryId,
// //     this.year,
// //     this.status,
// //     this.createdAt,
// //     this.updatedAt,
// //   });

// //   String id;
// //   String videoLink;
// //   String videoDesc;
// //   String countryId;
// //   String categoryId;
// //   String year;
// //   String status;
// //   DateTime createdAt;
// //   DateTime updatedAt;

// //   factory VideosList.fromJson(Map<String, dynamic> json) => VideosList(
// //         id: json["id"],
// //         videoLink: json["video_link"],
// //         videoDesc: json["video_desc"],
// //         countryId: json["country_id"],
// //         categoryId: json["category_id"],
// //         year: json["year"],
// //         status: json["status"],
// //         createdAt: DateTime.parse(json["created_at"]),
// //         updatedAt: DateTime.parse(json["updated_at"]),
// //       );

// //   Map<String, dynamic> toJson() => {
// //         "id": id,
// //         "video_link": videoLink,
// //         "video_desc": videoDesc,
// //         "country_id": countryId,
// //         "category_id": categoryId,
// //         "year": year,
// //         "status": status,
// //         "created_at": createdAt.toIso8601String(),
// //         "updated_at": updatedAt.toIso8601String(),
// //       };
// // }
