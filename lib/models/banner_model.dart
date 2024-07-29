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
    final _data = <String, dynamic>{};
    _data['data'] = data.toJson();
    _data['success'] = success;
    _data['error'] = error;
    _data['status_code'] = statusCode;
    return _data;
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
    final _data = <String, dynamic>{};
    _data['web_banners'] = webBanners.map((e)=>e.toJson()).toList();
    return _data;
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
    final _data = <String, dynamic>{};
    _data['id'] = id;
    _data['banner'] = banner;
    _data['mobile_banner'] = mobileBanner;
    _data['title'] = title;
    _data['subtitle'] = subtitle;
    _data['cat_id'] = catId;
    _data['sub_cat_id'] = subCatId;
    _data['status'] = status;
    _data['created_at'] = createdAt;
    _data['updated_at'] = updatedAt;
    _data['deleted_at'] = deletedAt;
    return _data;
  }
}