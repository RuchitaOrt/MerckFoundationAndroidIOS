// To parse this JSON data, do
//
//     final getFilterDlResponse = getFilterDlResponseFromJson(jsonString);

import 'dart:convert';

GetFilterDlResponse getFilterDlResponseFromJson(String str) => GetFilterDlResponse.fromJson(json.decode(str));

String getFilterDlResponseToJson(GetFilterDlResponse data) => json.encode(data.toJson());

class GetFilterDlResponse {
    bool status;
    String message;
    List<DigitalLibraryList> digitalLibraryList;
    List<LanguageList> languageList;
    List<CategoryList> categoryList;

    GetFilterDlResponse({
         this.status,
         this.message,
         this.digitalLibraryList,
         this.languageList,
         this.categoryList,
    });

    factory GetFilterDlResponse.fromJson(Map<String, dynamic> json) => GetFilterDlResponse(
        status: json["status"],
        message: json["message"],
        digitalLibraryList: List<DigitalLibraryList>.from(json["digital_library_list"].map((x) => DigitalLibraryList.fromJson(x))),
        languageList: List<LanguageList>.from(json["language_list"].map((x) => LanguageList.fromJson(x))),
        categoryList: List<CategoryList>.from(json["category_list"].map((x) => CategoryList.fromJson(x))),
    );

    Map<String, dynamic> toJson() => {
        "status": status,
        "message": message,
        "digital_library_list": List<dynamic>.from(digitalLibraryList.map((x) => x.toJson())),
        "language_list": List<dynamic>.from(languageList.map((x) => x.toJson())),
        "category_list": List<dynamic>.from(categoryList.map((x) => x)),
    };
}
class CategoryList {
    String id;
    String categoryName;
    String catgSlug;
    String status;
    String createdBy;
    String modifiedBy;
    dynamic createdAt;
    dynamic updatedAt;

    CategoryList({
         this.id,
         this.categoryName,
         this.catgSlug,
         this.status,
         this.createdBy,
        this.modifiedBy,
         this.createdAt,
         this.updatedAt,
    });

    factory CategoryList.fromJson(Map<String, dynamic> json) => CategoryList(
        id: json["id"],
        categoryName: json["category_name"],
        catgSlug: json["catg_slug"],
        status: json["status"],
        createdBy: json["created_by"],
        modifiedBy: json["modified_by"],
        createdAt: DateTime.parse(json["created_at"]),
        updatedAt: DateTime.parse(json["updated_at"]),
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "category_name": categoryName,
        "catg_slug": catgSlug,
        "status": status,
        "created_by": createdBy,
        "modified_by": modifiedBy,
        "created_at": createdAt.toIso8601String(),
        "updated_at": updatedAt.toIso8601String(),
    };
}

class DigitalLibraryList {
    String id;
    String categoryType;
    String title;
    String image;
    String altText;
    String document;
    String categoryId;
    String languageId;
    String status;
    dynamic createdBy;
    dynamic modifiedBy;
    dynamic createdAt;
    dynamic updatedAt;
    String language;
    String categoryName;

    DigitalLibraryList({
         this.id,
         this.categoryType,
         this.title,
         this.image,
         this.altText,
         this.document,
         this.categoryId,
         this.languageId,
         this.status,
         this.createdBy,
         this.modifiedBy,
         this.createdAt,
         this.updatedAt,
         this.language,
         this.categoryName,
    });

    factory DigitalLibraryList.fromJson(Map<String, dynamic> json) => DigitalLibraryList(
        id: json["id"],
        categoryType: json["category_type"],
        title: json["title"],
        image: json["image"],
        altText: json["alt_text"],
        document: json["document"],
        categoryId: json["category_id"],
        languageId: json["language_id"],
        status: json["status"],
        createdBy: json["created_by"],
        modifiedBy: json["modified_by"],
        createdAt: json["created_at"],
        updatedAt:json["updated_at"],
        language: json["language"],
        categoryName: json["category_name"],
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "category_type": categoryType,
        "title": title,
        "image": image,
        "alt_text": altText,
        "document": document,
        "category_id": categoryId,
        "language_id": languageId,
        "status": status,
        "created_by": createdBy,
        "modified_by": modifiedBy,
        "created_at": createdAt.toIso8601String(),
        "updated_at": updatedAt.toIso8601String(),
        "language": language,
        "category_name": categoryName,
    };
}

