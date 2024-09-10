class BlogsModel {
  BlogsModel({
    required this.data,
    required this.success,
    required this.error,
    required this.statusCode,
  });
  late final Data data;
  late final bool success;
  late final int error;
  late final String statusCode;

  BlogsModel.fromJson(Map<String, dynamic> json){
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
    required this.slug,
    required this.articles,
  });
  late final String slug;
  late final List<Articles> articles;

  Data.fromJson(Map<String, dynamic> json){
    slug = json['slug'];
    articles = List.from(json['articles']).map((e)=>Articles.fromJson(e)).toList();
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['slug'] = slug;
    _data['articles'] = articles.map((e)=>e.toJson()).toList();
    return _data;
  }
}

class Articles {
  Articles({
    required this.id,
    required this.title,
    required this.slug,
    required this.author,
    required this.description,
    required this.attachments,
    required this.image,
    required this.publishedOn,
  });
  late final int id;
  late final String title;
  late final String slug;
  late final String author;
  late final String description;
  late final List<dynamic> attachments;
  late final String image;
  late final String publishedOn;

  Articles.fromJson(Map<String, dynamic> json){
    id = json['id'];
    title = json['title'];
    slug = json['slug'];
    author = json['author'];
    description = json['description'];
    attachments = List.castFrom<dynamic, dynamic>(json['attachments']);
    image = json['image'];
    publishedOn = json['published_on'];
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['id'] = id;
    _data['title'] = title;
    _data['slug'] = slug;
    _data['author'] = author;
    _data['description'] = description;
    _data['attachments'] = attachments;
    _data['image'] = image;
    _data['published_on'] = publishedOn;
    return _data;
  }
}