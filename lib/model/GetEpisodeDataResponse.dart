import 'dart:convert';

GetEpisodeDataResponse getEpisodeDataResponseFromJson(String str) =>
    GetEpisodeDataResponse.fromJson(json.decode(str));

String getEpisodeDataResponseToJson(GetEpisodeDataResponse data) =>
    json.encode(data.toJson());

class GetEpisodeDataResponse {
  bool? success;
  String? url;
  String? photoUrl;
  String? msg;
  List<ListElement>? list;

  GetEpisodeDataResponse({
    this.success,
    this.url,
    this.photoUrl,
    this.msg,
    this.list,
  });

  factory GetEpisodeDataResponse.fromJson(Map<String, dynamic> json) =>
      GetEpisodeDataResponse(
        success: json["success"],
        url: json["url"],
        photoUrl: json["photo_url"],
        msg: json["msg"],
        list: json["list"] == null
            ? null
            : List<ListElement>.from(
                json["list"].map((x) => ListElement.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "success": success,
        "url": url,
        "photo_url": photoUrl,
        "msg": msg,
        "list": list?.map((x) => x.toJson()).toList(),
      };
}

class ListElement {
  String? id;
  String? episodeName;
  String? seasonId;
  String? videoLink;
  String? showBrief;
  String? episodeBrief;
  String? guestInfo;
  String? credits;
  String? relatedNews;
  String? albumNameId;
  String? photosGalleryIds;
  String? position;
  String? displayPosition;
  String? status;
  String? createdBy;
  String? modifiedBy;
  DateTime? createdAt;
  DateTime? updatedAt;
  String? seasonName;
  String? seasonDescription;
  String? url;
  List<List<PhotoList>>? photoList;

  ListElement({
    this.id,
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
    this.position,
    this.displayPosition,
    this.status,
    this.createdBy,
    this.modifiedBy,
    this.createdAt,
    this.updatedAt,
    this.seasonName,
    this.seasonDescription,
    this.url,
    this.photoList,
  });

  factory ListElement.fromJson(Map<String, dynamic> json) => ListElement(
        id: json["id"],
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
        position: json["position"],
        displayPosition: json["display_position"],
        status: json["status"],
        createdBy: json["created_by"],
        modifiedBy: json["modified_by"],
        createdAt: json["created_at"] == null
            ? null
            : DateTime.tryParse(json["created_at"]),
        updatedAt: json["updated_at"] == null
            ? null
            : DateTime.tryParse(json["updated_at"]),
        seasonName: json["season_name"],
        seasonDescription: json["season_description"],
        url: json["url"],
        photoList: json["photo_list"] == null
            ? null
            : List<List<PhotoList>>.from(json["photo_list"].map(
                (x) => List<PhotoList>.from(x.map((x) => PhotoList.fromJson(x))))),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
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
        "position": position,
        "display_position": displayPosition,
        "status": status,
        "created_by": createdBy,
        "modified_by": modifiedBy,
        "created_at": createdAt?.toIso8601String(),
        "updated_at": updatedAt?.toIso8601String(),
        "season_name": seasonName,
        "season_description": seasonDescription,
        "url": url,
        "photo_list": photoList == null
            ? null
            : List<dynamic>.from(photoList!.map((x) =>
                List<dynamic>.from(x.map((x) => x.toJson())))),
      };
}

class PhotoList {
  String? photo;
  String? photoDescription;
  String? photoCatgName;
  String? photoCategoryUrl;
  String? albumUrl;
  String? albumName;

  PhotoList({
    this.photo,
    this.photoDescription,
    this.photoCatgName,
    this.photoCategoryUrl,
    this.albumUrl,
    this.albumName,
  });

  factory PhotoList.fromJson(Map<String, dynamic> json) => PhotoList(
        photo: json["photo"],
        photoDescription: json["photo_description"],
        photoCatgName: json["photo_catg_name"],
        photoCategoryUrl: json["photo_category_url"],
        albumUrl: json["album_url"],
        albumName: json["album_name"],
      );

  Map<String, dynamic> toJson() => {
        "photo": photo,
        "photo_description": photoDescription,
        "photo_catg_name": photoCatgName,
        "photo_category_url": photoCategoryUrl,
        "album_url": albumUrl,
        "album_name": albumName,
      };
}

// // To parse this JSON data, do
// //
// //     final getEpisodeDataResponse = getEpisodeDataResponseFromJson(jsonString);

// import 'dart:convert';

// GetEpisodeDataResponse getEpisodeDataResponseFromJson(String str) => GetEpisodeDataResponse.fromJson(json.decode(str));

// String getEpisodeDataResponseToJson(GetEpisodeDataResponse data) => json.encode(data.toJson());

// class GetEpisodeDataResponse {
//     GetEpisodeDataResponse({
//         this.success,
//         this.url,
//         this.photoUrl,
//         this.msg,
//         this.list,
//     });

//     bool success;
//     String url;
//     String photoUrl;
//     String msg;
//     List<ListElement> list;

//     factory GetEpisodeDataResponse.fromJson(Map<String, dynamic> json) => GetEpisodeDataResponse(
//         success: json["success"],
//         url: json["url"],
//         photoUrl: json["photo_url"],
//         msg: json["msg"],
//         list: List<ListElement>.from(json["list"].map((x) => ListElement.fromJson(x))),
//     );

//     Map<String, dynamic> toJson() => {
//         "success": success,
//         "url": url,
//         "photo_url": photoUrl,
//         "msg": msg,
//         "list": List<dynamic>.from(list.map((x) => x.toJson())),
//     };
// }

// class ListElement {
//     ListElement({
//         this.id,
//         this.episodeName,
//         this.seasonId,
//         this.videoLink,
//         this.showBrief,
//         this.episodeBrief,
//         this.guestInfo,
//         this.credits,
//         this.relatedNews,
//         this.albumNameId,
//         this.photosGalleryIds,
//         this.position,
//         this.displayPosition,
//         this.status,
//         this.createdBy,
//         this.modifiedBy,
//         this.createdAt,
//         this.updatedAt,
//         this.seasonName,
//         this.seasonDescription,
//         this.url,
//         this.photoList,
//     });

//     String id;
//     String episodeName;
//     String seasonId;
//     String videoLink;
//     String showBrief;
//     String episodeBrief;
//     String guestInfo;
//     String credits;
//     String relatedNews;
//     String albumNameId;
//     String photosGalleryIds;
//     String position;
//     String displayPosition;
//     String status;
//     String createdBy;
//     String modifiedBy;
//     DateTime createdAt;
//     DateTime updatedAt;
//     String seasonName;
//     String seasonDescription;
//     String url;
//     List<List<PhotoList>> photoList;

//     factory ListElement.fromJson(Map<String, dynamic> json) => ListElement(
//         id: json["id"],
//         episodeName: json["episode_name"],
//         seasonId: json["season_id"],
//         videoLink: json["video_link"],
//         showBrief: json["show_brief"],
//         episodeBrief: json["episode_brief"],
//         guestInfo: json["guest_info"],
//         credits: json["credits"],
//         relatedNews: json["related_news"],
//         albumNameId: json["album_name_id"],
//         photosGalleryIds: json["photos_gallery_ids"],
//         position: json["position"],
//         displayPosition: json["display_position"],
//         status: json["status"],
//         createdBy: json["created_by"],
//         modifiedBy: json["modified_by"],
//         createdAt: DateTime.parse(json["created_at"]),
//         updatedAt: DateTime.parse(json["updated_at"]),
//         seasonName: json["season_name"],
//         seasonDescription: json["season_description"],
//         url: json["url"],
//         photoList: List<List<PhotoList>>.from(json["photo_list"].map((x) => List<PhotoList>.from(x.map((x) => PhotoList.fromJson(x))))),
//     );

//     Map<String, dynamic> toJson() => {
//         "id": id,
//         "episode_name": episodeName,
//         "season_id": seasonId,
//         "video_link": videoLink,
//         "show_brief": showBrief,
//         "episode_brief": episodeBrief,
//         "guest_info": guestInfo,
//         "credits": credits,
//         "related_news": relatedNews,
//         "album_name_id": albumNameId,
//         "photos_gallery_ids": photosGalleryIds,
//         "position": position,
//         "display_position": displayPosition,
//         "status": status,
//         "created_by": createdBy,
//         "modified_by": modifiedBy,
//         "created_at": createdAt.toIso8601String(),
//         "updated_at": updatedAt.toIso8601String(),
//         "season_name": seasonName,
//         "season_description": seasonDescription,
//         "url": url,
//         "photo_list": List<dynamic>.from(photoList.map((x) => List<dynamic>.from(x.map((x) => x.toJson())))),
//     };
// }

// class PhotoList {
//     PhotoList({
//         this.photo,
//         this.photoDescription,
//         this.photoCatgName,
//         this.photoCategoryUrl,
//         this.albumUrl,
//         this.albumName,
//     });

//     String photo;
//     String photoDescription;
//     String photoCatgName;
//     String photoCategoryUrl;
//     String albumUrl;
//     String albumName;

//     factory PhotoList.fromJson(Map<String, dynamic> json) => PhotoList(
//         photo: json["photo"],
//         photoDescription: json["photo_description"],
//         photoCatgName: json["photo_catg_name"],
//         photoCategoryUrl: json["photo_category_url"],
//         albumUrl: json["album_url"],
//         albumName: json["album_name"],
//     );

//     Map<String, dynamic> toJson() => {
//         "photo": photo,
//         "photo_description": photoDescription,
//         "photo_catg_name": photoCatgName,
//         "photo_category_url": photoCategoryUrl,
//         "album_url": albumUrl,
//         "album_name": albumName,
//     };
// }