class LanguageList {
    String id;
    String language;
    String abbr;
    String active;
    dynamic createdAt;
    dynamic updatedAt;

    LanguageList({
         this.id,
         this.language,
         this.abbr,
         this.active,
        this.createdAt,
        this.updatedAt,
    });

    factory LanguageList.fromJson(Map<String, dynamic> json) => LanguageList(
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
// //     final getFilterDlResponse = getFilterDlResponseFromJson(jsonString);

// import 'dart:convert';

// GetFilterDlResponse getFilterDlResponseFromJson(String str) => GetFilterDlResponse.fromJson(json.decode(str));

// String getFilterDlResponseToJson(GetFilterDlResponse data) => json.encode(data.toJson());

// class GetFilterDlResponse {
//     GetFilterDlResponse({
//          this.status,
//          this.message,
//          this.digitalLibraryList,
//          this.languageList,
//     });

//     bool status;
//     String message;
//     List<DigitalLibraryList> digitalLibraryList;
//     List<LanguageList> languageList;

//     factory GetFilterDlResponse.fromJson(Map<String, dynamic> json) => GetFilterDlResponse(
//         status: json["status"],
//         message: json["message"],
//         digitalLibraryList: List<DigitalLibraryList>.from(json["digital_library_list"].map((x) => DigitalLibraryList.fromJson(x))),
//         languageList: List<LanguageList>.from(json["language_list"].map((x) => LanguageList.fromJson(x))),
//     );

//     Map<String, dynamic> toJson() => {
//         "status": status,
//         "message": message,
//         "digital_library_list": List<dynamic>.from(digitalLibraryList.map((x) => x.toJson())),
//         "language_list": List<dynamic>.from(languageList.map((x) => x.toJson())),
//     };
// }

// class DigitalLibraryList {
//     DigitalLibraryList({
//          this.id,
//          this.categoryType,
//          this.title,
//          this.image,
//          this.altText,
//          this.document,
//          this.categoryId,
//          this.languageId,
//          this.status,
//          this.createdBy,
//          this.modifiedBy,
//          this.createdAt,
//          this.updatedAt,
//          this.language,
//          this.categoryName,
//     });

//     String id;
//     String categoryType;
//     String title;
//     String image;
//     String altText;
//     String document;
//     String categoryId;
//     String languageId;
//     String status;
//     String createdBy;
//     String modifiedBy;
//     DateTime createdAt;
//     DateTime updatedAt;
//     String language;
//     String categoryName;

//     factory DigitalLibraryList.fromJson(Map<String, dynamic> json) => DigitalLibraryList(
//         id: json["id"],
//         categoryType: json["category_type"],
//         title: json["title"],
//         image: json["image"],
//         altText: json["alt_text"],
//         document: json["document"],
//         categoryId: json["category_id"],
//         languageId: json["language_id"],
//         status: json["status"],
//         createdBy: json["created_by"],
//         modifiedBy: json["modified_by"],
//         createdAt: DateTime.parse(json["created_at"]),
//         updatedAt: DateTime.parse(json["updated_at"]),
//         language: json["language"],
//         categoryName: json["category_name"],
//     );

//     Map<String, dynamic> toJson() => {
//         "id": id,
//         "category_type": categoryType,
//         "title": title,
//         "image": image,
//         "alt_text": altText,
//         "document": document,
//         "category_id": categoryId,
//         "language_id": languageId,
//         "status": status,
//         "created_by": createdBy,
//         "modified_by": modifiedBy,
//         "created_at": createdAt.toIso8601String(),
//         "updated_at": updatedAt.toIso8601String(),
//         "language": language,
//         "category_name": categoryName,
//     };
// }

// class LanguageList {
//     LanguageList({
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

//     factory LanguageList.fromJson(Map<String, dynamic> json) => LanguageList(
//         id: json["id"],
//         language: json["language"],
//         abbr: json["abbr"],
//         active: json["active"],
//         createdAt: json["created_at"],
//         updatedAt: json["updated_at"],
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
