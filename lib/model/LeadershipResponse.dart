// To parse this JSON data, do
//
//     final leadershipResponse = leadershipResponseFromJson(jsonString);

import 'dart:convert';

LeadershipResponse leadershipResponseFromJson(String str) =>
    LeadershipResponse.fromJson(json.decode(str));

String leadershipResponseToJson(LeadershipResponse data) =>
    json.encode(data.toJson());

class LeadershipResponse {
  LeadershipResponse({
    this.baseUrl,
    this.success,
    this.msg,
    this.data,
  });

  String baseUrl;
  String success;
  String msg;
  Data data;

  factory LeadershipResponse.fromJson(Map<String, dynamic> json) =>
      LeadershipResponse(
        baseUrl: json["base_url"],
        success: json["success"],
        msg: json["msg"],
        data: Data.fromJson(json["data"]),
      );

  Map<String, dynamic> toJson() => {
        "base_url": baseUrl,
        "success": success,
        "msg": msg,
        "data": data.toJson(),
      };
}

class Data {
  Data({
    this.boardOfTrusteesOfMerckFoundation,
    this.ceo,
  });

  List<BoardOfTrusteesOfMerckFoundation> boardOfTrusteesOfMerckFoundation;
  List<BoardOfTrusteesOfMerckFoundation> ceo;

  factory Data.fromJson(Map<String, dynamic> json) => Data(
        boardOfTrusteesOfMerckFoundation:
            List<BoardOfTrusteesOfMerckFoundation>.from(
                json["board_of_trustees_of_merck_foundation"]
                    .map((x) => BoardOfTrusteesOfMerckFoundation.fromJson(x))),
        ceo: List<BoardOfTrusteesOfMerckFoundation>.from(json["ceo"]
            .map((x) => BoardOfTrusteesOfMerckFoundation.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "board_of_trustees_of_merck_foundation": List<dynamic>.from(
            boardOfTrusteesOfMerckFoundation.map((x) => x.toJson())),
        "ceo": List<dynamic>.from(ceo.map((x) => x.toJson())),
      };
}

class BoardOfTrusteesOfMerckFoundation {
  BoardOfTrusteesOfMerckFoundation({
    this.id,
    this.designation,
    this.leaderName,
    this.shortBiodata,
    this.detailBiodata,
    this.url,
    this.image,
    this.altText,
    this.status,
    this.createdAt,
    this.updatedAt,
  });

  String id;
  String designation;
  String leaderName;
  String shortBiodata;
  String detailBiodata;
  String url;
  String image;
  String altText;
  String status;
  DateTime createdAt;
  DateTime updatedAt;

  factory BoardOfTrusteesOfMerckFoundation.fromJson(
          Map<String, dynamic> json) =>
      BoardOfTrusteesOfMerckFoundation(
        id: json["id"],
        designation: json["designation"],
        leaderName: json["leader_name"],
        shortBiodata: json["short_biodata"],
        detailBiodata: json["detail_biodata"],
        url: json["url"],
        image: json["image"],
        altText: json["alt_text"],
        status: json["status"],
        createdAt: DateTime.parse(json["created_at"]),
        updatedAt: DateTime.parse(json["updated_at"]),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "designation": designation,
        "leader_name": leaderName,
        "short_biodata": shortBiodata,
        "detail_biodata": detailBiodata,
        "url": url,
        "image": image,
        "alt_text": altText,
        "status": status,
        "created_at": createdAt.toIso8601String(),
        "updated_at": updatedAt.toIso8601String(),
      };
}
