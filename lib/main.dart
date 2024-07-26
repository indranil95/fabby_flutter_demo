import 'package:flutter/material.dart';
import 'package:flutter_fabby_demo/ui/start_screen.dart';

import 'utils/shared_prefs.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await initializeApp(); // Initialize SharedPrefsHelper method
  runApp(const MyApp());
}
Future<void> initializeApp() async {
  await SharedPrefsHelper.getInstance(); // Initialize SharedPrefsHelper
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: StartScreen(),
    );
  }
}
