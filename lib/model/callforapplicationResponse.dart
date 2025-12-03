import 'dart:convert';

CallforApplicationResponse callforApplicationResponseFromJson(String str) =>
    CallforApplicationResponse.fromJson(json.decode(str));

String callforApplicationResponseToJson(CallforApplicationResponse data) =>
    json.encode(data.toJson());

class CallforApplicationResponse {
  CallforApplicationResponse({
    required this.baseUrl,
    required this.pdfUrl,
    required this.success,
    required this.msg,
    required this.data,
  });

  final String baseUrl;
  final String pdfUrl;
  final String success;
  final String msg;
  final Data data;

  factory CallforApplicationResponse.fromJson(Map<String, dynamic> json) =>
      CallforApplicationResponse(
        baseUrl: json["base_url"] ?? '',
        pdfUrl: json["pdf_url"] ?? '',
        success: json["success"] ?? '',
        msg: json["msg"] ?? '',
        data: json["data"] != null ? Data.fromJson(json["data"]) : Data(upcoming: [], past: []),
      );

  Map<String, dynamic> toJson() => {
        "base_url": baseUrl,
        "pdf_url": pdfUrl,
        "success": success,
        "msg": msg,
        "data": data.toJson(),
      };
}

class Data {
  Data({
    required this.upcoming,
    required this.past,
  });

  final List<Past> upcoming;
  final List<Past> past;

  factory Data.fromJson(Map<String, dynamic> json) => Data(
        upcoming: (json["upcoming"] as List<dynamic>?)
                ?.map((x) => Past.fromJson(x))
                .toList() ??
            [],
        past: (json["past"] as List<dynamic>?)
                ?.map((x) => Past.fromJson(x))
                .toList() ??
            [],
      );

  Map<String, dynamic> toJson() => {
        "upcoming": List<dynamic>.from(upcoming.map((x) => x.toJson())),
        "past": List<dynamic>.from(past.map((x) => x.toJson())),
      };
}

class Past {
  Past({
    required this.id,
    required this.title,
    required this.eventType,
    required this.eventStartDate,
    required this.eventEndDate,
    required this.pdfFile,
    required this.appImg,
    required this.altText,
    required this.status,
    this.createdAt,
    this.updatedAt,
  });

  final String id;
  final String title;
  final String eventType;
  final DateTime eventStartDate;
  final DateTime eventEndDate;
  final String pdfFile;
  final String appImg;
  final String altText;
  final String status;
  final dynamic createdAt;
  final dynamic updatedAt;

