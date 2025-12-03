import 'dart:convert';

StemsubmenuprogramlistResponse stemsubmenuprogramlistResponseFromJson(
        String str) =>
    StemsubmenuprogramlistResponse.fromJson(json.decode(str));

String stemsubmenuprogramlistResponseToJson(
        StemsubmenuprogramlistResponse data) =>
    json.encode(data.toJson());

class StemsubmenuprogramlistResponse {
  StemsubmenuprogramlistResponse({
    this.success,
    this.msg,
    this.data,
  });

  String? success;
  String? msg;
  Data? data;

  factory StemsubmenuprogramlistResponse.fromJson(Map<String, dynamic> json) =>
      StemsubmenuprogramlistResponse(
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
            : [],
      );

  Map<String, dynamic> toJson() => {
        "list": list != null
            ? List<dynamic>.from(list!.map((x) => x.toJson()))
            : [],
      };
}

class ListElement {
  ListElement({
    this.menuId,
    this.parentId,
    this.parentMenuName,
    this.menuName,
    this.slug,
    this.menuTitle,
    this.menuUrl,
    this.menuMetaDesc,
    this.menuKeywords,
    this.menuMetaTags,
    this.menuType,
    this.menuStatus,
    this.menuRank,
    this.createdAt,
    this.updatedAt,
    this.children,
  });

  String? menuId;
  String? parentId;
  dynamic parentMenuName;
  String? menuName;
  String? slug;
  String? menuTitle;
  String? menuUrl;
  String? menuMetaDesc;
  String? menuKeywords;
  String? menuMetaTags;
  String? menuType;
  String? menuStatus;
  String? menuRank;
  DateTime? createdAt;
  DateTime? updatedAt;
  List<ListElement>? children;

  factory ListElement.fromJson(Map<String, dynamic> json) => ListElement(
        menuId: json["menu_id"],
        parentId: json["parent_id"],
        parentMenuName: json["parent_menu_name"],
        menuName: json["menu_name"],
        slug: json["slug"],
        menuTitle: json["menu_title"],
        menuUrl: json["menu_url"],
        menuMetaDesc: json["menu_meta_desc"],
        menuKeywords: json["menu_keywords"],
        menuMetaTags: json["menu_meta_tags"],
        menuType: json["menu_type"],
        menuStatus: json["menu_status"],
        menuRank: json["menu_rank"],
        createdAt: json["created_at"] != null
            ? DateTime.tryParse(json["created_at"])
            : null,
        updatedAt: json["updated_at"] != null
            ? DateTime.tryParse(json["updated_at"])
            : null,
        children: json["children"] != null
            ? List<ListElement>.from(
                json["children"].map((x) => ListElement.fromJson(x)))
            : [],
      );

  Map<String, dynamic> toJson() => {
        "menu_id": menuId,
        "parent_id": parentId,
        "parent_menu_name": parentMenuName,
        "menu_name": menuName,
        "slug": slug,
        "menu_title": menuTitle,
        "menu_url": menuUrl,
        "menu_meta_desc": menuMetaDesc,
        "menu_keywords": menuKeywords,
        "menu_meta_tags": menuMetaTags,
        "menu_type": menuType,
        "menu_status": menuStatus,
        "menu_rank": menuRank,
        "created_at": createdAt?.toIso8601String(),
        "updated_at": updatedAt?.toIso8601String(),
        "children": children != null
            ? List<dynamic>.from(children!.map((x) => x.toJson()))
            : [],
      };
}

// // To parse this JSON data, do
// //
// //     final stemsubmenuprogramlistResponse = stemsubmenuprogramlistResponseFromJson(jsonString);

// import 'dart:convert';

// StemsubmenuprogramlistResponse stemsubmenuprogramlistResponseFromJson(
//         String str) =>
//     StemsubmenuprogramlistResponse.fromJson(json.decode(str));

// String stemsubmenuprogramlistResponseToJson(
//         StemsubmenuprogramlistResponse data) =>
//     json.encode(data.toJson());

// class StemsubmenuprogramlistResponse {
//   StemsubmenuprogramlistResponse({
//     this.success,
//     this.msg,
//     this.data,
//   });

//   String success;
//   String msg;
//   Data data;

//   factory StemsubmenuprogramlistResponse.fromJson(Map<String, dynamic> json) =>
//       StemsubmenuprogramlistResponse(
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
//     this.menuId,
//     this.parentId,
//     this.parentMenuName,
//     this.menuName,
//     this.slug,
//     this.menuTitle,
//     this.menuUrl,
//     this.menuMetaDesc,
//     this.menuKeywords,
//     this.menuMetaTags,
//     this.menuType,
//     this.menuStatus,
//     this.menuRank,
//     this.createdAt,
//     this.updatedAt,
//     this.children,
//   });

//   String menuId;
//   String parentId;
//   dynamic parentMenuName;
//   String menuName;
//   String slug;
//   String menuTitle;
//   String menuUrl;
//   String menuMetaDesc;
//   String menuKeywords;
//   String menuMetaTags;
//   String menuType;
//   String menuStatus;
//   String menuRank;
//   DateTime createdAt;
//   DateTime updatedAt;
//   List<ListElement> children;

//   factory ListElement.fromJson(Map<String, dynamic> json) => ListElement(
//       menuId: json["menu_id"],
//       parentId: json["parent_id"],
//       parentMenuName: json["parent_menu_name"],
//       menuName: json["menu_name"],
//       slug: json["slug"],
//       menuTitle: json["menu_title"],
//       menuUrl: json["menu_url"],
//       menuMetaDesc: json["menu_meta_desc"],
//       menuKeywords: json["menu_keywords"],
//       menuMetaTags: json["menu_meta_tags"],
//       menuType: json["menu_type"],
//       menuStatus: json["menu_status"],
//       menuRank: json["menu_rank"],
//       createdAt: DateTime.parse(json["created_at"]),
//       updatedAt: DateTime.parse(json["updated_at"]),
//       children: json["children"] != null
//           ? List<ListElement>.from(
//               json["children"].map((x) => ListElement.fromJson(x)))
//           : 
//           //23april
//           []
//           //List<ListElement>()
//           );

//   Map<String, dynamic> toJson() => {
//         "menu_id": menuId,
//         "parent_id": parentId,
//         "parent_menu_name": parentMenuName,
//         "menu_name": menuName,
//         "slug": slug,
//         "menu_title": menuTitle,
//         "menu_url": menuUrl,
//         "menu_meta_desc": menuMetaDesc,
//         "menu_keywords": menuKeywords,
//         "menu_meta_tags": menuMetaTags,
//         "menu_type": menuType,
//         "menu_status": menuStatus,
//         "menu_rank": menuRank,
//         "created_at": createdAt.toIso8601String(),
//         "updated_at": updatedAt.toIso8601String(),
//         "children": children == null
//             ? null
//             : List<dynamic>.from(children.map((x) => x.toJson())),
//       };
// }
