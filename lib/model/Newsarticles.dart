import 'dart:convert';

Newsarticles newsarticlesFromJson(String str) => Newsarticles.fromJson(json.decode(str));

String newsarticlesToJson(Newsarticles data) => json.encode(data.toJson());

class Newsarticles {
  bool? status;
  String? message;
  Data? data;

  Newsarticles({
    this.status,
    this.message,
    this.data,
  });

  factory Newsarticles.fromJson(Map<String, dynamic> json) => Newsarticles(
        status: json["status"],
        message: json["message"],
        data: json["data"] == null ? null : Data.fromJson(json["data"]),
      );

  Map<String, dynamic> toJson() => {
        "status": status,
        "message": message,
        "data": data?.toJson(),
      };
}

class Data {
  String? id;
  String? details;
  String? title;
  String? shortDescription;
  String? image;
  String? url;
  String? metaDescription;
  String? metaKeyword;

  Data({
    this.id,
    this.details,
    this.title,
    this.shortDescription,
    this.image,
    this.url,
    this.metaDescription,
    this.metaKeyword,
  });

  factory Data.fromJson(Map<String, dynamic> json) => Data(
        id: json["id"],
        details: json["details"],
        title: json["title"],
        shortDescription: json["short_description"],
        image: json["image"],
        url: json["url"],
        metaDescription: json["meta_description"],
        metaKeyword: json["meta_keyword"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "details": details,
        "title": title,
        "short_description": shortDescription,
        "image": image,
        "url": url,
        "meta_description": metaDescription,
        "meta_keyword": metaKeyword,
      };
}

// // To parse this JSON data, do
// //
// //     final newsarticles = newsarticlesFromJson(jsonString);

// import 'dart:convert';

// Newsarticles newsarticlesFromJson(String str) => Newsarticles.fromJson(json.decode(str));

// String newsarticlesToJson(Newsarticles data) => json.encode(data.toJson());

// class Newsarticles {
//     bool status;
//     String message;
//     Data data;

//     Newsarticles({
//          this.status,
//          this.message,
//          this.data,
//     });

//     factory Newsarticles.fromJson(Map<String, dynamic> json) => Newsarticles(
//         status: json["status"],
//         message: json["message"],
//         data: Data.fromJson(json["data"]),
//     );

//     Map<String, dynamic> toJson() => {
//         "status": status,
//         "message": message,
//         "data": data.toJson(),
//     };
// }

// class Data {
//     String id;
//     String details;
//     String title;
//     String shortDescription;
//     String image;
//     String url;
//     String metaDescription;
//     String metaKeyword;

//     Data({
//          this.id,
//          this.details,
//          this.title,
//          this.shortDescription,
//          this.image,
//          this.url,
//          this.metaDescription,
//          this.metaKeyword,
//     });

//     factory Data.fromJson(Map<String, dynamic> json) => Data(
//         id: json["id"],
//         details: json["details"],
//         title: json["title"],
//         shortDescription: json["short_description"],
//         image: json["image"],
//         url: json["url"],
//         metaDescription: json["meta_description"],
//         metaKeyword: json["meta_keyword"],
//     );

//     Map<String, dynamic> toJson() => {
//         "id": id,
//         "details": details,
//         "title": title,
//         "short_description": shortDescription,
//         "image": image,
//         "url": url,
//         "meta_description": metaDescription,
//         "meta_keyword": metaKeyword,
//     };
// }
