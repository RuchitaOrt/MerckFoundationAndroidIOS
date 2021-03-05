class Programvideo {
  String id;
  String videoLink;
  String videoDesc;
  String countryId;
  String categoryId;
  String year;
  String status;
  String createdAt;
  String updatedAt;

  Programvideo(
      {this.id,
      this.videoLink,
      this.videoDesc,
      this.countryId,
      this.categoryId,
      this.year,
      this.status,
      this.createdAt,
      this.updatedAt});

  Programvideo.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    videoLink = json['video_link'];
    videoDesc = json['video_desc'];
    countryId = json['country_id'];
    categoryId = json['category_id'];
    year = json['year'];
    status = json['status'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['video_link'] = this.videoLink;
    data['video_desc'] = this.videoDesc;
    data['country_id'] = this.countryId;
    data['category_id'] = this.categoryId;
    data['year'] = this.year;
    data['status'] = this.status;
    data['created_at'] = this.createdAt;
    data['updated_at'] = this.updatedAt;
    return data;
  }
}
