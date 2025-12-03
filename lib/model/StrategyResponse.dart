import 'dart:convert';

GetStrategeryResponse getStrategeryResponseFromJson(String str) =>
    GetStrategeryResponse.fromJson(json.decode(str));

String getStrategeryResponseToJson(GetStrategeryResponse data) =>
    json.encode(data.toJson());

class GetStrategeryResponse {
  GetStrategeryResponse({
    this.middleArea,
  });

  MiddleArea? middleArea;

  factory GetStrategeryResponse.fromJson(Map<String, dynamic> json) =>
      GetStrategeryResponse(
        middleArea: json["middle_area"] != null
            ? MiddleArea.fromJson(json["middle_area"])
            : null,
      );

  Map<String, dynamic> toJson() => {
        "middle_area": middleArea?.toJson(),
      };
}

class MiddleArea {
  MiddleArea({
    this.the1,
  });

  The1? the1;

  factory MiddleArea.fromJson(Map<String, dynamic> json) => MiddleArea(
        the1: json["1"] != null ? The1.fromJson(json["1"]) : null,
      );

  Map<String, dynamic> toJson() => {
        "1": the1?.toJson(),
      };
}

class The1 {
  The1({
    this.content,
  });

  Content? content;

  factory The1.fromJson(Map<String, dynamic> json) => The1(
        content:
            json["content"] != null ? Content.fromJson(json["content"]) : null,
      );

  Map<String, dynamic> toJson() => {
        "content": content?.toJson(),
      };
}

class Content {
  Content({
    this.list,
    this.baseUrl,
  });

  List<ListElement>? list;
  String? baseUrl;

  factory Content.fromJson(Map<String, dynamic> json) => Content(
        list: json["list"] != null
            ? List<ListElement>.from(
                json["list"].map((x) => ListElement.fromJson(x)))
            : [],
        baseUrl: json["base_url"],
      );

  Map<String, dynamic> toJson() => {
        "list": list != null
            ? List<dynamic>.from(list!.map((x) => x.toJson()))
            : [],
        "base_url": baseUrl,
      };
}

class ListElement {
  ListElement({
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

  factory ListElement.fromJson(Map<String, dynamic> json) => ListElement(
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

// // To parse this JSON data, do
// //
// //     final getStrategeryResponse = getStrategeryResponseFromJson(jsonString);

// import 'dart:convert';

// GetStrategeryResponse getStrategeryResponseFromJson(String str) =>
//     GetStrategeryResponse.fromJson(json.decode(str));

// String getStrategeryResponseToJson(GetStrategeryResponse data) =>
//     json.encode(data.toJson());

// class GetStrategeryResponse {
//   GetStrategeryResponse({
//     this.middleArea,
//   });

//   MiddleArea middleArea;

//   factory GetStrategeryResponse.fromJson(Map<String, dynamic> json) =>
//       GetStrategeryResponse(
//         middleArea: MiddleArea.fromJson(json["middle_area"]),
//       );

//   Map<String, dynamic> toJson() => {
//         "middle_area": middleArea.toJson(),
//       };
// }

// class MiddleArea {
//   MiddleArea({
//     this.the1,
//   });

//   The1 the1;

//   factory MiddleArea.fromJson(Map<String, dynamic> json) => MiddleArea(
//         the1: The1.fromJson(json["1"]),
//       );

//   Map<String, dynamic> toJson() => {
//         "1": the1.toJson(),
//       };
// }

// class The1 {
//   The1({
//     this.content,
//   });

//   Content content;

//   factory The1.fromJson(Map<String, dynamic> json) => The1(
//         content: Content.fromJson(json["content"]),
//       );

//   Map<String, dynamic> toJson() => {
//         "content": content.toJson(),
//       };
// }

// class Content {
//   Content({
//     this.list,
//     this.baseUrl,
//   });

//   List<ListElement> list;
//   String baseUrl;

//   factory Content.fromJson(Map<String, dynamic> json) => Content(
//         list: List<ListElement>.from(
//             json["list"].map((x) => ListElement.fromJson(x))),
//         baseUrl: json["base_url"],
//       );

//   Map<String, dynamic> toJson() => {
//         "list": List<dynamic>.from(list.map((x) => x.toJson())),
//         "base_url": baseUrl,
//       };
// }

// class ListElement {
//   ListElement({
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

//   factory ListElement.fromJson(Map<String, dynamic> json) => ListElement(
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
