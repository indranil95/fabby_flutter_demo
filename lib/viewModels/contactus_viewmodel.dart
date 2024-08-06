import 'package:flutter/material.dart';
import 'package:flutter_fabby_demo/models/contactus_model.dart';
import 'package:flutter_fabby_demo/repository/contact_us_repository.dart';

class ContactUsViewModel extends ChangeNotifier {
  final ContactUsRepository repository;
  late bool _loading = false;

  ContactUsViewModel(this.repository);
  bool get loading => _loading;

  late String _error = '';
  String get error => _error;

  ContactUsModel? _contactUsData;
  ContactUsModel? get contactUsData => _contactUsData;
  Future<void> sendContactUsRequest(Map<String, dynamic> requestBody) async {
    _loading = true;
    notifyListeners();

    try {
      final response = await repository.sendContactUsRequest(requestBody);

      if (response == null) {
        throw Exception('Failed to send contact us request');
      }

      _contactUsData = response;
      _error = '';
    } catch (e) {
      _error = e.toString();
    } finally {
      _loading = false;
      notifyListeners();
    }
  }
}