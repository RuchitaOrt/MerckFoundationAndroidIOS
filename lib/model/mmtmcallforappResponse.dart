import 'dart:convert';

MmtmcallforappResponse mmtmcallforappResponseFromJson(String str) =>
    MmtmcallforappResponse.fromJson(json.decode(str));

String mmtmcallforappResponseToJson(MmtmcallforappResponse data) =>
    json.encode(data.toJson());

class MmtmcallforappResponse {
  MmtmcallforappResponse({
    this.baseUrl,
    this.success,
    this.msg,
    this.data,
  });

  String? baseUrl;
  String? success;
  String? msg;
  Data? data;

  factory MmtmcallforappResponse.fromJson(Map<String, dynamic> json) =>
      MmtmcallforappResponse(
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
            ? []
            : List<ListElement>.from(
                json["list"].map((x) => ListElement.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "list": list == null
            ? []
            : List<dynamic>.from(list!.map((x) => x.toJson())),
      };
}

class ListElement {
  ListElement({
    this.id,
    this.title,
    this.eventType,
    this.eventYear,
    this.pdfFile,
    this.appImg,
    this.altText,
    this.status,
    this.createdAt,
    this.updatedAt,
  });

  String? id;
  String? title;
  String? eventType;
  DateTime? eventYear;
  String? pdfFile;
  String? appImg;
  String? altText;
  String? status;
  DateTime? createdAt;
  DateTime? updatedAt;

  factory ListElement.fromJson(Map<String, dynamic> json) => ListElement(
        id: json["id"],
        title: json["title"],
        eventType: json["event_type"],
        eventYear: json["event_year"] == null
            ? null
            : DateTime.tryParse(json["event_year"]),
        pdfFile: json["pdf_file"],
        appImg: json["app_img"],
        altText: json["alt_text"],
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
        "title": title,
        "event_type": eventType,
        "event_year": eventYear?.toIso8601String(),
        "pdf_file": pdfFile,
        "app_img": appImg,
        "alt_text": altText,
        "status": status,
        "created_at": createdAt?.toIso8601String(),
        "updated_at": updatedAt?.toIso8601String(),
      };
}

// // To parse this JSON data, do
// //
// //     final mmtmcallforappResponse = mmtmcallforappResponseFromJson(jsonString);

// import 'dart:convert';

// MmtmcallforappResponse mmtmcallforappResponseFromJson(String str) =>
//     MmtmcallforappResponse.fromJson(json.decode(str));

// String mmtmcallforappResponseToJson(MmtmcallforappResponse data) =>
//     json.encode(data.toJson());

// class MmtmcallforappResponse {
//   MmtmcallforappResponse({
//     this.baseUrl,
//     this.success,
//     this.msg,
//     this.data,
//   });

//   String baseUrl;
//   String success;
//   String msg;
//   Data data;

//   factory MmtmcallforappResponse.fromJson(Map<String, dynamic> json) =>
//       MmtmcallforappResponse(
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
//     this.title,
//     this.eventType,
//     this.eventYear,
//     this.pdfFile,
//     this.appImg,
//     this.altText,
//     this.status,
//     this.createdAt,
//     this.updatedAt,
//   });

//   String id;
//   String title;
//   String eventType;
//   DateTime eventYear;
//   String pdfFile;
//   String appImg;
//   String altText;
//   String status;
//   DateTime createdAt;
//   DateTime updatedAt;

//   factory ListElement.fromJson(Map<String, dynamic> json) => ListElement(
//         id: json["id"],
//         title: json["title"],
//         eventType: json["event_type"],
//         eventYear: DateTime.parse(json["event_year"]),
//         pdfFile: json["pdf_file"],
//         appImg: json["app_img"],
//         altText: json["alt_text"],
//         status: json["status"],
//         createdAt: DateTime.parse(json["created_at"]),
//         updatedAt: DateTime.parse(json["updated_at"]),
//       );

//   Map<String, dynamic> toJson() => {
//         "id": id,
//         "title": title,
//         "event_type": eventType,
//         "event_year": eventYear.toIso8601String(),
//         "pdf_file": pdfFile,
//         "app_img": appImg,
//         "alt_text": altText,
//         "status": status,
//         "created_at": createdAt.toIso8601String(),
//         "updated_at": updatedAt.toIso8601String(),
//       };
// }
