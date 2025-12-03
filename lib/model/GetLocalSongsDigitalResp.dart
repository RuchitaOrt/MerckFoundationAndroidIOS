import 'dart:convert';

GetLocalSongsDigitalLibResp getLocalSongsDigitalLibRespFromJson(String str) =>
    GetLocalSongsDigitalLibResp.fromJson(json.decode(str));

String getLocalSongsDigitalLibRespToJson(GetLocalSongsDigitalLibResp data) =>
    json.encode(data.toJson());

class GetLocalSongsDigitalLibResp {
  String? baseUrl;
  String? success;
  String? msg;
  Data? data;

  GetLocalSongsDigitalLibResp({
    this.baseUrl,
    this.success,
    this.msg,
    this.data,
  });

  factory GetLocalSongsDigitalLibResp.fromJson(Map<String, dynamic> json) =>
      GetLocalSongsDigitalLibResp(
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
  String? title;
  String? image;
  String? altText;
  String? document;
  String? status;
  DateTime? createdAt;
  DateTime? updatedAt;

  ListElement({
    this.id,
    this.title,
    this.image,
    this.altText,
    this.document,
    this.status,
    this.createdAt,
    this.updatedAt,
  });

  factory ListElement.fromJson(Map<String, dynamic> json) => ListElement(
        id: json["id"],
        title: json["title"],
        image: json["image"],
        altText: json["alt_text"],
        document: json["document"],
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
        "image": image,
        "alt_text": altText,
        "document": document,
        "status": status,
        "created_at": createdAt?.toIso8601String(),
        "updated_at": updatedAt?.toIso8601String(),
      };
}

// // To parse this JSON data, do
// //
// //     final getLocalSongsDigitalLibResp = getLocalSongsDigitalLibRespFromJson(jsonString);

// import 'dart:convert';

// GetLocalSongsDigitalLibResp getLocalSongsDigitalLibRespFromJson(String str) => GetLocalSongsDigitalLibResp.fromJson(json.decode(str));

// String getLocalSongsDigitalLibRespToJson(GetLocalSongsDigitalLibResp data) => json.encode(data.toJson());

// class GetLocalSongsDigitalLibResp {
//     GetLocalSongsDigitalLibResp({
//         this.baseUrl,
//         this.success,
//         this.msg,
//         this.data,
//     });

//     String baseUrl;
//     String success;
//     String msg;
//     Data data;

//     factory GetLocalSongsDigitalLibResp.fromJson(Map<String, dynamic> json) => GetLocalSongsDigitalLibResp(
//         baseUrl: json["base_url"],
//         success: json["success"],
//         msg: json["msg"],
//         data: Data.fromJson(json["data"]),
//     );

//     Map<String, dynamic> toJson() => {
//         "base_url": baseUrl,
//         "success": success,
//         "msg": msg,
//         "data": data.toJson(),
//     };
// }

// class Data {
//     Data({
//         this.list,
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
//         this.id,
//         this.title,
//         this.image,
//         this.altText,
//         this.document,
//         this.status,
//         this.createdAt,
//         this.updatedAt,
//     });

//     String id;
//     String title;
//     String image;
//     String altText;
//     String document;
//     String status;
//     DateTime createdAt;
//     DateTime updatedAt;

//     factory ListElement.fromJson(Map<String, dynamic> json) => ListElement(
//         id: json["id"],
//         title: json["title"],
//         image: json["image"],
//         altText: json["alt_text"],
//         document: json["document"],
//         status: json["status"],
//         createdAt: DateTime.parse(json["created_at"]),
//         updatedAt: DateTime.parse(json["updated_at"]),
//     );

//     Map<String, dynamic> toJson() => {
//         "id": id,
//         "title": title,
//         "image": image,
//         "alt_text": altText,
//         "document": document,
//         "status": status,
//         "created_at": createdAt.toIso8601String(),
//         "updated_at": updatedAt.toIso8601String(),
//     };
// }
