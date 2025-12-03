import 'dart:convert';

MmtmTestimonialResponse mmtmTestimonialResponseFromJson(String str) =>
    MmtmTestimonialResponse.fromJson(json.decode(str));

String mmtmTestimonialResponseToJson(MmtmTestimonialResponse data) =>
    json.encode(data.toJson());

class MmtmTestimonialResponse {
  MmtmTestimonialResponse({
    this.baseUrl,
    this.success,
    this.msg,
    this.data,
  });

  String? baseUrl;
  String? success;
  String? msg;
  Data? data;

  factory MmtmTestimonialResponse.fromJson(Map<String, dynamic> json) =>
      MmtmTestimonialResponse(
        baseUrl: json["base_url"],
        success: json["success"],
        msg: json["msg"],
        data: json["data"] == null ? null : Data.fromJson(json["data"]),
      );

  Map<String, dynamic> toJson() => {
        "base_url": baseUrl,
        "success": success,
        "msg": msg,
        "data": data?.toJson(),
      };
}

class Data {
  Data({
    this.list,
  });

  List<ListElement>? list;

  factory Data.fromJson(Map<String, dynamic> json) => Data(
        list: json["list"] == null
            ? null
            : List<ListElement>.from(
                json["list"].map((x) => ListElement.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "list": list == null
            ? null
            : List<dynamic>.from(list!.map((x) => x.toJson())),
      };
}

class ListElement {
  ListElement({
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
  });

  String? id;
  String? testimonialName;
  String? departmentName;
  String? shortDescription;
  String? details;
  String? detailPageUrl;
  String? image;
  String? altText;
  String? metaKeyword;
  String? metaDescription;
  String? status;
  DateTime? createdAt;
  DateTime? updatedAt;

  factory ListElement.fromJson(Map<String, dynamic> json) => ListElement(
        id: json["id"],
        testimonialName: json["testimonial_name"],
        departmentName: json["department_name"],
        shortDescription: json["short_description"],
        details: json["details"],
        detailPageUrl: json["detail_page_url"],
        image: json["image"],
        altText: json["alt_text"],
        metaKeyword: json["meta_keyword"],
        metaDescription: json["meta_description"],
        status: json["status"],
        createdAt: json["created_at"] == null
            ? null
            : DateTime.tryParse(json["created_at"]),
        updatedAt: json["updated_at"] == null
            ? null
            : DateTime.tryParse(json["updated_at"]),
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
        "created_at": createdAt?.toIso8601String(),
        "updated_at": updatedAt?.toIso8601String(),
      };
}

// // To parse this JSON data, do
// //
// //     final mmtmTestimonialResponse = mmtmTestimonialResponseFromJson(jsonString);

// import 'dart:convert';

// MmtmTestimonialResponse mmtmTestimonialResponseFromJson(String str) =>
//     MmtmTestimonialResponse.fromJson(json.decode(str));

// String mmtmTestimonialResponseToJson(MmtmTestimonialResponse data) =>
//     json.encode(data.toJson());

// class MmtmTestimonialResponse {
//   MmtmTestimonialResponse({
//     this.baseUrl,
//     this.success,
//     this.msg,
//     this.data,
//   });

//   String baseUrl;
//   String success;
//   String msg;
//   Data data;

//   factory MmtmTestimonialResponse.fromJson(Map<String, dynamic> json) =>
//       MmtmTestimonialResponse(
//         baseUrl: json["base_url"],
//         success: json["success"],
//         msg: json["msg"],
//         data: Data.fromJson(json["data"]),
//       );

//   Map<String, dynamic> toJson() => {
//         "base_url": baseUrl,
//         "success": success,
//         "msg": msg,
//         "data": data.toJson(),
//       };
// }

// class Data {
//   Data({
//     this.list,
//   });

//   List<ListElement> list;

//   factory Data.fromJson(Map<String, dynamic> json) => Data(
//         list: List<ListElement>.from(
//             json["list"].map((x) => ListElement.fromJson(x))),
//       );

//   Map<String, dynamic> toJson() => {
//         "list": List<dynamic>.from(list.map((x) => x.toJson())),
//       };
// }

// class ListElement {
//   ListElement({
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

//   factory ListElement.fromJson(Map<String, dynamic> json) => ListElement(
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
