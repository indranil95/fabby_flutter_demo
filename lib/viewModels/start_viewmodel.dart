import 'package:flutter/cupertino.dart';
import 'package:flutter_fabby_demo/repository/start_repository.dart';

import '../models/guest_model.dart';
import '../utils/shared_prefs.dart';

class StartViewModel extends ChangeNotifier {
  StartViewModel(this.repository);

  late StartRepository repository;
  GuestModel? _guestData;

  GuestModel? get guestData => _guestData;
  bool _loading = false;
  bool guestSuccess = false;
  String _error = '';

  bool get loading => _loading;

  String get error => _error;

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
      guestSuccess = true;
    } catch (e) {
      _error = e.toString();
    } finally {
      _loading = false;
      notifyListeners();
    }
  }
  Future<String?> getGuestId() async {
    final prefs = await SharedPrefsHelper.getInstance();
    return prefs.getString('guestId');
  }
  Future<String?> getLoginSuccess() async {
    final prefs = await SharedPrefsHelper.getInstance();
    return prefs.getString('loginSuccess');
  }
}
