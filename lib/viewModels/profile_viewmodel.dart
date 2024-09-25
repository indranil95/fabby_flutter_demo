import 'package:flutter/cupertino.dart';
import 'package:flutter_fabby_demo/models/profile_model.dart';
import 'package:flutter_fabby_demo/repository/profile_repository.dart';

import '../utils/logger_service.dart';
import '../utils/shared_prefs.dart';

class ProfileViewModel extends ChangeNotifier {
  final ProfileRepository repository;
  late bool _loading = false;

  ProfileViewModel(this.repository);

  bool get loading => _loading;

  late String _error = '';

  String get error => _error;

  ProfileModel? _profileData;

  ProfileModel? get profileData => _profileData;

  // Fetch profile data
  Future<void> getProfile(
  int userId)
    async {
    _loading = true;
    notifyListeners();

    try {
      final response = await repository.getProfile(userId);

      if (response == null) {
        throw Exception('Failed to fetch profile data');
      }

      _profileData = response;
      _error = '';
    } catch (e) {
      _error = e.toString();
    } finally {
      _loading = false;
      notifyListeners();
    }
  }

  // Fetch profile data
  Future<void> updateProfile(Map<String, dynamic> requestBody)
  async {
    _loading = true;
    notifyListeners();

    try {
      final response = await repository.updateProfile(requestBody);

      if (response == null) {
        throw Exception('Failed to update profile data');
      }

      _profileData = response;
      _error = '';
    } catch (e) {
      _error = e.toString();
    } finally {
      _loading = false;
      notifyListeners();
    }
  }

  // Utility function to get the main user ID (either guest or logged in)
  Future<String> getMainId() async {
    String mainId = "";
    try {
      final prefs = await SharedPrefsHelper.getInstance();
      String? loginId = prefs.getString('loginId');
      String? guestId = prefs.getString('guestId');
      mainId = guestId?.isNotEmpty == true ? guestId! : (loginId ?? "");
    } catch (e) {
      LoggerService.e('number: $mainId');
      LoggerService.e('Exception: $e');
    }
    return mainId;
  }
}