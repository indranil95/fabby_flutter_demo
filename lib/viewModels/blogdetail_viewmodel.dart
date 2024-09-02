import 'package:flutter/material.dart';
import 'package:flutter_fabby_demo/models/blogs_detail_model.dart';
import 'package:flutter_fabby_demo/repository/blog_detail_repository.dart';


class BlogDetailViewModel extends ChangeNotifier {
  final BlogDetailRepository repository;
  late bool _loading = false;

  BlogDetailViewModel(this.repository);
  bool get loading => _loading;

  late String _error = '';
  String get error => _error;

  BlogsDetailDataModel? _blogsDetailData;
  BlogsDetailDataModel? get blogsDetailData => _blogsDetailData;

  Future<void> getBlogDetailRequest(String slug) async {
    _loading = true;
    notifyListeners();

    try {
      final response = await repository.blogDetails(slug);

      if (response == null) {
        throw Exception('Failed to send contact us request');
      }

      _blogsDetailData = response;
      _error = '';
    } catch (e) {
      _error = e.toString();
    } finally {
      _loading = false;
      notifyListeners();
    }
  }
}