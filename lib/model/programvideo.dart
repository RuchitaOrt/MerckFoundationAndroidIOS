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

class Homecontent {
  String id;
  String contentType;
  String pageContent;
  String title;
  String shortDescription;
  Null image;
  String altText;
  String url;
  String utubeUrl;
  String metaKeyword;
  Null metaDescription;
  String status;
  String createdAt;
  String updatedAt;

  Homecontent(
      {this.id,
      this.contentType,
      this.pageContent,
      this.title,
      this.shortDescription,
      this.image,
      this.altText,
      this.url,
      this.utubeUrl,
      this.metaKeyword,
      this.metaDescription,
      this.status,
      this.createdAt,
      this.updatedAt});

  Homecontent.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    contentType = json['content_type'];
    pageContent = json['page_content'];
    title = json['title'];
    shortDescription = json['short_description'];
    image = json['image'];
    altText = json['alt_text'];
    url = json['url'];
    utubeUrl = json['utube_url'];
    metaKeyword = json['meta_keyword'];
    metaDescription = json['meta_description'];
    status = json['status'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['content_type'] = this.contentType;
    data['page_content'] = this.pageContent;
    data['title'] = this.title;
    data['short_description'] = this.shortDescription;
    data['image'] = this.image;
    data['alt_text'] = this.altText;
    data['url'] = this.url;
    data['utube_url'] = this.utubeUrl;
    data['meta_keyword'] = this.metaKeyword;
    data['meta_description'] = this.metaDescription;
    data['status'] = this.status;
    data['created_at'] = this.createdAt;
    data['updated_at'] = this.updatedAt;
    return data;
  }
}
