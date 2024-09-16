import 'package:flutter/cupertino.dart';
import 'package:flutter_fabby_demo/models/add_address_model.dart';
import 'package:flutter_fabby_demo/models/delete_address_model.dart';
import 'package:flutter_fabby_demo/models/guest_model.dart' as GuestData;
import 'package:flutter_fabby_demo/models/login_model.dart'
    as LoginData; // Add prefix
import 'package:flutter_fabby_demo/repository/member_checkout_repository.dart';

import '../models/cart_data_model.dart';
import '../models/checkout_model.dart';
import '../models/customer_address_model.dart';
import '../utils/logger_service.dart';
import '../utils/shared_prefs.dart';

class MemberCheckoutViewModel extends ChangeNotifier {
  final MemberCheckoutRepository repository;
  late bool _loading = false;

  MemberCheckoutViewModel(this.repository);

  bool get loading => _loading;

  late String _error = '';

  String get error => _error;

  AddAddressModel? _addAddressData;

  AddAddressModel? get addAddressData => _addAddressData;
  CheckoutModel? _checkoutModel;

  CheckoutModel? get checkoutModel => _checkoutModel;
  DeletedAddressModel? _deletedAddressModel;

  DeletedAddressModel? get deletedAddressModel => _deletedAddressModel;
  CustomerAddressModel? _customerAddressModel;

  CustomerAddressModel? get customerAddressModel => _customerAddressModel;
  CartDataModel? _cartData;

  CartDataModel? get cartData => _cartData;

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
  Future<void> getCustomerAddress(Map<String, dynamic> requestBody) async {
    _loading = true;
    notifyListeners();

    try {
      final response = await repository.getCustomerAddress(requestBody);

      if (response == null) {
        throw Exception('Failed to send contact us request');
      }

      _customerAddressModel = response;
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
