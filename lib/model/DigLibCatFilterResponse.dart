import 'dart:convert';

DigLibCatFilterResponse digLibCatFilterResponseFromJson(String str) =>
    DigLibCatFilterResponse.fromJson(json.decode(str));

String digLibCatFilterResponseToJson(DigLibCatFilterResponse data) =>
    json.encode(data.toJson());

class DigLibCatFilterResponse {
  DigLibCatFilterResponse({
    this.success,
    this.msg,
    this.data,
  });

  String? success;
  String? msg;
  Data? data;

  factory DigLibCatFilterResponse.fromJson(Map<String, dynamic> json) =>
      DigLibCatFilterResponse(
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
    this.categoryName,
    this.catgSlug,
    this.status,
    this.createdBy,
    this.modifiedBy,
    this.createdAt,
    this.updatedAt,
  });

  String? id;
  String? categoryName;
  String? catgSlug;
  String? status;
  String? createdBy;
  String? modifiedBy;
  DateTime? createdAt;
  DateTime? updatedAt;

  factory ListElement.fromJson(Map<String, dynamic> json) => ListElement(
        id: json["id"],
        categoryName: json["category_name"],
        catgSlug: json["catg_slug"],
        status: json["status"],
        createdBy: json["created_by"],
        modifiedBy: json["modified_by"],
        createdAt:
            json["created_at"] == null ? null : DateTime.parse(json["created_at"]),
        updatedAt:
            json["updated_at"] == null ? null : DateTime.parse(json["updated_at"]),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "category_name": categoryName,
        "catg_slug": catgSlug,
        "status": status,
        "created_by": createdBy,
        "modified_by": modifiedBy,
        "created_at": createdAt?.toIso8601String(),
        "updated_at": updatedAt?.toIso8601String(),
      };
}

// // To parse this JSON data, do
// //
// //     final digLibCatFilterResponse = digLibCatFilterResponseFromJson(jsonString);

// import 'dart:convert';

// DigLibCatFilterResponse digLibCatFilterResponseFromJson(String str) => DigLibCatFilterResponse.fromJson(json.decode(str));

// String digLibCatFilterResponseToJson(DigLibCatFilterResponse data) => json.encode(data.toJson());

// class DigLibCatFilterResponse {
//     DigLibCatFilterResponse({
//          this.success,
//          this.msg,
//          this.data,
//     });

//     String success;
//     String msg;
//     Data data;

//     factory DigLibCatFilterResponse.fromJson(Map<String, dynamic> json) => DigLibCatFilterResponse(
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
//          this.categoryName,
//          this.catgSlug,
//          this.status,
//          this.createdBy,
//         this.modifiedBy,
//          this.createdAt,
//          this.updatedAt,
//     });

//     String id;
//     String categoryName;
//     String catgSlug;
//     String status;
//     String createdBy;
//     String modifiedBy;
//     DateTime createdAt;
//     DateTime updatedAt;

//     factory ListElement.fromJson(Map<String, dynamic> json) => ListElement(
//         id: json["id"],
//         categoryName: json["category_name"],
//         catgSlug: json["catg_slug"],
//         status: json["status"],
//         createdBy: json["created_by"],
//         modifiedBy: json["modified_by"],
//         createdAt: DateTime.parse(json["created_at"]),
//         updatedAt: DateTime.parse(json["updated_at"]),
//     );

//     Map<String, dynamic> toJson() => {
//         "id": id,
//         "category_name": categoryName,
//         "catg_slug": catgSlug,
//         "status": status,
//         "created_by": createdBy,
//         "modified_by": modifiedBy,
//         "created_at": createdAt.toIso8601String(),
//         "updated_at": updatedAt.toIso8601String(),
//     };
// }
