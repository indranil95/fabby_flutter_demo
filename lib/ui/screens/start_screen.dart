import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_fabby_demo/utils/logger_service.dart';
import 'package:flutter_fabby_demo/viewModels/start_viewmodel.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:provider/provider.dart';
import 'package:uni_links/uni_links.dart';


import '../../utils/navigation_service.dart';
import '../../utils/shared_prefs.dart';
import 'home_screen.dart'; // Import your HomeScreen
import 'splash_screen.dart'; // Import your SplashScreen

class StartScreen extends StatefulWidget {
  const StartScreen({super.key});

  @override
  _StartScreenState createState() => _StartScreenState();
}

class _StartScreenState extends State<StartScreen> {
  String? guestId;
  String? loginSuccess;
  StreamSubscription? _sub;

  @override
  void initState() {
    super.initState();
    _checkFirstTimeLogin();
    initDeepLinkListener();
  }
  Future<void> initDeepLinkListener() async {
    // Handle the initial deep link when the app is opened via a deep link
    try {
      final initialLink = await getInitialLink();
      if (initialLink != null) {
        print('Initial Deep Link: $initialLink');
        // Handle the initial deep link here
        handleDeepLink(initialLink);
      }
    } catch (e) {
      print('Error getting the initial link: $e');
    }

    // Listen for deep links when the app is already running
    _sub = linkStream.listen((String? link) {
      if (link != null) {
        print('Deep Link Received: $link');
        // Handle the deep link here
        handleDeepLink(link);
      }
    });
  }
  @override
  void dispose() {
    _sub?.cancel();
    super.dispose();
  }
  void handleDeepLink(String link) {
    // Parse and handle the deep link, for example, navigate to a specific screen
    print('Handling deep link: $link');
    // You can use Navigator to push to specific routes based on the link
    // Navigator.pushNamed(context, 'specific_screen');
  }

  Future<void> _checkFirstTimeLogin() async {
    final viewModel = Provider.of<StartViewModel>(context, listen: false);
    final prefs = await SharedPrefsHelper.getInstance();
    final firstTime = prefs.getString('first_time');

    // Delay for demo purposes

    loginSuccess = await viewModel.getLoginSuccess();
    //LoggerService.d("check:","loginSuccess $loginSuccess");
    if (loginSuccess?.isNotEmpty == true) {
      //LoggerService.d("check:","loginSuccess if");
      goToHomeScreen();
    } else{
      //LoggerService.d("check:","loginSuccess else");
      guestId = await viewModel.getGuestId();
      //LoggerService.d("check:","guestId $guestId");
      if (guestId?.isNotEmpty == true) {
        //LoggerService.d("check:","guestId if");
        goToHomeScreen();
      } else {
        //LoggerService.d("check:","guestId else");
        viewModel.loadGuest();
        await Future.delayed(const Duration(seconds: 4));
        if (viewModel.guestSuccess) {
          goToSplash();
        }
      }
    }

    /*if (firstTime == '1') {
      goToHomeScreen();
    } else {
      goToSplash();
    }*/
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        fit: StackFit.expand,
        children: [
          SvgPicture.asset(
            'assets/ic_spash_fabby.svg', // Your SVG file
            fit: BoxFit.cover,
          ),
          Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Image.asset(
                  'assets/fabby_top_logo.png', // Replace with your logo image
                  width: 100,
                  height: 100,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  void goToHomeScreen() {
    NavigationService.navigateTo(const HomeScreen());
  }

  void goToSplash() {
    NavigationService.navigateTo(const SplashScreen());
  }
}
