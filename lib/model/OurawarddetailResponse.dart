import 'dart:convert';

OurawarddetailResponse ourawarddetailResponseFromJson(String str) =>
    OurawarddetailResponse.fromJson(json.decode(str));

String ourawarddetailResponseToJson(OurawarddetailResponse data) =>
    json.encode(data.toJson());

class OurawarddetailResponse {
  String? success;
  String? msg;
  Data? data;

  OurawarddetailResponse({this.success, this.msg, this.data});

  factory OurawarddetailResponse.fromJson(Map<String, dynamic> json) =>
      OurawarddetailResponse(
        success: json["success"],
        msg: json["msg"],
        data: json["data"] == null ? null : Data.fromJson(json["data"]),
      );

  Map<String, dynamic> toJson() => {
        "success": success,
        "msg": msg,
        "data": data?.toJson(),
      };
}

class Data {
  List<ListElement>? list;

  Data({this.list});

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
  String? title;
  String? shortDescription;
  String? pageContent;

  ListElement({this.title, this.shortDescription, this.pageContent});

  factory ListElement.fromJson(Map<String, dynamic> json) => ListElement(
        title: json["title"],
        shortDescription: json["short_description"],
        pageContent: json["page_content"],
      );

  Map<String, dynamic> toJson() => {
        "title": title,
        "short_description": shortDescription,
        "page_content": pageContent,
      };
}

// // To parse this JSON data, do
// //
// //     final ourawarddetailResponse = ourawarddetailResponseFromJson(jsonString);

// import 'dart:convert';

// OurawarddetailResponse ourawarddetailResponseFromJson(String str) =>
//     OurawarddetailResponse.fromJson(json.decode(str));

// String ourawarddetailResponseToJson(OurawarddetailResponse data) =>
//     json.encode(data.toJson());

// class OurawarddetailResponse {
//   OurawarddetailResponse({
//     this.success,
//     this.msg,
//     this.data,
//   });

//   String success;
//   String msg;
//   Data data;

//   factory OurawarddetailResponse.fromJson(Map<String, dynamic> json) =>
//       OurawarddetailResponse(
//         success: json["success"],
//         msg: json["msg"],
//         data: Data.fromJson(json["data"]),
//       );

//   Map<String, dynamic> toJson() => {
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
//     this.title,
//     this.shortDescription,
//     this.pageContent,
//   });

//   String title;
//   String shortDescription;
//   String pageContent;

//   factory ListElement.fromJson(Map<String, dynamic> json) => ListElement(
//         title: json["title"],
//         shortDescription: json["short_description"],
//         pageContent: json["page_content"],
//       );

//   Map<String, dynamic> toJson() => {
//         "title": title,
//         "short_description": shortDescription,
//         "page_content": pageContent,
//       };
// }
