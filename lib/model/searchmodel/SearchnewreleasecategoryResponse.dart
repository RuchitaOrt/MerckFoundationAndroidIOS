// // To parse this JSON data, do
// //
// //     final searchnewreleasecategoryResponse = searchnewreleasecategoryResponseFromJson(jsonString);

// import 'dart:convert';

// SearchnewreleasecategoryResponse searchnewreleasecategoryResponseFromJson(
//         String str) =>
//     SearchnewreleasecategoryResponse.fromJson(json.decode(str));

// String searchnewreleasecategoryResponseToJson(
//         SearchnewreleasecategoryResponse data) =>
//     json.encode(data.toJson());

// class SearchnewreleasecategoryResponse {
//   SearchnewreleasecategoryResponse({
//     this.baseUrl,
//     this.success,
//     this.msg,
//     this.data,
//   });

//   String? baseUrl;
//   String? success;
//   String? msg;
//   Data? data;

//   factory SearchnewreleasecategoryResponse.fromJson(
//           Map<String, dynamic> json) =>
//       SearchnewreleasecategoryResponse(
//         baseUrl: json["base_url"],
//         success: json["success"],
//         msg: json["msg"],
//         data: Data.fromJson(json["data"]),
//       );

//   Map<String, dynamic> toJson() => {
//         "base_url": baseUrl,
//         "success": success,
//         "msg": msg,
//         "data": data!.toJson(),
//       };
// }

// class Data {
//   Data({
//     required this.list,
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
//     this.pdfFile,
//     this.eventType,
//   });

//   String? title;
//   String? pdfFile;
//   String? eventType;

//   factory ListElement.fromJson(Map<String, dynamic> json) => ListElement(
//         title: json["title"],
//         pdfFile: json["pdf_file"],
//         eventType: json["event_type"],
//       );

//   Map<String, dynamic> toJson() => {
//         "title": title,
//         "pdf_file": pdfFile,
//         "event_type": eventType,
//       };
// }
