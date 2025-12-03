import 'dart:convert';

GetLanguageResponse getLanguageResponseFromJson(String str) =>
    GetLanguageResponse.fromJson(json.decode(str));

String getLanguageResponseToJson(GetLanguageResponse data) =>
    json.encode(data.toJson());

class GetLanguageResponse {
  String? success;
  String? msg;
  Data? data;

  GetLanguageResponse({
    this.success,
    this.msg,
    this.data,
  });

  factory GetLanguageResponse.fromJson(Map<String, dynamic> json) =>
      GetLanguageResponse(
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

  Data({
    this.list,
  });

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
  String? id;
  String? language;
  String? abbr;
  String? active;
  dynamic createdAt;
  dynamic updatedAt;

  ListElement({
    this.id,
    this.language,
    this.abbr,
    this.active,
    this.createdAt,
    this.updatedAt,
  });

  factory ListElement.fromJson(Map<String, dynamic> json) => ListElement(
        id: json["id"],
        language: json["language"],
        abbr: json["abbr"],
        active: json["active"],
        createdAt: json["created_at"],
        updatedAt: json["updated_at"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "language": language,
        "abbr": abbr,
        "active": active,
        "created_at": createdAt,
        "updated_at": updatedAt,
      };
}

// // To parse this JSON data, do
// //
// //     final getLanguageResponse = getLanguageResponseFromJson(jsonString);

// import 'dart:convert';

// GetLanguageResponse getLanguageResponseFromJson(String str) => GetLanguageResponse.fromJson(json.decode(str));

// String getLanguageResponseToJson(GetLanguageResponse data) => json.encode(data.toJson());

// class GetLanguageResponse {
//     GetLanguageResponse({
//          this.success,
//          this.msg,
//          this.data,
//     });

//     String success;
//     String msg;
//     Data data;

//     factory GetLanguageResponse.fromJson(Map<String, dynamic> json) => GetLanguageResponse(
//         success: json["success"],
//         msg: json["msg"],
//         data: Data.fromJson(json["data"]),
//     );

//     Map<String, dynamic> toJson() => {
//         "success": success,
//         "msg": msg,
//         "data": data.toJson(),
//     };
// }

// class Data {
//     Data({
//          this.list,
//     });

//     List<ListElement> list;

//     factory Data.fromJson(Map<String, dynamic> json) => Data(
//         list: List<ListElement>.from(json["list"].map((x) => ListElement.fromJson(x))),
//     );

//     Map<String, dynamic> toJson() => {
//         "list": List<dynamic>.from(list.map((x) => x.toJson())),
//     };
// }

// class ListElement {
//     ListElement({
//          this.id,
//          this.language,
//          this.abbr,
//          this.active,
//         this.createdAt,
//         this.updatedAt,
//     });

//     String id;
//     String language;
//     String abbr;
//     String active;
//     dynamic createdAt;
//     dynamic updatedAt;

//     factory ListElement.fromJson(Map<String, dynamic> json) => ListElement(
//         id: json["id"],
//         language: json["language"],
//         abbr: json["abbr"],
//         active: json["active"],
//         createdAt: json["created_at"] == null ? null : json["created_at"],
//         updatedAt: json["updated_at"] == null ? null : json["updated_at"],
//     );

//     Map<String, dynamic> toJson() => {
//         "id": id,
//         "language": language,
//         "abbr": abbr,
//         "active": active,
//         "created_at": createdAt,
//         "updated_at": updatedAt,
//     };
// }
