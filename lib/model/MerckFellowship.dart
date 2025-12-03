import 'dart:convert';

MerckFellowshipResponse merckFellowshipResponseFromJson(String str) =>
    MerckFellowshipResponse.fromJson(json.decode(str));

String merckFellowshipResponseToJson(MerckFellowshipResponse data) =>
    json.encode(data.toJson());

class MerckFellowshipResponse {
  MerckFellowshipResponse({
    required this.middleArea,
    required this.sliderArea,
  });

  Map<String, MiddleArea> middleArea;
  List<SliderArea> sliderArea;

  factory MerckFellowshipResponse.fromJson(Map<String, dynamic> json) =>
      MerckFellowshipResponse(
        middleArea: json["middle_area"] == null
            ? {}
            : Map.from(json["middle_area"]).map(
                (k, v) => MapEntry<String, MiddleArea>(
                    k, MiddleArea.fromJson(v ?? {}))),
        sliderArea: json["slider_area"] == null
            ? []
            : List<SliderArea>.from(
                json["slider_area"].map((x) => SliderArea.fromJson(x ?? {}))),
      );

  Map<String, dynamic> toJson() => {
        "middle_area": middleArea.isEmpty
            ? null
            : Map.from(middleArea)
                .map((k, v) => MapEntry<String, dynamic>(k, v.toJson())),
        "slider_area": sliderArea.isEmpty
            ? null
            : List<dynamic>.from(sliderArea.map((x) => x.toJson())),
      };
}

class MiddleArea {
  MiddleArea({
    required this.content,
    required this.videos,
    required this.testimonial,
  });

  Content? content;
  Videos? videos;
  Testimonial? testimonial;

  factory MiddleArea.fromJson(Map<String, dynamic> json) => MiddleArea(
        content: json["content"] == null
            ? null
            : Content.fromJson(json["content"]),
        videos: json["videos"] == null ? null : Videos.fromJson(json["videos"]),
        testimonial: json["testimonial"] == null
            ? null
            : Testimonial.fromJson(json["testimonial"]),
      );

  Map<String, dynamic> toJson() => {
        "content": content?.toJson(),
        "videos": videos?.toJson(),
        "testimonial": testimonial?.toJson(),
      };
}

class Content {
  Content({
    required this.list,
    required this.baseUrl,
  });

  List<ContentList> list;
  String baseUrl;

  factory Content.fromJson(Map<String, dynamic> json) => Content(
        list: json["list"] == null
            ? []
            : List<ContentList>.from(
                json["list"].map((x) => ContentList.fromJson(x ?? {}))),
        baseUrl: json["base_url"] ?? '',
      );

  Map<String, dynamic> toJson() => {
        "list": List<dynamic>.from(list.map((x) => x.toJson())),
        "base_url": baseUrl,
      };
}

