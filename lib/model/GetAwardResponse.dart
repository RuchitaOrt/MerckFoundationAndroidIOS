// To parse this JSON data, do
//
//     final getAwardResponse = getAwardResponseFromJson(jsonString);

import 'dart:convert';

GetAwardResponse getAwardResponseFromJson(String str) => GetAwardResponse.fromJson(json.decode(str));

String getAwardResponseToJson(GetAwardResponse data) => json.encode(data.toJson());

class GetAwardResponse {
    GetAwardResponse({
         this.status,
         this.message,
         this.awardsList,
    });

    bool status;
    String message;
    List<AwardsList> awardsList;

    factory GetAwardResponse.fromJson(Map<String, dynamic> json) => GetAwardResponse(
        status: json["status"],
        message: json["message"],
        awardsList: List<AwardsList>.from(json["awards_list"].map((x) => AwardsList.fromJson(x))),
    );

    Map<String, dynamic> toJson() => {
        "status": status,
        "message": message,
        "awards_list": List<dynamic>.from(awardsList.map((x) => x.toJson())),
    };
}

class AwardsList {
    AwardsList({
         this.id,
         this.title,
         this.url,
         this.awardId,
         this.year,
    });

    String id;
    String title;
    String url;
    String awardId;
    String year;

    factory AwardsList.fromJson(Map<String, dynamic> json) => AwardsList(
        id: json["id"],
        title: json["title"],
        url: json["url"],
        awardId: json["award_id"],
        year: json["year"],
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "title": title,
        "url": url,
        "award_id": awardId,
        "year": year,
    };
}
