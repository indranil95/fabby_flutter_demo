import 'package:flutter/material.dart';
import 'package:flutter_fabby_demo/models/all_product_model.dart';
import 'package:flutter_fabby_demo/models/guest_model.dart';
import '../AppConstant/app_constant.dart';
import '../repository/dashboard_repository.dart';
import '../models/banner_model.dart';
import '../utils/shared_prefs.dart';

class DashboardViewModel extends ChangeNotifier {
  final DashboardRepository repository;
  BannerModel? _data;
  AllProductModel? _allProductData;
  GuestModel? _guestData;
  bool _loading = false;
  bool guestSuccess = false;
  String _error = '';
  List<String> categories = []; // Add this line

  DashboardViewModel(this.repository);

  BannerModel? get data => _data;
  bool get loading => _loading;
  String get error => _error;
  AllProductModel? get allProductData => _allProductData;
  GuestModel? get guestData => _guestData;

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
  Future<void> loadGuest() async {
    _loading = true;
    notifyListeners();

    try {
      final response = await repository.guestData();
      _guestData = response;
      _error = '';
      final prefs = await SharedPrefsHelper.getInstance();
      await prefs.saveString('accessToken', response!.token);
      await prefs.saveString('guestId', response.data.guestId);
      await prefs.saveString('userObject', response.data.user.toString());
      await prefs.saveString('guestLogin', "1");
      guestSuccess=true;
    } catch (e) {
      _error = e.toString();
    } finally {
      _loading = false;
      notifyListeners();
    }
  }
  Future<String?> getGuestLogin() async {
    final prefs = await SharedPrefsHelper.getInstance();
    return prefs.getString('guestLogin');
  }

  Future<void> loadAllProduct(String selectedItem,
      String limit,
      ) async {
    _loading = true;
    notifyListeners();

    try {
      final response = await repository.allProductData(selectedItem,AppConstants.productPaginate,limit,AppConstants.charLimit);
      _allProductData = response;
      _error = '';
    } catch (e) {
      _error = e.toString();
    } finally {
      _loading = false;
      notifyListeners();
    }
  }
  void loadCategories() {
    categories = [
      "All Products",
      "Dog",
      "Cat",
    ];
    notifyListeners();
  }
}
