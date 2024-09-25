import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter_fabby_demo/models/login_model.dart';
import 'package:flutter_fabby_demo/repository/login_repository.dart';
import 'package:flutter_fabby_demo/utils/logger_service.dart';

import '../utils/shared_prefs.dart';

class LoginViewModel extends ChangeNotifier {
  final LoginRepository repository;
  late bool _loading = false;

  LoginViewModel(this.repository);

  bool get loading => _loading;

  late String _error = '';

  String get error => _error;

  LoginModel? _loginData;

  LoginModel? get loginData => _loginData;

  Future<void> sendLoginRequest(Map<String, dynamic> requestBody) async {
    _loading = true;
    notifyListeners();

    try {
      final response = await repository.sendLoginRequest(requestBody);

      if (response == null) {
        LoggerService.d("check:","response == null Failed to send contact us request");
        throw Exception('Failed to send contact us request');
      }

      _loginData = response;
      _error = '';
      if(response.statusCode == 200){
        final prefs = await SharedPrefsHelper.getInstance();
        await prefs.saveObject<Data>('loginUserObject', response.data!,(Data data) => jsonEncode(data.toJson()), );
        await prefs.saveString('loginSuccess', "1");
        await prefs.saveString('accessToken', response.token.toString());
      }

    } catch (e) {
      LoggerService.d("check:","exception $e");
      _error = e.toString();
    } finally {
      _loading = false;
      notifyListeners();
    }
  }
}
