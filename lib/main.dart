import 'package:flutter/material.dart';
import 'package:flutter_fabby_demo/models/blogs_detail_model.dart';
import 'package:flutter_fabby_demo/repository/contact_us_repository.dart';
import 'package:flutter_fabby_demo/utils/navigation_service.dart';
import 'package:flutter_fabby_demo/viewModels/contactus_viewmodel.dart';
import 'package:flutter_fabby_demo/viewModels/dashboard_viewmodel.dart';
import 'package:flutter_fabby_demo/viewModels/blogdetail_viewmodel.dart';
import 'package:provider/provider.dart';
import 'ui/screens/start_screen.dart'; // Adjust import as needed
import 'repository/dashboard_repository.dart';
import 'repository/blog_detail_repository.dart';
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
        ChangeNotifierProvider(
          create: (context) => ContactUsViewModel(
            ContactUsRepository(ApiService()),
          ),
        ),
        ChangeNotifierProvider(
          create: (context) => BlogDetailViewModel(
            BlogDetailRepository(ApiService()),
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
