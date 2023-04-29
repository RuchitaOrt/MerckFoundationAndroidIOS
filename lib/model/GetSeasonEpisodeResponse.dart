// To parse this JSON data, do
//
//     final getSeasonEpisodeResponse = getSeasonEpisodeResponseFromJson(jsonString);

import 'dart:convert';

GetSeasonEpisodeResponse getSeasonEpisodeResponseFromJson(String str) => GetSeasonEpisodeResponse.fromJson(json.decode(str));

String getSeasonEpisodeResponseToJson(GetSeasonEpisodeResponse data) => json.encode(data.toJson());

class GetSeasonEpisodeResponse {
    GetSeasonEpisodeResponse({
        this.success,
        this.msg,
        this.data,
    });

    String success;
    String msg;
    Data data;

    factory GetSeasonEpisodeResponse.fromJson(Map<String, dynamic> json) => GetSeasonEpisodeResponse(
        success: json["success"],
        msg: json["msg"],
        data: Data.fromJson(json["data"]),
    );

    Map<String, dynamic> toJson() => {
        "success": success,
        "msg": msg,
        "data": data.toJson(),
    };
}

class Data {
    Data({
        this.seasons,
    });

    List<Season> seasons;

    factory Data.fromJson(Map<String, dynamic> json) => Data(
        seasons: List<Season>.from(json["seasons"].map((x) => Season.fromJson(x))),
    );

    Map<String, dynamic> toJson() => {
        "seasons": List<dynamic>.from(seasons.map((x) => x.toJson())),
    };
}

class Season {
    Season({
        this.list,
    });

    List<Map<String, String>> list;

    factory Season.fromJson(Map<String, dynamic> json) => Season(
        list: List<Map<String, String>>.from(json["list"].map((x) => Map.from(x).map((k, v) => MapEntry<String, String>(k, v == null ? null : v)))),
    );

    Map<String, dynamic> toJson() => {
        "list": List<dynamic>.from(list.map((x) => Map.from(x).map((k, v) => MapEntry<String, dynamic>(k, v == null ? null : v)))),
    };
}

// // To parse this JSON data, do
// //
// //     final getSeasonEpisodeResponse = getSeasonEpisodeResponseFromJson(jsonString);

// import 'dart:convert';

// GetSeasonEpisodeResponse getSeasonEpisodeResponseFromJson(String str) => GetSeasonEpisodeResponse.fromJson(json.decode(str));

// String getSeasonEpisodeResponseToJson(GetSeasonEpisodeResponse data) => json.encode(data.toJson());

// class GetSeasonEpisodeResponse {
//     GetSeasonEpisodeResponse({
//         this.success,
//         this.msg,
//         this.data,
//     });

//     String success;
//     String msg;
//     Data data;

//     factory GetSeasonEpisodeResponse.fromJson(Map<String, dynamic> json) => GetSeasonEpisodeResponse(
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
//         this.seasons,
//     });

//     List<Season> seasons;

//     factory Data.fromJson(Map<String, dynamic> json) => Data(
//         seasons: List<Season>.from(json["seasons"].map((x) => Season.fromJson(x))),
//     );

//     Map<String, dynamic> toJson() => {
//         "seasons": List<dynamic>.from(seasons.map((x) => x.toJson())),
//     };
// }

// class Season {
//     Season({
//         this.season1,
//         this.promoSeason1AllEpisodes,
//     });

//     List<Map<String, String>> season1;
//     List<Map<String, String>> promoSeason1AllEpisodes;

//     factory Season.fromJson(Map<String, dynamic> json) => Season(
//         season1: json["Season 1"] == null ? null : List<Map<String, String>>.from(json["Season 1"].map((x) => Map.from(x).map((k, v) => MapEntry<String, String>(k, v == null ? null : v)))),
//         promoSeason1AllEpisodes: json["Promo | Season 1 All Episodes "] == null ? null : List<Map<String, String>>.from(json["Promo | Season 1 All Episodes "].map((x) => Map.from(x).map((k, v) => MapEntry<String, String>(k, v == null ? null : v)))),
//     );

//     Map<String, dynamic> toJson() => {
//         "Season 1": season1 == null ? null : List<dynamic>.from(season1.map((x) => Map.from(x).map((k, v) => MapEntry<String, dynamic>(k, v == null ? null : v)))),
//         "Promo | Season 1 All Episodes ": promoSeason1AllEpisodes == null ? null : List<dynamic>.from(promoSeason1AllEpisodes.map((x) => Map.from(x).map((k, v) => MapEntry<String, dynamic>(k, v == null ? null : v)))),
//     };
// }

// // // To parse this JSON data, do
// // //
// // //     final getSeasonEpisodeResponse = getSeasonEpisodeResponseFromJson(jsonString);

// // import 'dart:convert';

