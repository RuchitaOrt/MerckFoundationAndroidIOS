import 'dart:convert';

HomeheaderResponse homeheaderResponseFromJson(String str) =>
    HomeheaderResponse.fromJson(json.decode(str));

String homeheaderResponseToJson(HomeheaderResponse data) =>
    json.encode(data.toJson());

class HomeheaderResponse {
  Marque? marque;

  HomeheaderResponse({this.marque});

  factory HomeheaderResponse.fromJson(Map<String, dynamic> json) =>
      HomeheaderResponse(
        marque: json["marque"] == null ? null : Marque.fromJson(json["marque"]),
      );

  Map<String, dynamic> toJson() => {
        "marque": marque?.toJson(),
      };
}

class Marque {
  List<ListElement>? list;

  Marque({this.list});

  factory Marque.fromJson(Map<String, dynamic> json) => Marque(
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
  String? id;
  String? marque;
  String? marqueLink;
  String? status;
  DateTime? startDate;
  DateTime? endDate;
  DateTime? createdAt;
  DateTime? updatedAt;

  ListElement({
    this.id,
    this.marque,
    this.marqueLink,
    this.status,
    this.startDate,
    this.endDate,
    this.createdAt,
    this.updatedAt,
  });

  factory ListElement.fromJson(Map<String, dynamic> json) => ListElement(
        id: json["id"],
        marque: json["marque"],
        marqueLink: json["marque_link"],
        status: json["status"],
        startDate: json["start_date"] == null ? null : DateTime.parse(json["start_date"]),
        endDate: json["end_date"] == null ? null : DateTime.parse(json["end_date"]),
        createdAt: json["created_at"] == null ? null : DateTime.parse(json["created_at"]),
        updatedAt: json["updated_at"] == null ? null : DateTime.parse(json["updated_at"]),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "marque": marque,
        "marque_link": marqueLink,
        "status": status,
        "start_date": startDate == null
            ? null
            : "${startDate!.year.toString().padLeft(4, '0')}-${startDate!.month.toString().padLeft(2, '0')}-${startDate!.day.toString().padLeft(2, '0')}",
        "end_date": endDate == null
            ? null
            : "${endDate!.year.toString().padLeft(4, '0')}-${endDate!.month.toString().padLeft(2, '0')}-${endDate!.day.toString().padLeft(2, '0')}",
        "created_at": createdAt?.toIso8601String(),
        "updated_at": updatedAt?.toIso8601String(),
      };
}

// import 'dart:convert';

// HomeheaderResponse homeheaderResponseFromJson(String str) =>
//     HomeheaderResponse.fromJson(json.decode(str));

// String homeheaderResponseToJson(HomeheaderResponse data) =>
//     json.encode(data.toJson());

// class HomeheaderResponse {
//   HomeheaderResponse({
//     this.marque,
//   });

//   Marque marque;

//   factory HomeheaderResponse.fromJson(Map<String, dynamic> json) =>
//       HomeheaderResponse(
//         marque: Marque.fromJson(json["marque"]),
//       );

//   Map<String, dynamic> toJson() => {
//         "marque": marque.toJson(),
//       };
// }

// class Marque {
//   Marque({
//     this.list,
//   });

//   List<ListElement> list;

//   factory Marque.fromJson(Map<String, dynamic> json) => Marque(
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
//     this.marque,
//     this.marqueLink,
//     this.status,
//     this.startDate,
//     this.endDate,
//     this.createdAt,
//     this.updatedAt,
//   });

//   String id;
//   String marque;
//   String marqueLink;
//   String status;
//   DateTime startDate;
//   DateTime endDate;
//   DateTime createdAt;
//   DateTime updatedAt;

//   factory ListElement.fromJson(Map<String, dynamic> json) => ListElement(
//         id: json["id"],
//         marque: json["marque"],
//         marqueLink: json["marque_link"],
//         status: json["status"],
//         startDate: DateTime.parse(json["start_date"]),
//         endDate: DateTime.parse(json["end_date"]),
//         createdAt: DateTime.parse(json["created_at"]),
//         updatedAt: DateTime.parse(json["updated_at"]),
//       );

//   Map<String, dynamic> toJson() => {
//         "id": id,
//         "marque": marque,
//         "marque_link": marqueLink,
//         "status": status,
//         "start_date":
//             "${startDate.year.toString().padLeft(4, '0')}-${startDate.month.toString().padLeft(2, '0')}-${startDate.day.toString().padLeft(2, '0')}",
//         "end_date":
//             "${endDate.year.toString().padLeft(4, '0')}-${endDate.month.toString().padLeft(2, '0')}-${endDate.day.toString().padLeft(2, '0')}",
//         "created_at": createdAt.toIso8601String(),
//         "updated_at": updatedAt.toIso8601String(),
//       };
// }
