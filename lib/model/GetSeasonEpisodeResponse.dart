import 'dart:convert';

GetSeasonEpisodeResponse getSeasonEpisodeResponseFromJson(String str) =>
    GetSeasonEpisodeResponse.fromJson(json.decode(str));

String getSeasonEpisodeResponseToJson(GetSeasonEpisodeResponse data) =>
    json.encode(data.toJson());

class GetSeasonEpisodeResponse {
  String? success;
  String? msg;
  Data? data;

  GetSeasonEpisodeResponse({this.success, this.msg, this.data});

  factory GetSeasonEpisodeResponse.fromJson(Map<String, dynamic> json) =>
      GetSeasonEpisodeResponse(
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
  List<Season>? seasons;

  Data({this.seasons});

  factory Data.fromJson(Map<String, dynamic> json) => Data(
        seasons: json["seasons"] == null
            ? null
            : List<Season>.from(
                json["seasons"].map((x) => Season.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "seasons":
            seasons == null ? null : List<dynamic>.from(seasons!.map((x) => x.toJson())),
      };
}

class Season {
  List<Map<String, String?>>? list;

  Season({this.list});

  factory Season.fromJson(Map<String, dynamic> json) => Season(
        list: json["list"] == null
            ? null
            : List<Map<String, String?>>.from(
                json["list"].map((x) => Map<String, String?>.from(x))),
      );

  Map<String, dynamic> toJson() => {
        "list": list == null
            ? null
            : List<dynamic>.from(list!.map((x) => Map<String, dynamic>.from(x))),
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
//         this.list,
//     });

//     List<Map<String, String>> list;

//     factory Season.fromJson(Map<String, dynamic> json) => Season(
//         list: List<Map<String, String>>.from(json["list"].map((x) => Map.from(x).map((k, v) => MapEntry<String, String>(k, v == null ? null : v)))),
//     );

//     Map<String, dynamic> toJson() => {
//         "list": List<dynamic>.from(list.map((x) => Map.from(x).map((k, v) => MapEntry<String, dynamic>(k, v == null ? null : v)))),
//     };
// }
