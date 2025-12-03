import 'dart:convert';

LocalsongResponse localsongResponseFromJson(String str) =>
    LocalsongResponse.fromJson(json.decode(str));

String localsongResponseToJson(LocalsongResponse data) =>
    json.encode(data.toJson());

class LocalsongResponse {
  LocalsongResponse({
    this.middleArea,
  });

  Map<String, MiddleArea>? middleArea;

  factory LocalsongResponse.fromJson(Map<String, dynamic> json) => LocalsongResponse(
        middleArea: json["middle_area"] == null
            ? null
            : Map.from(json["middle_area"]).map(
                (k, v) => MapEntry<String, MiddleArea>(k, MiddleArea.fromJson(v))),
      );

  Map<String, dynamic> toJson() => {
        "middle_area": middleArea == null
            ? null
            : Map.from(middleArea!)
                .map((k, v) => MapEntry<String, dynamic>(k, v.toJson())),
      };
}

class MiddleArea {
  MiddleArea({
    this.content,
    this.videos,
    this.digitalLibrary,
  });

  Content? content;
  Videos? videos;
  DigitalLibrary? digitalLibrary;

  factory MiddleArea.fromJson(Map<String, dynamic> json) => MiddleArea(
        content: json["content"] == null ? null : Content.fromJson(json["content"]),
        videos: json["videos"] == null ? null : Videos.fromJson(json["videos"]),
        digitalLibrary: json["digital_library"] == null
            ? null
            : DigitalLibrary.fromJson(json["digital_library"]),
      );

  Map<String, dynamic> toJson() => {
        "content": content?.toJson(),
        "videos": videos?.toJson(),
        "digital_library": digitalLibrary?.toJson(),
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
            ? null
            : List<ContentList>.from(
                json["list"].map((x) => ContentList.fromJson(x))),
        baseUrl: json["base_url"],
      );

  Map<String, dynamic> toJson() => {
        "list": list == null
            ? null
            : List<dynamic>.from(list!.map((x) => x.toJson())),
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
        createdAt:
            json["created_at"] == null ? null : DateTime.tryParse(json["created_at"]),
        updatedAt:
            json["updated_at"] == null ? null : DateTime.tryParse(json["updated_at"]),
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

class DigitalLibrary {
  DigitalLibrary({
    this.list,
    this.baseUrl,
    this.pdfUrl,
  });

  List<DigitalLibraryList>? list;
  String? baseUrl;
  String? pdfUrl;

  factory DigitalLibrary.fromJson(Map<String, dynamic> json) => DigitalLibrary(
        list: json["list"] == null
            ? null
            : List<DigitalLibraryList>.from(
                json["list"].map((x) => DigitalLibraryList.fromJson(x))),
        baseUrl: json["base_url"],
        pdfUrl: json["pdf_url"],
      );

  Map<String, dynamic> toJson() => {
        "list": list == null
            ? null
            : List<dynamic>.from(list!.map((x) => x.toJson())),
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

class Videos {
  Videos({
    this.list,
  });

  List<VideosList>? list;

  factory Videos.fromJson(Map<String, dynamic> json) => Videos(
        list: json["list"] == null
            ? null
            : List<VideosList>.from(json["list"].map((x) => VideosList.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "list": list == null ? null : List<dynamic>.from(list!.map((x) => x.toJson())),
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

// // To parse this JSON data, do
// //
// //     final localsongResponse = localsongResponseFromJson(jsonString);

// import 'dart:convert';

// LocalsongResponse localsongResponseFromJson(String str) =>
//     LocalsongResponse.fromJson(json.decode(str));

// String localsongResponseToJson(LocalsongResponse data) =>
//     json.encode(data.toJson());

// class LocalsongResponse {
//   LocalsongResponse({
//     this.middleArea,
//   });

//   Map<String, MiddleArea> middleArea;

//   factory LocalsongResponse.fromJson(Map<String, dynamic> json) =>
//       LocalsongResponse(
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
//     this.videos,
//     this.digitalLibrary,
//   });

//   Content content;
//   Videos videos;
//   DigitalLibrary digitalLibrary;

//   factory MiddleArea.fromJson(Map<String, dynamic> json) => MiddleArea(
//         content:
//             json["content"] == null ? null : Content.fromJson(json["content"]),
//         videos: json["videos"] == null ? null : Videos.fromJson(json["videos"]),
//         digitalLibrary: json["digital_library"] == null
//             ? null
//             : DigitalLibrary.fromJson(json["digital_library"]),
//       );

//   Map<String, dynamic> toJson() => {
//         "content": content == null ? null : content.toJson(),
//         "videos": videos == null ? null : videos.toJson(),
//         "digital_library":
//             digitalLibrary == null ? null : digitalLibrary.toJson(),
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
// class DigitalLibrary {
//   DigitalLibrary({
//     this.list,
//     this.baseUrl,
//      this.pdfUrl,
//   });

//   List<DigitalLibraryList> list;
//   String baseUrl;
//    String pdfUrl;

//   factory DigitalLibrary.fromJson(Map<String, dynamic> json) => DigitalLibrary(
//         list: List<DigitalLibraryList>.from(
//             json["list"].map((x) => DigitalLibraryList.fromJson(x))),
//         baseUrl: json["base_url"],
//          pdfUrl: json["pdf_url"],
//       );

//   Map<String, dynamic> toJson() => {
//         "list": List<dynamic>.from(list.map((x) => x.toJson())),
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
