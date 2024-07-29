import 'package:flutter/material.dart';
import '../repository/dashboard_repository.dart';
import '../models/banner_model.dart';

class DashboardViewModel extends ChangeNotifier {
  final DashboardRepository repository;
  BannerModel? _data;
  bool _loading = false;
  String _error = '';

  DashboardViewModel(this.repository);

  BannerModel? get data => _data;
  bool get loading => _loading;
  String get error => _error;

  Future<void> loadBanner() async {
    _loading = true;
    notifyListeners();

    try {
      final response = await repository.fetchData();
      _data = response;
      _error = '';
    } catch (e) {
      _error = e.toString();
    } finally {
      _loading = false;
      notifyListeners();
    }
  }
}
