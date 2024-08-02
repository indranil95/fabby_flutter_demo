import 'package:flutter/material.dart';

class NavigationService {
  // This will hold the Navigator key
  static final GlobalKey<NavigatorState> navigatorKey = GlobalKey<NavigatorState>();

  // Push a new route
  static Future<void> navigateTo(Widget page) {
    return navigatorKey.currentState?.push(
      MaterialPageRoute(builder: (context) => page),
    ) ?? Future.value();
  }

  // Push a new route and remove the previous route
  static Future<void> replaceWith(Widget page) {
    return navigatorKey.currentState?.pushReplacement(
      MaterialPageRoute(builder: (context) => page),
    ) ?? Future.value();
  }

  // Pop the current route
  static void goBack() {
    navigatorKey.currentState?.pop();
  }

  // Pop to the first route in the stack
  static void goBackToRoot() {
    navigatorKey.currentState?.popUntil((route) => route.isFirst);
  }
}
