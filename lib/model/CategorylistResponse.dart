import 'dart:convert';

CategorylistResponse categorylistResponseFromJson(String str) =>
    CategorylistResponse.fromJson(json.decode(str));

String categorylistResponseToJson(CategorylistResponse data) =>
    json.encode(data.toJson());

class CategorylistResponse {
  CategorylistResponse({
    this.success,
    this.msg,
    this.data,
  });

  String? success;
  String? msg;
  Data? data;

  factory CategorylistResponse.fromJson(Map<String, dynamic> json) =>
      CategorylistResponse(
        success: json["success"],
        msg: json["msg"],
        data: json["data"] != null ? Data.fromJson(json["data"]) : null,
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
        list: json["list"] != null
            ? List<ListElement>.from(
                json["list"].map((x) => ListElement.fromJson(x)))
            : null,
      );

  Map<String, dynamic> toJson() => {
        "list": list != null
            ? List<dynamic>.from(list!.map((x) => x.toJson()))
            : null,
      };
}

class ListElement {
  ListElement({
    this.id,
    this.parentId,
    this.categoryName,
    this.catgSlug,
    this.categoryType,
    this.status,
    this.createdAt,
    this.updatedAt,
  });

  String? id;
  String? parentId;
  String? categoryName;
  String? catgSlug;
  String? categoryType;
  String? status;
  AtedAt? createdAt;
  AtedAt? updatedAt;

  factory ListElement.fromJson(Map<String, dynamic> json) => ListElement(
        id: json["id"],
        parentId: json["parent_id"],
        categoryName: json["category_name"],
        catgSlug: json["catg_slug"],
        categoryType: json["category_type"],
        status: json["status"],
        createdAt: atedAtValues.map[json["created_at"]],
        updatedAt: atedAtValues.map[json["updated_at"]],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "parent_id": parentId,
        "category_name": categoryName,
        "catg_slug": catgSlug,
        "category_type": categoryType,
        "status": status,
        "created_at": atedAtValues.reverse[createdAt],
        "updated_at": atedAtValues.reverse[updatedAt],
      };
}

enum AtedAt { THE_00000000000000 }

final atedAtValues =
    EnumValues({"0000-00-00 00:00:00": AtedAt.THE_00000000000000});

class EnumValues<T> {
  Map<String, T> map;
  Map<T, String>? reverseMap;

  EnumValues(this.map);

  Map<T, String> get reverse =>
      reverseMap ??= map.map((k, v) => MapEntry(v, k));
}

// // To parse this JSON data, do
// //
// //     final categorylistResponse = categorylistResponseFromJson(jsonString);

// import 'dart:convert';

// CategorylistResponse categorylistResponseFromJson(String str) =>
//     CategorylistResponse.fromJson(json.decode(str));

// String categorylistResponseToJson(CategorylistResponse data) =>
//     json.encode(data.toJson());

// class CategorylistResponse {
//   CategorylistResponse({
//     this.success,
//     this.msg,
//     this.data,
//   });

//   String success;
//   String msg;
//   Data data;

//   factory CategorylistResponse.fromJson(Map<String, dynamic> json) =>
//       CategorylistResponse(
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
//     this.id,
//     this.parentId,
//     this.categoryName,
//     this.catgSlug,
//     this.categoryType,
//     this.status,
//     this.createdAt,
//     this.updatedAt,
//   });

//   String id;
//   String parentId;
//   String categoryName;
//   String catgSlug;
//   String categoryType;
//   String status;
//   AtedAt createdAt;
//   AtedAt updatedAt;

//   factory ListElement.fromJson(Map<String, dynamic> json) => ListElement(
//         id: json["id"],
//         parentId: json["parent_id"],
//         categoryName: json["category_name"],
//         catgSlug: json["catg_slug"],
//         categoryType: json["category_type"],
//         status: json["status"],
//         createdAt: atedAtValues.map[json["created_at"]],
//         updatedAt: atedAtValues.map[json["updated_at"]],
//       );

//   Map<String, dynamic> toJson() => {
//         "id": id,
//         "parent_id": parentId,
//         "category_name": categoryName,
//         "catg_slug": catgSlug,
//         "category_type": categoryType,
//         "status": status,
//         "created_at": atedAtValues.reverse[createdAt],
//         "updated_at": atedAtValues.reverse[updatedAt],
//       };
// }

// enum AtedAt { THE_00000000000000 }

// final atedAtValues =
//     EnumValues({"0000-00-00 00:00:00": AtedAt.THE_00000000000000});

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
