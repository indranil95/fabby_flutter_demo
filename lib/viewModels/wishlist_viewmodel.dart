import 'package:flutter/cupertino.dart';
import 'package:flutter_fabby_demo/models/add_to_cart_model.dart';
import 'package:flutter_fabby_demo/models/guest_model.dart' as GuestData;
import 'package:flutter_fabby_demo/models/login_model.dart'
    as LoginData; // Add prefix
import 'package:flutter_fabby_demo/models/move_to_cart_model.dart';
import 'package:flutter_fabby_demo/models/removeitem_model.dart';
import 'package:flutter_fabby_demo/models/wishlist_model.dart';
import 'package:flutter_fabby_demo/repository/wishlist_repository.dart';

import '../utils/logger_service.dart';
import '../utils/shared_prefs.dart';

class WishlistViewModel extends ChangeNotifier {
  final WishlistRepository repository;
  late bool _loading = false;

  WishlistViewModel(this.repository);

  bool get loading => _loading;

  late String _error = '';

  String get error => _error;

  WishListModel? _wishListData;

  WishListModel? get wishListData => _wishListData;

  RemoveItemModel? _removeItemModel;

  RemoveItemModel? get removeItemModel => _removeItemModel;
  RemoveItemModel? _removeItemModelMultiple;

  RemoveItemModel? get removeItemModelMultiple => _removeItemModelMultiple;
  AddToCartModel? _addToCartModel;

  AddToCartModel? get addToCartModel => _addToCartModel;
  MoveToCartModel? _moveToCartModel;

  MoveToCartModel? get moveToCartModel => _moveToCartModel;

  Future<void> wishlist(Map<String, dynamic> requestBody) async {
    _loading = true;
    notifyListeners();

    try {
      final response = await repository.wishlist(requestBody);

      if (response == null) {
        throw Exception('Failed to send contact us request');
      }

      _wishListData = response;
      _error = '';
    } catch (e) {
      _error = e.toString();
    } finally {
      _loading = false;
      notifyListeners();
    }
  }

  Future<void> removeWishItem(Map<String, dynamic> requestBody) async {
    _loading = true;
    notifyListeners();

    try {
      final response = await repository.removeWishItem(requestBody);

      if (response == null) {
        throw Exception('Failed to send contact us request');
      }

      _removeItemModel = response;
      _error = '';
    } catch (e) {
      _error = e.toString();
    } finally {
      _loading = false;
      notifyListeners();
    }
  }

  Future<void> removeWishItemMultiple(Map<String, dynamic> requestBody) async {
    _loading = true;
    notifyListeners();

    try {
      final response = await repository.removeWishItemMultiple(requestBody);

      if (response == null) {
        throw Exception('Failed to send contact us request');
      }

      _removeItemModelMultiple = response;
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
  Future<void> moveToCart(List<int> productIds,
      int userId,
      String guestId) async {
    _loading = true;
    notifyListeners();

    try {
      final response = await repository.moveToCart(productIds,userId,guestId);

      if (response == null) {
        throw Exception('Failed to send contact us request');
      }

      _moveToCartModel = response;
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
