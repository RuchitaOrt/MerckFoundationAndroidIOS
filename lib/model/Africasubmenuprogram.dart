// import 'dart:convert';

// AfricasubmenuprogramlistResponse africasubmenuprogramlistResponseFromJson(String str) =>
//     AfricasubmenuprogramlistResponse.fromJson(json.decode(str));

// String africasubmenuprogramlistResponseToJson(AfricasubmenuprogramlistResponse data) =>
//     json.encode(data.toJson());

// class AfricasubmenuprogramlistResponse {
//   AfricasubmenuprogramlistResponse({
//     required this.success,
//     required this.msg,
//     required this.data,
//   });

//   final String success;
//   final String msg;
//   final Data data;

//   factory AfricasubmenuprogramlistResponse.fromJson(Map<String, dynamic> json) =>
//       AfricasubmenuprogramlistResponse(
//         success: json["success"] ?? '',
//         msg: json["msg"] ?? '',
//         data: json["data"] != null ? Data.fromJson(json["data"]) : Data(list: []),
//       );

//   Map<String, dynamic> toJson() => {
//         "success": success,
//         "msg": msg,
//         "data": data.toJson(),
//       };
// }

// class Data {
//   Data({
//     required this.list,
//   });

//   final List<ListElement> list;

//   factory Data.fromJson(Map<String, dynamic> json) => Data(
//         list: (json["list"] as List<dynamic>?)
//                 ?.map((x) => ListElement.fromJson(x))
//                 .toList() ??
//             [],
//       );

//   Map<String, dynamic> toJson() => {
//         "list": List<dynamic>.from(list.map((x) => x.toJson())),
//       };
// }

// class ListElement {
//   ListElement({
//     required this.menuId,
//     required this.parentId,
//     required this.parentMenuName,
//     required this.menuName,
//     required this.slug,
//     required this.menuTitle,
//     required this.menuUrl,
//     required this.menuMetaDesc,
//     required this.menuKeywords,
//     required this.menuMetaTags,
//     required this.menuType,
//     required this.menuStatus,
//     required this.menuRank,
//     required this.createdAt,
//     required this.updatedAt,
//     required this.children,
//   });

//   final String menuId;
//   final String parentId;
//   final String parentMenuName;
//   final String menuName;
//   final String slug;
//   final String menuTitle;
//   final String menuUrl;
//   final String menuMetaDesc;
//   final String menuKeywords;
//   final String menuMetaTags;
//   final String menuType;
//   final String menuStatus;
//   final String menuRank;
//   final DateTime createdAt;
//   final DateTime updatedAt;
//   final List<ListElement> children;

//   factory ListElement.fromJson(Map<String, dynamic> json) => ListElement(
//         menuId: json["menu_id"] ?? '',
//         parentId: json["parent_id"] ?? '',
//         parentMenuName: json["parent_menu_name"] ?? '',
//         menuName: json["menu_name"] ?? '',
//         slug: json["slug"] ?? '',
//         menuTitle: json["menu_title"] ?? '',
//         menuUrl: json["menu_url"] ?? '',
//         menuMetaDesc: json["menu_meta_desc"] ?? '',
//         menuKeywords: json["menu_keywords"] ?? '',
//         menuMetaTags: json["menu_meta_tags"] ?? '',
//         menuType: json["menu_type"] ?? '',
//         menuStatus: json["menu_status"] ?? '',
//         menuRank: json["menu_rank"] ?? '',
//         createdAt: json["created_at"] != null
//             ? DateTime.parse(json["created_at"])
//             : DateTime.now(),
//         updatedAt: json["updated_at"] != null
//             ? DateTime.parse(json["updated_at"])
//             : DateTime.now(),
//         children: (json["children"] as List<dynamic>?)
//                 ?.map((x) => ListElement.fromJson(x))
//                 .toList() ??
//             [],
//       );

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
//         "children": List<dynamic>.from(children.map((x) => x.toJson())),
//       };
// }

// // // To parse this JSON data, do
// // //
// // //     final africasubmenuprogramlistResponse = africasubmenuprogramlistResponseFromJson(jsonString);

// // import 'dart:convert';

// // AfricasubmenuprogramlistResponse africasubmenuprogramlistResponseFromJson(
// //         String str) =>
// //     AfricasubmenuprogramlistResponse.fromJson(json.decode(str));

