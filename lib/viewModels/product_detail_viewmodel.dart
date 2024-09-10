import 'package:flutter/cupertino.dart';
import 'package:flutter_fabby_demo/models/check_estimate_delivery_model.dart';
import 'package:flutter_fabby_demo/models/favourite_model.dart';
import 'package:flutter_fabby_demo/models/guest_model.dart' as GuestData;
import 'package:flutter_fabby_demo/models/login_model.dart'
    as LoginData; // Add prefix
import 'package:flutter_fabby_demo/models/product_detail_model.dart';
import 'package:flutter_fabby_demo/repository/product_detail_repository.dart';
import 'package:flutter_fabby_demo/utils/logger_service.dart';

import '../models/add_to_cart_model.dart';
import '../utils/shared_prefs.dart';

class ProductDetailViewModel extends ChangeNotifier {
  final ProductDetailRepository repository;
  late bool _loading = false;

  ProductDetailViewModel(this.repository);

  bool get loading => _loading;

  late String _error = '';

  String get error => _error;

  ProductDetailModel? _productDetailModel;

  ProductDetailModel? get productDetailMode => _productDetailModel;
  CheckEstimateDeliveryModel? _checkEstimateDeliveryModel;

  CheckEstimateDeliveryModel? get checkEstimateDeliveryModel =>
      _checkEstimateDeliveryModel;
  FavouriteModel? _favouriteModel;

  FavouriteModel? get favouriteModel => _favouriteModel;
  AddToCartModel? _addToCartModel;

  AddToCartModel? get addToCartModel => _addToCartModel;

  Future<void> getProductDetail(
      String productId, String userId, String guestId) async {
    _loading = true;
    notifyListeners();

    try {
      final response =
          await repository.getProductDetail(productId, userId, guestId);

      if (response == null) {
        LoggerService.d(
            "check:", "response == null Failed to send contact us request");
        throw Exception('Failed to send contact us request');
      }

      _productDetailModel = response;
      _error = '';
    } catch (e) {
      LoggerService.d("check:", "exception $e");
      _error = e.toString();
    } finally {
      _loading = false;
      notifyListeners();
    }
  }

  Future<void> checkEstimateDelivery(String deliveryPostCode) async {
    _loading = true;
    notifyListeners();

    try {
      final response = await repository.checkEstimateDelivery(deliveryPostCode);

      if (response == null) {
        throw Exception('Failed to send contact us request');
      }

      _checkEstimateDeliveryModel = response;
      _error = '';
    } catch (e) {
      _error = e.toString();
    } finally {
      _loading = false;
      notifyListeners();
    }
  }

  Future<void> favourite(Map<String, dynamic> requestBody) async {
    _loading = true;
    notifyListeners();

    try {
      final response = await repository.favourite(requestBody);

      if (response == null) {
        throw Exception('Failed to send contact us request');
      }

      _favouriteModel = response;
      _error = '';
    } catch (e) {
      _error = e.toString();
    } finally {
      _loading = false;
      notifyListeners();
    }
  }

  Future<void> addToCart(Map<String, dynamic> requestBody) async {
    _loading = true;
    notifyListeners();

    try {
      final response = await repository.addToCart(requestBody);

      if (response == null) {
        throw Exception('Failed to send contact us request');
      }

      _addToCartModel = response;
      _error = '';
    } catch (e) {
      _error = e.toString();
    } finally {
      _loading = false;
      notifyListeners();
    }
  }

  Future<String> getMainId() async {
    String mainId = "";
    try {
      String? id;
      String loginId = "";
      final prefs = await SharedPrefsHelper.getInstance();
      LoginData.Data? loginUserData = prefs.getObject<LoginData.Data>(
        'loginUserObject',
        (Map<String, dynamic> json) => LoginData.Data.fromJson(json),
      );
      if (loginUserData != null) {
        loginId = loginUserData.id.toString();
      }
      GuestData.User? userData = prefs.getObject<GuestData.User>(
        'userObject',
        (Map<String, dynamic> json) => GuestData.User.fromJson(json),
      );
      if (userData != null) {
        id = userData.id.toString();
      }
      mainId = (id != null && id.isNotEmpty) ? id : loginId;
    } catch (e) {
      LoggerService.e('Exception: $e');
    }

    return mainId;
  }

  Future<String?> getGuestId() async {
    final prefs = await SharedPrefsHelper.getInstance();
    return prefs.getString('guestId');
  }
}
