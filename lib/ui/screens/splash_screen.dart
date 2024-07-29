import 'package:flutter/material.dart';
import 'package:flutter_fabby_demo/colors/colors.dart';

import '../../utils/shared_prefs.dart';
import 'home_screen.dart'; // Ensure this file exists and contains the AppColors

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  final PageController _pageController = PageController();
  final List<String> imageAssets = [
    'assets/carouse1.png',
    'assets/carouse2.png',
    'assets/carouse3.png',
    'assets/carouse4.png',
    'assets/carouse5.png',
  ];
  int _currentPage = 0;
  @override
  void initState() {
    super.initState();
    _firstTimeLogin();
  }


  void _firstTimeLogin() async {
    final prefs = await SharedPrefsHelper.getInstance();
    await prefs.saveString('first_time', '1');
  }

  void _onNextButtonPressed() {
    if (_currentPage < imageAssets.length - 1) {
      _pageController.nextPage(
        duration: const Duration(milliseconds: 300),
        curve: Curves.easeInOut,
      );
    } else {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => const HomeScreen()),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          // App logo
          Container(
            margin: const EdgeInsets.only(top: 20.0),
            alignment: Alignment.center,
            child: Image.asset(
              'assets/fabby_top_logo.png',
              width: 150,
              height: 150,
            ),
          ),

          // ViewPager equivalent
          Expanded(
            child: PageView(
              controller: _pageController,
              onPageChanged: (index) {
                setState(() {
                  _currentPage = index;
                });
              },
              children: imageAssets.map((imagePath) {
                return Container(
                  color: Colors.white,
                  child: Center(
                    child: Image.asset(
                      imagePath,
                      fit: BoxFit.cover,
                    ),
                  ),
                );
              }).toList(),
            ),
          ),

          // Next button
          Container(
            width: 180.0,
            margin: const EdgeInsets.only(bottom: 20.0,top: 20),
            decoration: BoxDecoration(
              color: AppColors.fabbyBondiBlue,
              borderRadius: BorderRadius.circular(8.0),
              boxShadow: [
                BoxShadow(
                  color: Colors.black.withOpacity(0.2),
                  blurRadius: 8.0, // Adjust blur radius as needed
                  offset: const Offset(0, 4), // Shadow offset to create a shadow below
                ),
              ],
            ),
            child: ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.transparent, // Set to transparent to use container's color
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(8.0),
                ),
                elevation: 0, // Remove button elevation since shadow is handled by container
                padding: EdgeInsets.zero, // Remove button's internal padding
              ),
              onPressed: _onNextButtonPressed,
              child: const Text(
                'Next',
                style: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                  fontSize: 16.0,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
