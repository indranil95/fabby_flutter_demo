import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_fabby_demo/repository/cart_repository.dart';
import 'package:flutter_fabby_demo/repository/contact_us_repository.dart';
import 'package:flutter_fabby_demo/repository/forgotpassword_repository.dart';
import 'package:flutter_fabby_demo/repository/login_repository.dart';
import 'package:flutter_fabby_demo/repository/member_checkout_repository.dart';
import 'package:flutter_fabby_demo/repository/otp_repository.dart';
import 'package:flutter_fabby_demo/repository/product_detail_repository.dart';
import 'package:flutter_fabby_demo/repository/resetpassword_otp_repository.dart';
import 'package:flutter_fabby_demo/repository/resetpassword_repository.dart';
import 'package:flutter_fabby_demo/repository/signup_repository.dart';
import 'package:flutter_fabby_demo/repository/start_repository.dart';
import 'package:flutter_fabby_demo/repository/wishlist_repository.dart';
import 'package:flutter_fabby_demo/utils/navigation_service.dart';
import 'package:flutter_fabby_demo/viewModels/cart_viewModel.dart';
import 'package:flutter_fabby_demo/viewModels/contactus_viewmodel.dart';
import 'package:flutter_fabby_demo/viewModels/dashboard_viewmodel.dart';
import 'package:flutter_fabby_demo/viewModels/blogdetail_viewmodel.dart';
import 'package:flutter_fabby_demo/viewModels/forgotpassword_viewmodel.dart';
import 'package:flutter_fabby_demo/viewModels/login_viewmodel.dart';
import 'package:flutter_fabby_demo/viewModels/member_checkout_viewModel.dart';
import 'package:flutter_fabby_demo/viewModels/otp_viewmodel.dart';
import 'package:flutter_fabby_demo/viewModels/product_detail_viewmodel.dart';
import 'package:flutter_fabby_demo/viewModels/resetpassword_viewmodel.dart';
import 'package:flutter_fabby_demo/viewModels/resetpasswordotp_viewmodel.dart';
import 'package:flutter_fabby_demo/viewModels/signup_viewmodel.dart';
import 'package:flutter_fabby_demo/viewModels/start_viewmodel.dart';
import 'package:flutter_fabby_demo/viewModels/wishlist_viewmodel.dart';
import 'package:provider/provider.dart';
import 'ui/screens/start_screen.dart'; // Adjust import as needed
import 'repository/dashboard_repository.dart';
import 'repository/blog_detail_repository.dart';
import 'network/api_service.dart';
import 'utils/shared_prefs.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await initializeApp(); // Initialize SharedPrefsHelper method
  //debugPaintSizeEnabled = true; // Enable debug painting
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
          create: (context) => StartViewModel(
            StartRepository(ApiService()),
          ),
        ),
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
          create: (context) => LoginViewModel(
            LoginRepository(ApiService()),
          ),
        ),
        ChangeNotifierProvider(
          create: (context) => SignUpViewModel(
            SignupRepository(ApiService()),
          ),
        ),
        ChangeNotifierProvider(
          create: (context) => OtpViewModel(
            OtpRepository(ApiService()),
          ),
        ),
        ChangeNotifierProvider(
          create: (context) => ResetPasswordViewModel(
            ResetPasswordRepository(ApiService()),
          ),
        ),
        ChangeNotifierProvider(
          create: (context) => ResetPasswordOtpViewModel(
            ResetPasswordOtpRepository(ApiService()),
          ),
        ),
        ChangeNotifierProvider(
          create: (context) => ForgotPasswordViewModel(
            ForgotPasswordRepository(ApiService()),
          ),
        ),
        ChangeNotifierProvider(
          create: (context) => WishlistViewModel(
            WishlistRepository(ApiService()),
          ),
        ),
        ChangeNotifierProvider(
          create: (context) => CartViewModel(
            CartRepository(ApiService()),
          ),
        ),
        ChangeNotifierProvider(
          create: (context) => BlogDetailViewModel(
            BlogDetailRepository(ApiService()),
          ),
        ),
        ChangeNotifierProvider(
          create: (context) => ProductDetailViewModel(
            ProductDetailRepository(ApiService()),
          ),
        ),
        ChangeNotifierProvider(
          create: (context) => MemberCheckoutViewModel(
            MemberCheckoutRepository(ApiService()),
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
