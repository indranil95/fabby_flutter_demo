class BannerModel {
  BannerModel({
    required this.data,
    required this.success,
    required this.error,
    required this.statusCode,
  });
  late final Data data;
  late final bool success;
  late final int error;
  late final String statusCode;

  BannerModel.fromJson(Map<String, dynamic> json){
    data = Data.fromJson(json['data']);
    success = json['success'];
    error = json['error'];
    statusCode = json['status_code'];
  }

  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    data['data'] = data.toJson();
    data['success'] = success;
    data['error'] = error;
    data['status_code'] = statusCode;
    return data;
  }
}

class Data {
  Data({
    required this.webBanners,
  });
  late final List<WebBanners> webBanners;

  Data.fromJson(Map<String, dynamic> json){
    webBanners = List.from(json['web_banners']).map((e)=>WebBanners.fromJson(e)).toList();
  }

  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    data['web_banners'] = webBanners.map((e)=>e.toJson()).toList();
    return data;
  }
}

class WebBanners {
  WebBanners({
    required this.id,
    required this.banner,
    this.mobileBanner,
    required this.title,
    required this.subtitle,
    this.catId,
    this.subCatId,
    required this.status,
    required this.createdAt,
    required this.updatedAt,
    this.deletedAt,
  });
  late final int id;
  late final String banner;
  late final Null mobileBanner;
  late final String title;
  late final String subtitle;
  late final Null catId;
  late final Null subCatId;
  late final int status;
  late final String createdAt;
  late final String updatedAt;
  late final Null deletedAt;

  WebBanners.fromJson(Map<String, dynamic> json){
    id = json['id'];
    banner = json['banner'];
    mobileBanner = null;
    title = json['title'];
    subtitle = json['subtitle'];
    catId = null;
    subCatId = null;
    status = json['status'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
    deletedAt = null;
  }

  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    data['id'] = id;
    data['banner'] = banner;
    data['mobile_banner'] = mobileBanner;
    data['title'] = title;
    data['subtitle'] = subtitle;
    data['cat_id'] = catId;
    data['sub_cat_id'] = subCatId;
    data['status'] = status;
    data['created_at'] = createdAt;
    data['updated_at'] = updatedAt;
    data['deleted_at'] = deletedAt;
    return data;
  }
}