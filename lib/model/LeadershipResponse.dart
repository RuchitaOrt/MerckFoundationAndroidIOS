class LeadershipResponse {
  final String baseUrl;
  final String success;
  final String msg;
  final LeadershipData data;

  LeadershipResponse({
    required this.baseUrl,
    required this.success,
    required this.msg,
    required this.data,
  });

  factory LeadershipResponse.fromJson(Map<String, dynamic> json) {
    return LeadershipResponse(
      baseUrl: json['base_url'] ?? '',
      success: json['success'] ?? '',
      msg: json['msg'] ?? '',
      data: LeadershipData.fromJson(json['data'] ?? {}),
    );
  }
}
class LeadershipData {
  final List<Leader> chairmanOfBoard;
  final List<Leader> trusteesBoard;
  final List<Leader> ceo;

  LeadershipData({
    required this.chairmanOfBoard,
    required this.trusteesBoard,
    required this.ceo,
  });

  factory LeadershipData.fromJson(Map<String, dynamic> json) {
    return LeadershipData(
      chairmanOfBoard: (json['Chairman_of_Merck_Foundation_Board_of_Trustees'] as List? ?? [])
          .map((e) => Leader.fromJson(e))
          .toList(),

      trusteesBoard: (json['Board_of_Trustees_of_Merck_Foundation'] as List? ?? [])
          .map((e) => Leader.fromJson(e))
          .toList(),

      ceo: (json['CEO'] as List? ?? [])
          .where((e) => e != null && e is Map<String, dynamic>)
          .map((e) => Leader.fromJson(e))
          .toList(),
    );
  }
}
class Leader {
  final String id;
  final String designation;
  final String leaderName;
  final String shortBiodata;
  final String detailBiodata;
  final String url;
  final String image;
  final String altText;
  final String status;
  final String createdAt;
  final String updatedAt;

  Leader({
    required this.id,
    required this.designation,
    required this.leaderName,
    required this.shortBiodata,
    required this.detailBiodata,
    required this.url,
    required this.image,
    required this.altText,
    required this.status,
    required this.createdAt,
    required this.updatedAt,
  });

  factory Leader.fromJson(Map<String, dynamic> json) {
    return Leader(
      id: json['id'] ?? '',
      designation: json['designation'] ?? '',
      leaderName: json['leader_name'] ?? '',
      shortBiodata: json['short_biodata'] ?? '',
      detailBiodata: json['detail_biodata'] ?? '',
      url: json['url'] ?? '',
      image: json['image'] ?? '',
      altText: json['alt_text'] ?? '',
      status: json['status'] ?? '',
      createdAt: json['created_at'] ?? '',
      updatedAt: json['updated_at'] ?? '',
    );
  }
}
// import 'dart:convert';

// LeadershipResponse leadershipResponseFromJson(String str) =>
//     LeadershipResponse.fromJson(json.decode(str));

// String leadershipResponseToJson(LeadershipResponse data) =>
//     json.encode(data.toJson());

// class LeadershipResponse {
//   LeadershipResponse({
//     this.baseUrl,
//     this.success,
//     this.msg,
//     this.data,
//   });

//   String? baseUrl;
//   String? success;
//   String? msg;
//   Data? data;

//   factory LeadershipResponse.fromJson(Map<String, dynamic> json) =>
//       LeadershipResponse(
//         baseUrl: json["base_url"],
//         success: json["success"],
//         msg: json["msg"],
//         data: json["data"] == null ? null : Data.fromJson(json["data"]),
//       );

//   Map<String, dynamic> toJson() => {
//         "base_url": baseUrl,
//         "success": success,
//         "msg": msg,
//         "data": data?.toJson(),
//       };
// }

// class Data {
//   Data({
//     this.ceo,
//     this.boardOfTrusteesOfMerckFoundation,
//   });

//   List<BoardOfTrusteesOfMerckFoundation>? ceo;
//   List<BoardOfTrusteesOfMerckFoundation>? boardOfTrusteesOfMerckFoundation;

//   factory Data.fromJson(Map<String, dynamic> json) => Data(
//         ceo: json["CEO"] == null
//             ? []
//             : List<BoardOfTrusteesOfMerckFoundation>.from(
//                 json["CEO"].map((x) => BoardOfTrusteesOfMerckFoundation.fromJson(x))),
//         boardOfTrusteesOfMerckFoundation:
//             json["Board_of_Trustees_of_Merck_Foundation"] == null
//                 ? []
//                 : List<BoardOfTrusteesOfMerckFoundation>.from(
//                     json["Board_of_Trustees_of_Merck_Foundation"]
//                         .map((x) => BoardOfTrusteesOfMerckFoundation.fromJson(x))),
//       );

//   Map<String, dynamic> toJson() => {
//         "CEO": ceo == null ? [] : List<dynamic>.from(ceo!.map((x) => x.toJson())),
//         "Board_of_Trustees_of_Merck_Foundation": boardOfTrusteesOfMerckFoundation == null
//             ? []
//             : List<dynamic>.from(boardOfTrusteesOfMerckFoundation!.map((x) => x.toJson())),
//       };
// }

// class BoardOfTrusteesOfMerckFoundation {
//   BoardOfTrusteesOfMerckFoundation({
//     this.id,
//     this.designation,
//     this.leaderName,
//     this.leaderLang,
//     this.shortBiodata,
//     this.detailBiodata,
//     this.url,
//     this.image,
//     this.altText,
//     this.status,
//     this.createdAt,
//     this.updatedAt,
//   });

//   String? id;
//   String? designation;
//   String? leaderName;
//   String? leaderLang;
//   String? shortBiodata;
//   String? detailBiodata;
//   String? url;
//   String? image;
//   String? altText;
//   String? status;
//   DateTime? createdAt;
//   DateTime? updatedAt;

