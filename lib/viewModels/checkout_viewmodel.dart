import 'package:flutter/cupertino.dart';

import '../models/add_address_model.dart';
import '../models/cart_data_model.dart';
import '../models/checkout_model.dart';
import '../models/delete_address_model.dart';
import '../models/place_order_model.dart';
import '../repository/checkout_repository.dart';
import '../utils/logger_service.dart';
import '../utils/shared_prefs.dart';
import 'package:flutter_fabby_demo/models/guest_model.dart' as GuestData;
import 'package:flutter_fabby_demo/models/login_model.dart'
as LoginData; // Add prefix

class CheckoutViewModel extends ChangeNotifier {
  final CheckoutRepository repository;
  late bool _loading = false;

  CheckoutViewModel(this.repository);

  bool get loading => _loading;

  late String _error = '';

  String get error => _error;

  AddAddressModel? _addAddressData;

  AddAddressModel? get addAddressData => _addAddressData;
  CheckoutModel? _checkoutModel;

  CheckoutModel? get checkoutModel => _checkoutModel;
  DeletedAddressModel? _deletedAddressModel;

  DeletedAddressModel? get deletedAddressModel => _deletedAddressModel;
  CartDataModel? _cartData;

  CartDataModel? get cartData => _cartData;
  PlaceOrderModel? _placeOrderModelNew;

  PlaceOrderModel? get placeOrderModelNew => _placeOrderModelNew;

  Future<void> sendAddAddressMobileRequest(
      Map<String, dynamic> requestBody) async {
    _loading = true;
    notifyListeners();

    try {
      final response = await repository.addAddressMobile(requestBody);

      if (response == null) {
        throw Exception('Failed to send contact us request');
      }

      _addAddressData = response;
      _error = '';
    } catch (e) {
      _error = e.toString();
    } finally {
      _loading = false;
      notifyListeners();
    }
  }
  Future<void> checkout(Map<String, dynamic> requestBody) async {
    _loading = true;
    notifyListeners();

    try {
      final response = await repository.checkout(requestBody);

      if (response == null) {
        throw Exception('Failed to send contact us request');
      }

      _checkoutModel = response;
      _error = '';
    } catch (e) {
      _error = e.toString();
    } finally {
      _loading = false;
      notifyListeners();
    }
  }
  Future<void> deleteAddress(Map<String, dynamic> requestBody) async {
    _loading = true;
    notifyListeners();

    try {
      final response = await repository.deleteAddress(requestBody);

      if (response == null) {
        throw Exception('Failed to send contact us request');
      }

      _deletedAddressModel = response;
      _error = '';
    } catch (e) {
      _error = e.toString();
    } finally {
      _loading = false;
      notifyListeners();
    }
  }
  Future<void> cartDataList(Map<String, dynamic> requestBody) async {
    _loading = true;
    notifyListeners();

    try {
      final response = await repository.cartData(requestBody);

      if (response == null) {
        throw Exception('Failed to send contact us request');
      }

      _cartData = response;
      _error = '';
    } catch (e) {
      _error = e.toString();
    } finally {
      _loading = false;
      notifyListeners();
    }
  }
  Future<void> placeOrder(Map<String, dynamic> requestBody) async {
    _loading = true;
    notifyListeners();

    try {
      final response = await repository.placeOrder(requestBody);

      if (response == null) {
        throw Exception('Failed to send contact us request');
      }

      _placeOrderModelNew = response;
      _error = '';
    } catch (e) {
      _error = e.toString();
    } finally {
      _loading = false;
      notifyListeners();
    }
  }
  Future<Map<String, String>> accountLoginData() async {
    final hashMap = <String, String>{};

    try {
      final prefs = await SharedPrefsHelper.getInstance();
      GuestData.Data? userData = prefs.getObject<GuestData.Data>(
        'userObject',
            (Map<String, dynamic> json) => GuestData.Data.fromJson(json),
      );

      if (userData != null) {
        hashMap["mobile"] = userData.user.mobile ?? ''; // Extract mobile
        hashMap["email"] = userData.user.email ?? ''; // Extract email
        hashMap["fullname"] = userData.user.fullname ?? ''; // Extract fullname
      }
    } catch (e) {
      LoggerService.e('Exception: $e');
    }

    return hashMap;
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