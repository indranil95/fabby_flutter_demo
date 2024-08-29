// shared_prefs_helper.dart
import 'dart:convert';
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
  // Generic method to save any object with a toJson() method
  Future<void> saveObject<T>(String key, T object, String Function(T) toJson) async {
    String jsonString = toJson(object);
    await saveString(key, jsonString);
  }

  // Generic method to retrieve any object using a fromJson() factory constructor
  T? getObject<T>(String key, T Function(Map<String, dynamic>) fromJson) {
    String? jsonString = getString(key);
    if (jsonString != null) {
      Map<String, dynamic> jsonMap = jsonDecode(jsonString);
      return fromJson(jsonMap);
    }
    return null;
  }

// Add more methods as needed for other data types
}