//   factory BoardOfTrusteesOfMerckFoundation.fromJson(Map<String, dynamic> json) =>
//       BoardOfTrusteesOfMerckFoundation(
//         id: json["id"],
//         designation: json["designation"],
//         leaderName: json["leader_name"],
//         leaderLang: json["leader_lang"],
//         shortBiodata: json["short_biodata"],
//         detailBiodata: json["detail_biodata"],
//         url: json["url"],
//         image: json["image"],
//         altText: json["alt_text"],
//         status: json["status"],
//         createdAt: json["created_at"] == null ? null : DateTime.tryParse(json["created_at"]),
//         updatedAt: json["updated_at"] == null ? null : DateTime.tryParse(json["updated_at"]),
//       );

//   Map<String, dynamic> toJson() => {
//         "id": id,
//         "designation": designation,
//         "leader_name": leaderName,
//         "leader_lang": leaderLang,
//         "short_biodata": shortBiodata,
//         "detail_biodata": detailBiodata,
//         "url": url,
//         "image": image,
//         "alt_text": altText,
//         "status": status,
//         "created_at": createdAt?.toIso8601String(),
//         "updated_at": updatedAt?.toIso8601String(),
//       };
// }

// // // To parse this JSON data, do
// // //
// // //     final leadershipResponse = leadershipResponseFromJson(jsonString);

// // import 'dart:convert';

// // LeadershipResponse leadershipResponseFromJson(String str) =>
// //     LeadershipResponse.fromJson(json.decode(str));

// // String leadershipResponseToJson(LeadershipResponse data) =>
// //     json.encode(data.toJson());

// // class LeadershipResponse {
// //   LeadershipResponse({
// //     this.baseUrl,
// //     this.success,
// //     this.msg,
// //     this.data,
// //   });

// //   String baseUrl;
// //   String success;
// //   String msg;
// //   Data data;

// //   factory LeadershipResponse.fromJson(Map<String, dynamic> json) =>
// //       LeadershipResponse(
// //         baseUrl: json["base_url"],
// //         success: json["success"],
// //         msg: json["msg"],
// //         data: Data.fromJson(json["data"]),
// //       );

// //   Map<String, dynamic> toJson() => {
// //         "base_url": baseUrl,
// //         "success": success,
// //         "msg": msg,
// //         "data": data.toJson(),
// //       };
// // }

// // class Data {
// //   Data({
// //     this.ceo,
// //     this.boardOfTrusteesOfMerckFoundation,
// //   });

// //   List<BoardOfTrusteesOfMerckFoundation> ceo;
// //   List<BoardOfTrusteesOfMerckFoundation> boardOfTrusteesOfMerckFoundation;

// //   factory Data.fromJson(Map<String, dynamic> json) => Data(
// //         ceo: List<BoardOfTrusteesOfMerckFoundation>.from(json["CEO"]
// //             .map((x) => BoardOfTrusteesOfMerckFoundation.fromJson(x))),
// //         boardOfTrusteesOfMerckFoundation:
// //             List<BoardOfTrusteesOfMerckFoundation>.from(
// //                 json["Board_of_Trustees_of_Merck_Foundation"]
// //                     .map((x) => BoardOfTrusteesOfMerckFoundation.fromJson(x))),
// //       );

// //   Map<String, dynamic> toJson() => {
// //         "CEO": List<dynamic>.from(ceo.map((x) => x.toJson())),
// //         "Board_of_Trustees_of_Merck_Foundation": List<dynamic>.from(
// //             boardOfTrusteesOfMerckFoundation.map((x) => x.toJson())),
// //       };
// // }

// // class BoardOfTrusteesOfMerckFoundation {
// //   BoardOfTrusteesOfMerckFoundation({
// //     this.id,
// //     this.designation,
// //     this.leaderName,
// //     this.leaderLang,
// //     this.shortBiodata,
// //     this.detailBiodata,
// //     this.url,
// //     this.image,
// //     this.altText,
// //     this.status,
// //     this.createdAt,
// //     this.updatedAt,
// //   });

// //   String id;
// //   String designation;
// //   String leaderName;
// //   String leaderLang;
// //   String shortBiodata;
// //   String detailBiodata;
// //   String url;
// //   String image;
// //   String altText;
// //   String status;
// //   DateTime createdAt;
// //   DateTime updatedAt;

// //   factory BoardOfTrusteesOfMerckFoundation.fromJson(
// //           Map<String, dynamic> json) =>
// //       BoardOfTrusteesOfMerckFoundation(
// //         id: json["id"],
// //         designation: json["designation"],
// //         leaderName: json["leader_name"],
// //         leaderLang: json["leader_lang"],
// //         shortBiodata: json["short_biodata"],
// //         detailBiodata: json["detail_biodata"],
// //         url: json["url"],
// //         image: json["image"],
// //         altText: json["alt_text"],
// //         status: json["status"],
// //         createdAt: DateTime.parse(json["created_at"]),
// //         updatedAt: DateTime.parse(json["updated_at"]),
// //       );

// //   Map<String, dynamic> toJson() => {
// //         "id": id,
// //         "designation": designation,
// //         "leader_name": leaderName,
// //         "leader_lang": leaderLang,
// //         "short_biodata": shortBiodata,
// //         "detail_biodata": detailBiodata,
// //         "url": url,
// //         "image": image,
// //         "alt_text": altText,
// //         "status": status,
// //         "created_at": createdAt.toIso8601String(),
// //         "updated_at": updatedAt.toIso8601String(),
// //       };
// // }
