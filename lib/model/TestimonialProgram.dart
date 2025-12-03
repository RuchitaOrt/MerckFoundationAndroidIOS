import 'dart:convert';

TestimonialprogramResponse testimonialprogramResponseFromJson(String str) =>
    TestimonialprogramResponse.fromJson(json.decode(str));

String testimonialprogramResponseToJson(TestimonialprogramResponse data) =>
    json.encode(data.toJson());

class TestimonialprogramResponse {
  TestimonialprogramResponse({
    this.baseUrl,
    this.success,
    this.msg,
    this.list,
  });

  String? baseUrl;
  String? success;
  String? msg;
  List<ListElement>? list;

  factory TestimonialprogramResponse.fromJson(Map<String, dynamic> json) =>
      TestimonialprogramResponse(
        baseUrl: json["base_url"],
        success: json["success"],
        msg: json["msg"],
        list: json["list"] != null
            ? List<ListElement>.from(
                json["list"].map((x) => ListElement.fromJson(x)))
            : [],
      );

  Map<String, dynamic> toJson() => {
        "base_url": baseUrl,
        "success": success,
        "msg": msg,
        "list": list != null
            ? List<dynamic>.from(list!.map((x) => x.toJson()))
            : [],
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
        createdAt: json["created_at"] != null
            ? DateTime.tryParse(json["created_at"])
            : null,
        updatedAt: json["updated_at"] != null
            ? DateTime.tryParse(json["updated_at"])
            : null,
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
// //     final testimonialprogramResponse = testimonialprogramResponseFromJson(jsonString);

// import 'dart:convert';

// TestimonialprogramResponse testimonialprogramResponseFromJson(String str) =>
//     TestimonialprogramResponse.fromJson(json.decode(str));

// String testimonialprogramResponseToJson(TestimonialprogramResponse data) =>
//     json.encode(data.toJson());

// class TestimonialprogramResponse {
//   TestimonialprogramResponse({
//     this.baseUrl,
//     this.success,
//     this.msg,
//     this.list,
//   });

//   String baseUrl;
//   String success;
//   String msg;
//   List<ListElement> list;

//   factory TestimonialprogramResponse.fromJson(Map<String, dynamic> json) =>
//       TestimonialprogramResponse(
//         baseUrl: json["base_url"],
//         success: json["success"],
//         msg: json["msg"],
//         list: List<ListElement>.from(
//             json["list"].map((x) => ListElement.fromJson(x))),
//       );

//   Map<String, dynamic> toJson() => {
//         "base_url": baseUrl,
//         "success": success,
//         "msg": msg,
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
