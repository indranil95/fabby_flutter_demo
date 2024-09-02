import 'dart:convert';

BlogsDetailDataModel blogsDetailDataModelFromJson(String str) => BlogsDetailDataModel.fromJson(json.decode(str));

String blogsDetailDataModelToJson(BlogsDetailDataModel data) => json.encode(data.toJson());

class BlogsDetailDataModel {
  Data data;
  bool success;
  int error;
  String statusCode;

  BlogsDetailDataModel({
    required this.data,
    required this.success,
    required this.error,
    required this.statusCode,
  });

  factory BlogsDetailDataModel.fromJson(Map<String, dynamic> json) => BlogsDetailDataModel(
    data: Data.fromJson(json["data"]),
    success: json["success"],
    error: json["error"],
    statusCode: json["status_code"],
  );

  Map<String, dynamic> toJson() => {
    "data": data.toJson(),
    "success": success,
    "error": error,
    "status_code": statusCode,
  };
}

class Data {
  String title;
  String slug;
  String author;
  String image;
  String publishedOn;
  List<ArticleContent> articleContents;

  Data({
    required this.title,
    required this.slug,
    required this.author,
    required this.image,
    required this.publishedOn,
    required this.articleContents,
  });

  factory Data.fromJson(Map<String, dynamic> json) => Data(
    title: json["title"],
    slug: json["slug"],
    author: json["author"],
    image: json["image"],
    publishedOn: json["published_on"],
    articleContents: List<ArticleContent>.from(json["article_contents"].map((x) => ArticleContent.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "title": title,
    "slug": slug,
    "author": author,
    "image": image,
    "published_on": publishedOn,
    "article_contents": List<dynamic>.from(articleContents.map((x) => x.toJson())),
  };
}

class ArticleContent {
  int type;
  String title;
  String description;

  ArticleContent({
    required this.type,
    required this.title,
    required this.description,
  });

  factory ArticleContent.fromJson(Map<String, dynamic> json) => ArticleContent(
    type: json["type"],
    title: json["title"],
    description: json["description"],
  );

  Map<String, dynamic> toJson() => {
    "type": type,
    "title": title,
    "description": description,
  };
}