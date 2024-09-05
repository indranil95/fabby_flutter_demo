import 'package:flutter/cupertino.dart';
import 'package:flutter_fabby_demo/models/cart_data_model.dart';
import 'package:flutter_fabby_demo/models/guest_model.dart' as GuestData;
import 'package:flutter_fabby_demo/models/login_model.dart'
    as LoginData; // Add prefix
import 'package:flutter_fabby_demo/models/move_to_wishlist_model.dart';
import 'package:flutter_fabby_demo/models/remove_multiple_item_model.dart';
import 'package:flutter_fabby_demo/models/remove_single_item_model.dart';

import '../repository/cart_repository.dart';
import '../utils/logger_service.dart';
import '../utils/shared_prefs.dart';

class CartViewModel extends ChangeNotifier {
  final CartRepository repository;
  late bool _loading = false;

  CartViewModel(this.repository);

  bool get loading => _loading;

  late String _error = '';

  String get error => _error;

  CartDataModel? _cartData;

  CartDataModel? get cartData => _cartData;
  RemoveSingleItemModel? _removeSingleItemModel;

  RemoveSingleItemModel? get removeSingleItemModel => _removeSingleItemModel;
  RemoveMultipleItemModel? _removeMultipleItemModel;

  RemoveMultipleItemModel? get removeMultipleItemModel => _removeMultipleItemModel;
  MoveToWishListModel? _moveToWishListModel;

  MoveToWishListModel? get moveToWishListModel => _moveToWishListModel;

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

  Future<void> removeSingleItem(Map<String, dynamic> requestBody) async {
    _loading = true;
    notifyListeners();

    try {
      final response = await repository.removeSingleItem(requestBody);

      if (response == null) {
        throw Exception('Failed to send contact us request');
      }

      _removeSingleItemModel = response;
      _error = '';
    } catch (e) {
      _error = e.toString();
    } finally {
      _loading = false;
      notifyListeners();
    }
  }
  Future<void> moveToWishList(Map<String, dynamic> requestBody) async {
    _loading = true;
    notifyListeners();

    try {
      final response = await repository.moveToWishList(requestBody);

      if (response == null) {
        throw Exception('Failed to send contact us request');
      }

      _moveToWishListModel = response;
      _error = '';
    } catch (e) {
      _error = e.toString();
    } finally {
      _loading = false;
      notifyListeners();
    }
  }
  Future<void> removeMultipleItem(Map<String, dynamic> requestBody) async {
    _loading = true;
    notifyListeners();

    try {
      final response = await repository.removeMultipleItem(requestBody);

      if (response == null) {
        throw Exception('Failed to send contact us request');
      }

      _removeMultipleItemModel = response;
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
