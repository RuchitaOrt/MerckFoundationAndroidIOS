// To parse this JSON data, do
//
//     final getEpisodeSeasonwiseResponse = getEpisodeSeasonwiseResponseFromJson(jsonString);

import 'dart:convert';

GetEpisodeSeasonwiseResponse getEpisodeSeasonwiseResponseFromJson(String str) => GetEpisodeSeasonwiseResponse.fromJson(json.decode(str));

String getEpisodeSeasonwiseResponseToJson(GetEpisodeSeasonwiseResponse data) => json.encode(data.toJson());

class GetEpisodeSeasonwiseResponse {
    GetEpisodeSeasonwiseResponse({
        this.success,
        this.photoUrl,
        this.episodes,
    });

    bool success;
    String photoUrl;
    List<Episode> episodes;

    factory GetEpisodeSeasonwiseResponse.fromJson(Map<String, dynamic> json) => GetEpisodeSeasonwiseResponse(
        success: json["success"],
        photoUrl: json["photo_url"],
        episodes: List<Episode>.from(json["episodes"].map((x) => Episode.fromJson(x))),
    );

    Map<String, dynamic> toJson() => {
        "success": success,
        "photo_url": photoUrl,
        "episodes": List<dynamic>.from(episodes.map((x) => x.toJson())),
    };
}

class Episode {
    Episode({
        this.id,
        this.seasonName,
        this.url,
        this.seasonDescription,
        this.position,
        this.status,
        this.createdBy,
        this.modifiedBy,
        this.createdAt,
        this.updatedAt,
        this.episodeName,
        this.seasonId,
        this.videoLink,
        this.showBrief,
        this.episodeBrief,
        this.guestInfo,
        this.credits,
        this.relatedNews,
        this.albumNameId,
        this.photosGalleryIds,
        this.displayPosition,
    });

    String id;
    String seasonName;
    String url;
    String seasonDescription;
    String position;
    String status;
    String createdBy;
    String modifiedBy;
    DateTime createdAt;
    DateTime updatedAt;
    String episodeName;
    String seasonId;
    String videoLink;
    String showBrief;
    String episodeBrief;
    String guestInfo;
    String credits;
    String relatedNews;
    String albumNameId;
    String photosGalleryIds;
    String displayPosition;

    factory Episode.fromJson(Map<String, dynamic> json) => Episode(
        id: json["id"],
        seasonName: json["season_name"],
        url: json["url"],
        seasonDescription: json["season_description"],
        position: json["position"],
        status: json["status"],
        createdBy: json["created_by"],
        modifiedBy: json["modified_by"],
        createdAt: DateTime.parse(json["created_at"]),
        updatedAt: DateTime.parse(json["updated_at"]),
        episodeName: json["episode_name"],
        seasonId: json["season_id"],
        videoLink: json["video_link"],
        showBrief: json["show_brief"],
        episodeBrief: json["episode_brief"],
        guestInfo: json["guest_info"],
        credits: json["credits"],
        relatedNews: json["related_news"],
        albumNameId: json["album_name_id"],
        photosGalleryIds: json["photos_gallery_ids"],
        displayPosition: json["display_position"],
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "season_name": seasonName,
        "url": url,
        "season_description": seasonDescription,
        "position": position,
        "status": status,
        "created_by": createdBy,
        "modified_by": modifiedBy,
        "created_at": createdAt.toIso8601String(),
        "updated_at": updatedAt.toIso8601String(),
        "episode_name": episodeName,
        "season_id": seasonId,
        "video_link": videoLink,
        "show_brief": showBrief,
        "episode_brief": episodeBrief,
        "guest_info": guestInfo,
        "credits": credits,
        "related_news": relatedNews,
        "album_name_id": albumNameId,
        "photos_gallery_ids": photosGalleryIds,
        "display_position": displayPosition,
    };
}