  factory Past.fromJson(Map<String, dynamic> json) => Past(
        id: json["id"] ?? '',
        title: json["title"] ?? '',
        eventType: json["event_type"] ?? '',
        eventStartDate: json["event_start_date"] != null
            ? DateTime.tryParse(json["event_start_date"]) ?? DateTime(1970)
            : DateTime(1970),
        eventEndDate: json["event_end_date"] != null
            ? DateTime.tryParse(json["event_end_date"]) ?? DateTime(1970)
            : DateTime(1970),
        pdfFile: json["pdf_file"] ?? '',
        appImg: json["app_img"] ?? '',
        altText: json["alt_text"] ?? '',
        status: json["status"] ?? '',
        createdAt: json["created_at"],
        updatedAt: json["updated_at"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "title": title,
        "event_type": eventType,
        "event_start_date":
            "${eventStartDate.year.toString().padLeft(4, '0')}-${eventStartDate.month.toString().padLeft(2, '0')}-${eventStartDate.day.toString().padLeft(2, '0')}",
        "event_end_date":
            "${eventEndDate.year.toString().padLeft(4, '0')}-${eventEndDate.month.toString().padLeft(2, '0')}-${eventEndDate.day.toString().padLeft(2, '0')}",
        "pdf_file": pdfFile,
        "app_img": appImg,
        "alt_text": altText,
        "status": status,
        "created_at": createdAt,
        "updated_at": updatedAt,
      };
}

// // To parse this JSON data, do
// //
// //     final callforApplicationResponse = callforApplicationResponseFromJson(jsonString);

// import 'dart:convert';

// CallforApplicationResponse callforApplicationResponseFromJson(String str) =>
//     CallforApplicationResponse.fromJson(json.decode(str));

// String callforApplicationResponseToJson(CallforApplicationResponse data) =>
//     json.encode(data.toJson());

// class CallforApplicationResponse {
//   CallforApplicationResponse({
//     this.baseUrl,
//     this.pdfUrl,
//     this.success,
//     this.msg,
//     this.data,
//   });

//   String baseUrl;
//   String pdfUrl;
//   String success;
//   String msg;
//   Data data;

//   factory CallforApplicationResponse.fromJson(Map<String, dynamic> json) =>
//       CallforApplicationResponse(
//         baseUrl: json["base_url"],
//         pdfUrl: json["pdf_url"],
//         success: json["success"],
//         msg: json["msg"],
//         data: Data.fromJson(json["data"]),
//       );

//   Map<String, dynamic> toJson() => {
//         "base_url": baseUrl,
//         "pdf_url":pdfUrl,
//         "success": success,
//         "msg": msg,
//         "data": data.toJson(),
//       };
// }

// class Data {
//   Data({
//     this.upcoming,
//     this.past,
//   });

//   List<Past> upcoming;
//   List<Past> past;

//   factory Data.fromJson(Map<String, dynamic> json) => Data(
//         upcoming:
//             List<Past>.from(json["upcoming"].map((x) => Past.fromJson(x))),
//         past: List<Past>.from(json["past"].map((x) => Past.fromJson(x))),
//       );

//   Map<String, dynamic> toJson() => {
//         "upcoming": List<dynamic>.from(upcoming.map((x) => x.toJson())),
//         "past": List<dynamic>.from(past.map((x) => x.toJson())),
//       };
// }

// class Past {
//   Past({
//     this.id,
//     this.title,
//     this.eventType,
//     this.eventStartDate,
//     this.eventEndDate,
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
//   DateTime eventStartDate;
//   DateTime eventEndDate;
//   String pdfFile;
//   String appImg;
//   String altText;
//   String status;
//   dynamic createdAt;
//   dynamic updatedAt;

//   factory Past.fromJson(Map<String, dynamic> json) => Past(
//         id: json["id"],
//         title: json["title"],
//         eventType: json["event_type"],
//         eventStartDate: DateTime.parse(json["event_start_date"]),
//         eventEndDate: DateTime.parse(json["event_end_date"]),
//         pdfFile: json["pdf_file"],
//         appImg: json["app_img"],
//         altText: json["alt_text"],
//         status: json["status"],
//         createdAt: json["created_at"],
//         updatedAt: json["updated_at"],
//       );

//   Map<String, dynamic> toJson() => {
//         "id": id,
//         "title": title,
//         "event_type": eventType,
//         "event_start_date":
//             "${eventStartDate.year.toString().padLeft(4, '0')}-${eventStartDate.month.toString().padLeft(2, '0')}-${eventStartDate.day.toString().padLeft(2, '0')}",
//         "event_end_date":
//             "${eventEndDate.year.toString().padLeft(4, '0')}-${eventEndDate.month.toString().padLeft(2, '0')}-${eventEndDate.day.toString().padLeft(2, '0')}",
//         "pdf_file": pdfFile,
//         "app_img": appImg,
//         "alt_text": altText,
//         "status": status,
//         "created_at": createdAt,
//         "updated_at": updatedAt,
//       };
// }

// enum CreatedAtEnum { THE_00000000000000 }

// final createdAtEnumValues =
//     EnumValues({"0000-00-00 00:00:00": CreatedAtEnum.THE_00000000000000});

// class EnumValues<T> {
//   Map<String, T> map;
//   Map<T, String> reverseMap;

//   EnumValues(this.map);

//   Map<T, String> get reverse {
//     if (reverseMap == null) {
//       reverseMap = map.map((k, v) => new MapEntry(v, k));
//     }
//     return reverseMap;
//   }
// }
