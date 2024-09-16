import 'package:flutter/cupertino.dart';
import 'package:flutter_fabby_demo/models/guest_model.dart' as GuestData;
import 'package:flutter_fabby_demo/models/login_model.dart'
as LoginData; // Add prefix
import 'package:flutter_fabby_demo/models/notification_model.dart';
import 'package:flutter_fabby_demo/repository/order_History_repository.dart';

import '../models/pre_order_model.dart';
import '../repository/notification_repository.dart';
import '../utils/logger_service.dart';
import '../utils/shared_prefs.dart';

class NotificationViewmodel extends ChangeNotifier {
  final NotificationRepository repository;
  late bool _loading = false;

  NotificationViewmodel(this.repository);

  bool get loading => _loading;

  late String _error = '';

  String get error => _error;

  NotificationModel? _notificationModel;

  NotificationModel? get notificationModel => _notificationModel;

  // Future<void> getPreOrder(
  //     int userId) async {
  //   _loading = true;
  //   notifyListeners();
  //
  //   try {
  //     final response = await repository.getPreviousOrder(userId);
  //
  //     if (response == null) {
  //       throw Exception('Failed to send contact us request');
  //     }
  //
  //     _previousOrderModel = response;
  //     _error = '';
  //   } catch (e) {
  //     _error = e.toString();
  //   } finally {
  //     _loading = false;
  //     notifyListeners();
  //   }
  // }

  Future<void> getNotificationList(Map<String, dynamic> requestBody) async {
    _loading = true;
    notifyListeners();

    try {
      final response = await repository.getNotification(requestBody);

      if (response == null) {
        throw Exception('Failed to send contact us request');
      }

      _notificationModel = response;
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
