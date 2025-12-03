import 'dart:convert';

MerckfoundationsubstantionResponse merckfoundationsubstantionResponseFromJson(String str) =>
    MerckfoundationsubstantionResponse.fromJson(json.decode(str));

String merckfoundationsubstantionResponseToJson(MerckfoundationsubstantionResponse data) =>
    json.encode(data.toJson());

class MerckfoundationsubstantionResponse {
  MerckfoundationsubstantionResponse({
    this.middleArea,
    this.sliderArea,
    this.rightArea,
  });

  Map<String, MiddleArea>? middleArea;
  List<SliderArea>? sliderArea;
  RightArea? rightArea;

  factory MerckfoundationsubstantionResponse.fromJson(Map<String, dynamic> json) =>
      MerckfoundationsubstantionResponse(
        middleArea: json["middle_area"] == null
            ? null
            : Map.from(json["middle_area"]).map(
                (k, v) => MapEntry<String, MiddleArea>(k, MiddleArea.fromJson(v))),
        sliderArea: json["slider_area"] == null
            ? null
            : List<SliderArea>.from(json["slider_area"].map((x) => SliderArea.fromJson(x))),
        rightArea: json["Right_area"] == null ? null : RightArea.fromJson(json["Right_area"]),
      );

  Map<String, dynamic> toJson() => {
        "middle_area": middleArea == null
            ? null
            : Map.from(middleArea!).map((k, v) => MapEntry<String, dynamic>(k, v.toJson())),
        "slider_area": sliderArea == null ? null : List<dynamic>.from(sliderArea!.map((x) => x.toJson())),
        "Right_area": rightArea?.toJson(),
      };
}

class MiddleArea {
  MiddleArea({
    this.content,
    this.gallery,
    this.videos,
  });

  Content? content;
  Gallery? gallery;
  Videos? videos;

  factory MiddleArea.fromJson(Map<String, dynamic> json) => MiddleArea(
        content: json["content"] == null ? null : Content.fromJson(json["content"]),
        gallery: json["gallery"] == null ? null : Gallery.fromJson(json["gallery"]),
        videos: json["videos"] == null ? null : Videos.fromJson(json["videos"]),
      );

  Map<String, dynamic> toJson() => {
        "content": content?.toJson(),
        "gallery": gallery?.toJson(),
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
        list: json["list"] == null
            ? []
            : List<ContentList>.from(json["list"].map((x) => ContentList.fromJson(x))),
        baseUrl: json["base_url"],
      );

