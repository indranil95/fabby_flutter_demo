import 'package:flutter/cupertino.dart';

import '../models/signup_model.dart';
import '../repository/signup_repository.dart';


class SignUpViewModel extends ChangeNotifier {
  final SignupRepository repository;
  late bool _loading = false;

  SignUpViewModel(this.repository);
  bool get loading => _loading;

  late String _error = '';
  String get error => _error;

  SignUpModel? _signUpData;
  SignUpModel? get signUpData => _signUpData;
  Future<void> sendSignUpRequest(Map<String, dynamic> requestBody) async {
    _loading = true;
    notifyListeners();

    try {
      final response = await repository.sendSignUpRequest(requestBody);

      if (response == null) {
        throw Exception('Failed to send contact us request');
      }

      _signUpData = response;
      _error = '';
    } catch (e) {
      _error = e.toString();
    } finally {
      _loading = false;
      notifyListeners();
    }
  }
}
