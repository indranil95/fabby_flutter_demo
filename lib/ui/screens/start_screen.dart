import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import '../../utils/shared_prefs.dart';
import 'splash_screen.dart'; // Import your SplashScreen
import 'home_screen.dart'; // Import your HomeScreen
class StartScreen extends StatefulWidget {
  const StartScreen({super.key});

  @override
  _StartScreenState createState() => _StartScreenState();
}

class _StartScreenState extends State<StartScreen> {
  @override
  void initState() {
    super.initState();
    _checkFirstTimeLogin();
  }

  Future<void> _checkFirstTimeLogin() async {
    final prefs = await SharedPrefsHelper.getInstance();
    final firstTime = prefs.getString('first_time');

    // Delay for demo purposes
    await Future.delayed(const Duration(seconds: 2));

    if (firstTime == '1') {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(
          builder: (context) => const HomeScreen(), // Navigate to HomeScreen
        ),
      );
    } else {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(
          builder: (context) => const SplashScreen(), // Navigate to SplashScreen
        ),
      );
    }
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
}