// // GetSeasonEpisodeResponse getSeasonEpisodeResponseFromJson(String str) => GetSeasonEpisodeResponse.fromJson(json.decode(str));

// // String getSeasonEpisodeResponseToJson(GetSeasonEpisodeResponse data) => json.encode(data.toJson());

// // class GetSeasonEpisodeResponse {
// //     GetSeasonEpisodeResponse({
// //         this.success,
// //         this.msg,
// //         this.data,
// //     });

// //     String success;
// //     String msg;
// //     Data data;

// //     factory GetSeasonEpisodeResponse.fromJson(Map<String, dynamic> json) => GetSeasonEpisodeResponse(
// //         success: json["success"],
// //         msg: json["msg"],
// //         data: Data.fromJson(json["data"]),
// //     );

// //     Map<String, dynamic> toJson() => {
// //         "success": success,
// //         "msg": msg,
// //         "data": data.toJson(),
// //     };
// // }

// // class Data {
// //     Data({
// //         this.seasons,
// //     });

// //     List<Season> seasons;

// //     factory Data.fromJson(Map<String, dynamic> json) => Data(
// //         seasons: List<Season>.from(json["seasons"].map((x) => Season.fromJson(x))),
// //     );

// //     Map<String, dynamic> toJson() => {
// //         "seasons": List<dynamic>.from(seasons.map((x) => x.toJson())),
// //     };
// // }

// // class Season {
// //     Season({
// //         this.season1,
// //     });

// //     List<Season1> season1;

// //     factory Season.fromJson(Map<String, dynamic> json) => Season(
// //         season1: List<Season1>.from(json["Season 1"].map((x) => Season1.fromJson(x))),
// //     );

// //     Map<String, dynamic> toJson() => {
// //         "Season 1": List<dynamic>.from(season1.map((x) => x.toJson())),
// //     };
// // }

// // class Season1 {
// //     Season1({
// //         this.id,
// //         this.episodeName,
// //         this.seasonId,
// //         this.videoLink,
// //         this.showBrief,
// //         this.episodeBrief,
// //         this.guestInfo,
// //         this.credits,
// //         this.relatedNews,
// //         this.albumNameId,
// //         this.photosGalleryIds,
// //         this.position,
// //         this.displayPosition,
// //         this.status,
// //         this.createdBy,
// //         this.modifiedBy,
// //         this.createdAt,
// //         this.updatedAt,
// //         this.seasonName,
// //         this.seasonDescription,
// //         this.url,
// //     });

// //     String id;
// //     String episodeName;
// //     String seasonId;
// //     String videoLink;
// //     String showBrief;
// //     String episodeBrief;
// //     String guestInfo;
// //     String credits;
// //     String relatedNews;
// //     String albumNameId;
// //     String photosGalleryIds;
// //     String position;
// //     String displayPosition;
// //     String status;
// //     String createdBy;
// //     String modifiedBy;
// //     DateTime createdAt;
// //     DateTime updatedAt;
// //     String seasonName;
// //     String seasonDescription;
// //     String url;

// //     factory Season1.fromJson(Map<String, dynamic> json) => Season1(
// //         id: json["id"],
// //         episodeName: json["episode_name"],
// //         seasonId: json["season_id"],
// //         videoLink: json["video_link"],
// //         showBrief: json["show_brief"],
// //         episodeBrief: json["episode_brief"],
// //         guestInfo: json["guest_info"],
// //         credits: json["credits"],
// //         relatedNews: json["related_news"],
// //         albumNameId: json["album_name_id"],
// //         photosGalleryIds: json["photos_gallery_ids"],
// //         position: json["position"],
// //         displayPosition: json["display_position"],
// //         status: json["status"],
// //         createdBy: json["created_by"],
// //         modifiedBy: json["modified_by"],
// //         createdAt: DateTime.parse(json["created_at"]),
// //         updatedAt: DateTime.parse(json["updated_at"]),
// //         seasonName: json["season_name"],
// //         seasonDescription: json["season_description"],
// //         url: json["url"],
// //     );

// //     Map<String, dynamic> toJson() => {
// //         "id": id,
// //         "episode_name": episodeName,
// //         "season_id": seasonId,
// //         "video_link": videoLink,
// //         "show_brief": showBrief,
// //         "episode_brief": episodeBrief,
// //         "guest_info": guestInfo,
// //         "credits": credits,
// //         "related_news": relatedNews,
// //         "album_name_id": albumNameId,
// //         "photos_gallery_ids": photosGalleryIds,
// //         "position": position,
// //         "display_position": displayPosition,
// //         "status": status,
// //         "created_by": createdBy,
// //         "modified_by": modifiedBy,
// //         "created_at": createdAt.toIso8601String(),
// //         "updated_at": updatedAt.toIso8601String(),
// //         "season_name": seasonName,
// //         "season_description": seasonDescription,
// //         "url": url,
// //     };
// // }
