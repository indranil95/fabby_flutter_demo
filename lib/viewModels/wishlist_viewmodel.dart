import 'package:flutter/cupertino.dart';
import 'package:flutter_fabby_demo/models/wishlist_model.dart';
import 'package:flutter_fabby_demo/repository/wishlist_repository.dart';
import 'package:flutter_fabby_demo/models/guest_model.dart' as GuestData;
import 'package:flutter_fabby_demo/models/login_model.dart' as LoginData;  // Add prefix
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
  Future<String> getMainId() async {
    String mainId="";
    try{
      String? id;
      String loginId = "";
      final prefs = await SharedPrefsHelper.getInstance();
      LoginData.Data? loginUserData = prefs.getObject<LoginData.Data>(
        'loginUserObject',
            (Map<String, dynamic> json) => LoginData.Data.fromJson(json),
      );
      if (loginUserData != null) {
        loginId=loginUserData.id.toString();
      }
      GuestData.User? userData = prefs.getObject<GuestData.User>(
        'userObject',
            (Map<String, dynamic> json) => GuestData.User.fromJson(json),
      );
      if (userData != null) {
        id=userData.id.toString();
      }
      mainId = (id != null && id.isNotEmpty) ? id : loginId;

    }
    catch(e){
      LoggerService.e('Exception: $e');
    }

    return mainId;

  }
  Future<String?> getGuestId() async {
    final prefs = await SharedPrefsHelper.getInstance();
    return prefs.getString('guestId');
  }
}