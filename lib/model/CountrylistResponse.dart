// To parse this JSON data, do
//
//     final countrylistResponse = countrylistResponseFromJson(jsonString);

import 'dart:convert';

CountrylistResponse countrylistResponseFromJson(String str) =>
    CountrylistResponse.fromJson(json.decode(str));

String countrylistResponseToJson(CountrylistResponse data) =>
    json.encode(data.toJson());

class CountrylistResponse {
  CountrylistResponse({
    this.success,
    this.msg,
    this.data,
  });

  String success;
  String msg;
  Data data;

  factory CountrylistResponse.fromJson(Map<String, dynamic> json) =>
      CountrylistResponse(
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
    this.list,
  });

  List<ListElement> list;

  factory Data.fromJson(Map<String, dynamic> json) => Data(
        list: List<ListElement>.from(
            json["list"].map((x) => ListElement.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "list": List<dynamic>.from(list.map((x) => x.toJson())),
      };
}

class ListElement {
  ListElement({
    this.videoId,
    this.countryId,
    this.countryName,
  });

  String videoId;
  String countryId;
  String countryName;

  factory ListElement.fromJson(Map<String, dynamic> json) => ListElement(
        videoId: json["video_id"],
        countryId: json["country_id"],
        countryName: json["country_name"],
      );

  Map<String, dynamic> toJson() => {
        "video_id": videoId,
        "country_id": countryId,
        "country_name": countryName,
      };
}
