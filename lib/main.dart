import 'package:flutter/material.dart';
import 'package:flutter_fabby_demo/utils/navigation_service.dart';
import 'package:flutter_fabby_demo/viewModels/dashboard_viewmodel.dart';
import 'package:provider/provider.dart';
import 'ui/screens/start_screen.dart'; // Adjust import as needed
import 'repository/dashboard_repository.dart';
import 'network/api_service.dart';
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
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (context) => DashboardViewModel(
            DashboardRepository(ApiService()),
          ),
        ),
      ],
      child: MaterialApp(
        navigatorKey: NavigationService.navigatorKey,
        title: 'Flutter Demo',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        home: const StartScreen(), // Your StartScreen as the home screen
      ),
    );
  }
}
