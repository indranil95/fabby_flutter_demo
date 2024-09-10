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
    final data = <String, dynamic>{};
    data['slug'] = slug;
    data['articles'] = articles.map((e)=>e.toJson()).toList();
    return data;
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
    final data = <String, dynamic>{};
    data['id'] = id;
    data['title'] = title;
    data['slug'] = slug;
    data['author'] = author;
    data['description'] = description;
    data['attachments'] = attachments;
    data['image'] = image;
    data['published_on'] = publishedOn;
    return data;
  }
}