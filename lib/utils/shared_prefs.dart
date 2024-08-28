// shared_prefs_helper.dart
import 'package:shared_preferences/shared_preferences.dart';

class SharedPrefsHelper {
  static SharedPrefsHelper? _instance;
  static SharedPreferences? _prefs;

  // Singleton pattern to ensure only one instance
  SharedPrefsHelper._privateConstructor();

  static Future<SharedPrefsHelper> getInstance() async {
    if (_instance == null) {
      _instance = SharedPrefsHelper._privateConstructor();
      _prefs = await SharedPreferences.getInstance();
    }
    return _instance!;
  }

  Future<void> saveString(String key, String value) async {
    await _prefs?.setString(key, value);
  }

  String? getString(String key) {
    return _prefs?.getString(key);
  }

  Future<void> saveBool(String key, bool value) async {
    await _prefs?.setBool(key, value);
  }

  bool? getBool(String key) {
    return _prefs?.getBool(key);
  }
  // Method to clear all stored preferences
  Future<void> clearAll() async {
    await _prefs?.clear();
  }

// Add more methods as needed for other data types
}