// // String africasubmenuprogramlistResponseToJson(
// //         AfricasubmenuprogramlistResponse data) =>
// //     json.encode(data.toJson());

// // class AfricasubmenuprogramlistResponse {
// //   AfricasubmenuprogramlistResponse({
// //     this.success,
// //     this.msg,
// //     this.data,
// //   });

// //   String success;
// //   String msg;
// //   Data data;

// //   factory AfricasubmenuprogramlistResponse.fromJson(
// //           Map<String, dynamic> json) =>
// //       AfricasubmenuprogramlistResponse(
// //         success: json["success"],
// //         msg: json["msg"],
// //         data: Data.fromJson(json["data"]),
// //       );

// //   Map<String, dynamic> toJson() => {
// //         "success": success,
// //         "msg": msg,
// //         "data": data.toJson(),
// //       };
// // }

// // class Data {
// //   Data({
// //     this.list,
// //   });

// //   List<ListElement> list;

// //   factory Data.fromJson(Map<String, dynamic> json) => Data(
// //         list: List<ListElement>.from(
// //             json["list"].map((x) => ListElement.fromJson(x))),
// //       );

// //   Map<String, dynamic> toJson() => {
// //         "list": List<dynamic>.from(list.map((x) => x.toJson())),
// //       };
// // }

// // class ListElement {
// //   ListElement({
// //     this.menuId,
// //     this.parentId,
// //     this.parentMenuName,
// //     this.menuName,
// //     this.slug,
// //     this.menuTitle,
// //     this.menuUrl,
// //     this.menuMetaDesc,
// //     this.menuKeywords,
// //     this.menuMetaTags,
// //     this.menuType,
// //     this.menuStatus,
// //     this.menuRank,
// //     this.createdAt,
// //     this.updatedAt,
// //     this.children,
// //   });

// //   String menuId;
// //   String parentId;
// //   String parentMenuName;
// //   String menuName;
// //   String slug;
// //   String menuTitle;
// //   String menuUrl;
// //   String menuMetaDesc;
// //   String menuKeywords;
// //   String menuMetaTags;
// //   String menuType;
// //   String menuStatus;
// //   String menuRank;
// //   DateTime createdAt;
// //   DateTime updatedAt;
// //   List<ListElement> children;

// //   factory ListElement.fromJson(Map<String, dynamic> json) => ListElement(
// //       menuId: json["menu_id"],
// //       parentId: json["parent_id"],
// //       parentMenuName: json["parent_menu_name"],
// //       menuName: json["menu_name"],
// //       slug: json["slug"],
// //       menuTitle: json["menu_title"],
// //       menuUrl: json["menu_url"],
// //       menuMetaDesc: json["menu_meta_desc"],
// //       menuKeywords: json["menu_keywords"],
// //       menuMetaTags: json["menu_meta_tags"],
// //       menuType: json["menu_type"],
// //       menuStatus: json["menu_status"],
// //       menuRank: json["menu_rank"],
// //       createdAt: DateTime.parse(json["created_at"]),
// //       updatedAt: DateTime.parse(json["updated_at"]),
// //       children: json["children"] != null
// //           ? List<ListElement>.from(
// //               json["children"].map((x) => ListElement.fromJson(x)))
// //           :[]);
// //           //23april
// //           // List<ListElement>());

// //   Map<String, dynamic> toJson() => {
// //         "menu_id": menuId,
// //         "parent_id": parentId,
// //         "parent_menu_name": parentMenuName,
// //         "menu_name": menuName,
// //         "slug": slug,
// //         "menu_title": menuTitle,
// //         "menu_url": menuUrl,
// //         "menu_meta_desc": menuMetaDesc,
// //         "menu_keywords": menuKeywords,
// //         "menu_meta_tags": menuMetaTags,
// //         "menu_type": menuType,
// //         "menu_status": menuStatus,
// //         "menu_rank": menuRank,
// //         "created_at": createdAt.toIso8601String(),
// //         "updated_at": updatedAt.toIso8601String(),
// //         "children": children == null
// //             ? null
// //             : List<dynamic>.from(children.map((x) => x.toJson())),
// //       };
// // }