class ContentList {
  ContentList({
    required this.id,
    required this.contentType,
    required this.pageContent,
    required this.title,
    required this.shortDescription,
    this.image,
    required this.altText,
    required this.url,
    required this.utubeUrl,
    required this.metaKeyword,
    required this.metaDescription,
    required this.status,
    required this.createdAt,
    required this.updatedAt,
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
        id: json["id"] ?? '',
        contentType: json["content_type"] ?? '',
        pageContent: json["page_content"] ?? '',
        title: json["title"] ?? '',
        shortDescription: json["short_description"] ?? '',
        image: json["image"],
        altText: json["alt_text"] ?? '',
        url: json["url"] ?? '',
        utubeUrl: json["utube_url"] ?? '',
        metaKeyword: json["meta_keyword"] ?? '',
        metaDescription: json["meta_description"] ?? '',
        status: json["status"] ?? '',
        createdAt: json["created_at"] == null
            ? DateTime.now()
            : DateTime.parse(json["created_at"]),
        updatedAt: json["updated_at"] == null
            ? DateTime.now()
            : DateTime.parse(json["updated_at"]),
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

class Testimonial {
  Testimonial({
    required this.list,
    required this.baseUrl,
  });

  List<TestimonialList> list;
  String baseUrl;

  factory Testimonial.fromJson(Map<String, dynamic> json) => Testimonial(
        list: json["list"] == null
            ? []
            : List<TestimonialList>.from(
                json["list"].map((x) => TestimonialList.fromJson(x ?? {}))),
        baseUrl: json["base_url"] ?? '',
      );

  Map<String, dynamic> toJson() => {
        "list": List<dynamic>.from(list.map((x) => x.toJson())),
        "base_url": baseUrl,
      };
}

class TestimonialList {
  TestimonialList({
    required this.id,
    required this.testimonialName,
    required this.departmentName,
    required this.shortDescription,
    required this.details,
    required this.detailPageUrl,
    required this.image,
    required this.altText,
    required this.metaKeyword,
    required this.metaDescription,
    required this.status,
    required this.createdAt,
    required this.updatedAt,
  });

  String id;
  String testimonialName;
  String departmentName;
  String shortDescription;
  String details;
  String detailPageUrl;
  String image;
  String altText;
  String metaKeyword;
  String metaDescription;
  String status;
  DateTime createdAt;
  DateTime updatedAt;

  factory TestimonialList.fromJson(Map<String, dynamic> json) => TestimonialList(
        id: json["id"] ?? '',
        testimonialName: json["testimonial_name"] ?? '',
        departmentName: json["department_name"] ?? '',
        shortDescription: json["short_description"] ?? '',
        details: json["details"] ?? '',
        detailPageUrl: json["detail_page_url"] ?? '',
        image: json["image"] ?? '',
        altText: json["alt_text"] ?? '',
        metaKeyword: json["meta_keyword"] ?? '',
        metaDescription: json["meta_description"] ?? '',
        status: json["status"] ?? '',
        createdAt: json["created_at"] == null
            ? DateTime.now()
            : DateTime.parse(json["created_at"]),
        updatedAt: json["updated_at"] == null
            ? DateTime.now()
            : DateTime.parse(json["updated_at"]),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "testimonial_name": testimonialName,
        "department_name": departmentName,
        "short_description": shortDescription,
        "details": details,
        "detail_page_url": detailPageUrl,
        "image": image,
        "alt_text": altText,
        "meta_keyword": metaKeyword,
        "meta_description": metaDescription,
        "status": status,
        "created_at": createdAt.toIso8601String(),
        "updated_at": updatedAt.toIso8601String(),
      };
}

class Videos {
  Videos({
    required this.list,
  });

  List<VideosList> list;

  factory Videos.fromJson(Map<String, dynamic> json) => Videos(
        list: json["list"] == null
            ? []
            : List<VideosList>.from(
                json["list"].map((x) => VideosList.fromJson(x ?? {}))),
      );

  Map<String, dynamic> toJson() => {
        "list": List<dynamic>.from(list.map((x) => x.toJson())),
      };
}

class VideosList {
  VideosList({
    required this.id,
    required this.videoLink,
    required this.videoDesc,
    required this.countryId,
    required this.categoryId,
    required this.year,
    required this.status,
    required this.createdAt,
    required this.updatedAt,
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
        id: json["id"] ?? '',
        videoLink: json["video_link"] ?? '',
        videoDesc: json["video_desc"] ?? '',
        countryId: json["country_id"] ?? '',
        categoryId: json["category_id"] ?? '',
        year: json["year"] ?? '',
        status: json["status"] ?? '',
        createdAt: json["created_at"] ?? '',
        updatedAt: json["updated_at"] ?? '',
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

class SliderArea {
  SliderArea({
    required this.slider,
  });

  Slider slider;

  factory SliderArea.fromJson(Map<String, dynamic> json) => SliderArea(
        slider: json["slider"] == null
            ? Slider(list: [], baseUrl: '')
            : Slider.fromJson(json["slider"]),
      );

  Map<String, dynamic> toJson() => {
        "slider": slider.toJson(),
      };
}

class Slider {
  Slider({
    required this.list,
    required this.baseUrl,
  });

  List<SliderList> list;
  String baseUrl;

  factory Slider.fromJson(Map<String, dynamic> json) => Slider(
        list: json["list"] == null
            ? []
            : List<SliderList>.from(
                json["list"].map((x) => SliderList.fromJson(x ?? {}))),
        baseUrl: json["base_url"] ?? '',
      );

  Map<String, dynamic> toJson() => {
        "list": List<dynamic>.from(list.map((x) => x.toJson())),
        "base_url": baseUrl,
      };
}

class SliderList {
  SliderList({
    required this.id,
    required this.menuId,
    required this.imageTitle,
    required this.imageDesc,
    required this.links,
    required this.image,
    required this.altText,
    required this.status,
    required this.createdAt,
    required this.updatedAt,
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
        id: json["id"] ?? '',
        menuId: json["menu_id"] ?? '',
        imageTitle: json["image_title"] ?? '',
        imageDesc: json["image_desc"] ?? '',
        links: json["links"] ?? '',
        image: json["image"] ?? '',
        altText: json["alt_text"] ?? '',
        status: json["status"] ?? '',
        createdAt: json["created_at"] == null
            ? DateTime.now()
            : DateTime.parse(json["created_at"]),
        updatedAt: json["updated_at"] == null
            ? DateTime.now()
            : DateTime.parse(json["updated_at"]),
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

// // To parse this JSON data, do
// //
// //     final merckFellowshipResponse = merckFellowshipResponseFromJson(jsonString);

// import 'dart:convert';

// MerckFellowshipResponse merckFellowshipResponseFromJson(String str) =>
//     MerckFellowshipResponse.fromJson(json.decode(str));

// String merckFellowshipResponseToJson(MerckFellowshipResponse data) =>
//     json.encode(data.toJson());

// class MerckFellowshipResponse {
//   MerckFellowshipResponse({
//     this.middleArea,
//     this.sliderArea,
//   });

//   Map<String, MiddleArea> middleArea;
//   List<SliderArea> sliderArea;

//   factory MerckFellowshipResponse.fromJson(Map<String, dynamic> json) =>
//       MerckFellowshipResponse(
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
//     this.testimonial,
//   });

//   Content content;
//   Videos videos;
//   Testimonial testimonial;

//   factory MiddleArea.fromJson(Map<String, dynamic> json) => MiddleArea(
//         content:
//             json["content"] == null ? null : Content.fromJson(json["content"]),
//         videos: json["videos"] == null ? null : Videos.fromJson(json["videos"]),
//         testimonial: json["testimonial"] == null
//             ? null
//             : Testimonial.fromJson(json["testimonial"]),
//       );

//   Map<String, dynamic> toJson() => {
//         "content": content == null ? null : content.toJson(),
//         "videos": videos == null ? null : videos.toJson(),
//         "testimonial": testimonial == null ? null : testimonial.toJson(),
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

// class Testimonial {
//   Testimonial({
//     this.list,
//     this.baseUrl,
//   });

//   List<TestimonialList> list;
//   String baseUrl;

//   factory Testimonial.fromJson(Map<String, dynamic> json) => Testimonial(
//         list: List<TestimonialList>.from(
//             json["list"].map((x) => TestimonialList.fromJson(x))),
//         baseUrl: json["base_url"],
//       );

//   Map<String, dynamic> toJson() => {
//         "list": List<dynamic>.from(list.map((x) => x.toJson())),
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
//   });

//   String id;
//   String testimonialName;
//   String departmentName;
//   String shortDescription;
//   String details;
//   String detailPageUrl;
//   String image;
//   String altText;
//   String metaKeyword;
//   String metaDescription;
//   String status;
//   DateTime createdAt;
//   DateTime updatedAt;

//   factory TestimonialList.fromJson(Map<String, dynamic> json) =>
//       TestimonialList(
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
//         createdAt: DateTime.parse(json["created_at"]),
//         updatedAt: DateTime.parse(json["updated_at"]),
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
//   String createdAt;
//   String updatedAt;

//   factory VideosList.fromJson(Map<String, dynamic> json) => VideosList(
//         id: json["id"],
//         videoLink: json["video_link"],
//         videoDesc: json["video_desc"],
//         countryId: json["country_id"],
//         categoryId: json["category_id"],
//         year: json["year"],
//         status: json["status"],
//         createdAt: json["created_at"],
//         updatedAt: json["updated_at"],
//       );

//   Map<String, dynamic> toJson() => {
//         "id": id,
//         "video_link": videoLink,
//         "video_desc": videoDesc,
//         "country_id": countryId,
//         "category_id": categoryId,
//         "year": year,
//         "status": status,
//         "created_at": createdAt,
//         "updated_at": updatedAt,
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