  Map<String, dynamic> toJson() => {
        "list": list == null ? [] : List<dynamic>.from(list!.map((x) => x.toJson())),
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
        createdAt: json["created_at"] == null ? null : DateTime.parse(json["created_at"]),
        updatedAt: json["updated_at"] == null ? null : DateTime.parse(json["updated_at"]),
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

class Gallery {
  Gallery({
    this.list,
    this.baseUrl,
  });

  List<GalleryList>? list;
  String? baseUrl;

  factory Gallery.fromJson(Map<String, dynamic> json) => Gallery(
        list: json["list"] == null
            ? []
            : List<GalleryList>.from(json["list"].map((x) => GalleryList.fromJson(x))),
        baseUrl: json["base_url"],
      );

  Map<String, dynamic> toJson() => {
        "list": list == null ? [] : List<dynamic>.from(list!.map((x) => x.toJson())),
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

class Videos {
  Videos({
    this.list,
  });

  List<VideosList>? list;

  factory Videos.fromJson(Map<String, dynamic> json) => Videos(
        list: json["list"] == null
            ? []
            : List<VideosList>.from(json["list"].map((x) => VideosList.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "list": list == null ? [] : List<dynamic>.from(list!.map((x) => x.toJson())),
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
  String? createdAt;
  String? updatedAt;

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

  The3? the3;

  factory RightArea.fromJson(Map<String, dynamic> json) => RightArea(
        the3: json["3"] == null ? null : The3.fromJson(json["3"]),
      );

  Map<String, dynamic> toJson() => {
        "3": the3?.toJson(),
      };
}

class The3 {
  The3({
    this.digitalLibrary,
  });

  DigitalLibrary? digitalLibrary;

  factory The3.fromJson(Map<String, dynamic> json) => The3(
        digitalLibrary: json["digital_library"] == null
            ? null
            : DigitalLibrary.fromJson(json["digital_library"]),
      );

  Map<String, dynamic> toJson() => {
        "digital_library": digitalLibrary?.toJson(),
      };
}

class DigitalLibrary {
  DigitalLibrary({
    this.list,
    this.baseUrl,
  });

  List<DigitalLibraryList>? list;
  String? baseUrl;

  factory DigitalLibrary.fromJson(Map<String, dynamic> json) => DigitalLibrary(
        list: json["list"] == null
            ? []
            : List<DigitalLibraryList>.from(json["list"].map((x) => DigitalLibraryList.fromJson(x))),
        baseUrl: json["base_url"],
      );

  Map<String, dynamic> toJson() => {
        "list": list == null ? [] : List<dynamic>.from(list!.map((x) => x.toJson())),
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

  String? id;
  String? categoryType;
  String? title;
  String? image;
  String? altText;
  String? document;
  String? status;
  String? createdAt;
  String? updatedAt;

  factory DigitalLibraryList.fromJson(Map<String, dynamic> json) => DigitalLibraryList(
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

  Slider? slider;

  factory SliderArea.fromJson(Map<String, dynamic> json) => SliderArea(
        slider: json["slider"] == null ? null : Slider.fromJson(json["slider"]),
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
        list: json["list"] == null
            ? []
            : List<SliderList>.from(json["list"].map((x) => SliderList.fromJson(x))),
        baseUrl: json["base_url"],
      );

  Map<String, dynamic> toJson() => {
        "list": list == null ? [] : List<dynamic>.from(list!.map((x) => x.toJson())),
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
        createdAt: json["created_at"] == null ? null : DateTime.parse(json["created_at"]),
        updatedAt: json["updated_at"] == null ? null : DateTime.parse(json["updated_at"]),
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
// //     final merckfoundationsubstantionResponse = merckfoundationsubstantionResponseFromJson(jsonString);

// import 'dart:convert';

// MerckfoundationsubstantionResponse merckfoundationsubstantionResponseFromJson(
//         String str) =>
//     MerckfoundationsubstantionResponse.fromJson(json.decode(str));

// String merckfoundationsubstantionResponseToJson(
//         MerckfoundationsubstantionResponse data) =>
//     json.encode(data.toJson());

// class MerckfoundationsubstantionResponse {
//   MerckfoundationsubstantionResponse({
//     this.middleArea,
//     this.sliderArea,
//     this.rightArea,
//   });

//   Map<String, MiddleArea> middleArea;
//   List<SliderArea> sliderArea;
//   RightArea rightArea;

//   factory MerckfoundationsubstantionResponse.fromJson(
//           Map<String, dynamic> json) =>
//       MerckfoundationsubstantionResponse(
//         middleArea: Map.from(json["middle_area"]).map(
//             (k, v) => MapEntry<String, MiddleArea>(k, MiddleArea.fromJson(v))),
//         sliderArea: List<SliderArea>.from(
//             json["slider_area"].map((x) => SliderArea.fromJson(x))),
//         rightArea: RightArea.fromJson(json["Right_area"]),
//       );

//   Map<String, dynamic> toJson() => {
//         "middle_area": Map.from(middleArea)
//             .map((k, v) => MapEntry<String, dynamic>(k, v.toJson())),
//         "slider_area": List<dynamic>.from(sliderArea.map((x) => x.toJson())),
//         "Right_area": rightArea.toJson(),
//       };
// }

// class MiddleArea {
//   MiddleArea({
//     this.content,
//     this.gallery,
//     this.videos,
//   });

//   Content content;
//   Gallery gallery;
//   Videos videos;

//   factory MiddleArea.fromJson(Map<String, dynamic> json) => MiddleArea(
//         content:
//             json["content"] == null ? null : Content.fromJson(json["content"]),
//         gallery:
//             json["gallery"] == null ? null : Gallery.fromJson(json["gallery"]),
//         videos: json["videos"] == null ? null : Videos.fromJson(json["videos"]),
//       );

//   Map<String, dynamic> toJson() => {
//         "content": content == null ? null : content.toJson(),
//         "gallery": gallery == null ? null : gallery.toJson(),
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

// class Gallery {
//   Gallery({
//     this.list,
//     this.baseUrl,
//   });

//   List<GalleryList> list;
//   String baseUrl;

//   factory Gallery.fromJson(Map<String, dynamic> json) => Gallery(
//         list: List<GalleryList>.from(
//             json["list"].map((x) => GalleryList.fromJson(x))),
//         baseUrl: json["base_url"],
//       );

//   Map<String, dynamic> toJson() => {
//         "list": List<dynamic>.from(list.map((x) => x.toJson())),
//         "base_url": baseUrl,
//       };
// }

// class GalleryList {
//   GalleryList({
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
//   String createdAt;
//   String updatedAt;

//   factory GalleryList.fromJson(Map<String, dynamic> json) => GalleryList(
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

// class RightArea {
//   RightArea({
//     this.the3,
//   });

//   The3 the3;

//   factory RightArea.fromJson(Map<String, dynamic> json) => RightArea(
//         the3: The3.fromJson(json["3"]),
//       );

//   Map<String, dynamic> toJson() => {
//         "3": the3.toJson(),
//       };
// }

// class The3 {
//   The3({
//     this.digitalLibrary,
//   });

//   DigitalLibrary digitalLibrary;

//   factory The3.fromJson(Map<String, dynamic> json) => The3(
//         digitalLibrary: DigitalLibrary.fromJson(json["digital_library"]),
//       );

//   Map<String, dynamic> toJson() => {
//         "digital_library": digitalLibrary.toJson(),
//       };
// }

// class DigitalLibrary {
//   DigitalLibrary({
//     this.list,
//     this.baseUrl,
//   });

//   List<DigitalLibraryList> list;
//   String baseUrl;

//   factory DigitalLibrary.fromJson(Map<String, dynamic> json) => DigitalLibrary(
//         list: List<DigitalLibraryList>.from(
//             json["list"].map((x) => DigitalLibraryList.fromJson(x))),
//         baseUrl: json["base_url"],
//       );

//   Map<String, dynamic> toJson() => {
//         "list": List<dynamic>.from(list.map((x) => x.toJson())),
//         "base_url": baseUrl,
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
//   });

//   String id;
//   String categoryType;
//   String title;
//   String image;
//   String altText;
//   String document;
//   String status;
//   String createdAt;
//   String updatedAt;

//   factory DigitalLibraryList.fromJson(Map<String, dynamic> json) =>
//       DigitalLibraryList(
//         id: json["id"],
//         categoryType: json["category_type"],
//         title: json["title"],
//         image: json["image"],
//         altText: json["alt_text"],
//         document: json["document"],
//         status: json["status"],
//         createdAt: json["created_at"],
//         updatedAt: json["updated_at"],
//       );

//   Map<String, dynamic> toJson() => {
//         "id": id,
//         "category_type": categoryType,
//         "title": title,
//         "image": image,
//         "alt_text": altText,
//         "document": document,
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
