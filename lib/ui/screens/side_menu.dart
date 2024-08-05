import 'package:flutter/material.dart';
import 'package:flutter_fabby_demo/colors/colors.dart';
import 'package:flutter_fabby_demo/strings/strings.dart';
import 'package:flutter_fabby_demo/ui/screens/about_us.dart';
import 'package:flutter_fabby_demo/ui/screens/contact_us.dart';
import 'package:flutter_fabby_demo/ui/screens/privacy_policy.dart';

import '../../utils/image_utils.dart';
import '../../utils/navigation_service.dart';
import '../../utils/text_utils.dart';

class SideMenuScreen extends StatefulWidget {
  const SideMenuScreen({super.key});

  @override
  State<SideMenuScreen> createState() => _SideMenuScreenState();
}

class _SideMenuScreenState extends State<SideMenuScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        color: AppColors.menuBack,
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        child: SafeArea(
            child: Stack(
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.all(10.0),
                  // Add padding if needed
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          GestureDetector(
                            onTap: () {
                              NavigationService.goBack();
                            },
                            child: TextUtils.display(
                              AppStrings.home,
                              fontSize: 16.0,
                              // Increased fontSize for larger text
                              color: AppColors.black,
                              fontFamily: 'Poppins',
                              fontWeight: FontWeight.normal,
                              textAlign: TextAlign.center, // Center the text
                            ),
                          ),
                          GestureDetector(
                            onTap: () {
                              NavigationService.goBack();
                            },
                            child: SvgImage.asset(
                              'assets/cross.svg',
                              // Path to your PNG image
                              width: 30.0,
                              height: 30.0,
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(height: 10.0),
                      TextUtils.display(
                        AppStrings.products,
                        fontSize: 16.0,
                        // Increased fontSize for larger text
                        color: AppColors.black,
                        fontFamily: 'Poppins',
                        fontWeight: FontWeight.normal,
                        textAlign: TextAlign.center, // Center the text
                      ),
                      const SizedBox(height: 10.0),
                      TextUtils.display(
                        AppStrings.wishlist,
                        fontSize: 16.0,
                        // Increased fontSize for larger text
                        color: AppColors.black,
                        fontFamily: 'Poppins',
                        fontWeight: FontWeight.normal,
                        textAlign: TextAlign.center, // Center the text
                      ),
                      const SizedBox(height: 10.0),
                      TextUtils.display(
                        AppStrings.blogs,
                        fontSize: 16.0,
                        // Increased fontSize for larger text
                        color: AppColors.black,
                        fontFamily: 'Poppins',
                        fontWeight: FontWeight.normal,
                        textAlign: TextAlign.center, // Center the text
                      ),
                      const SizedBox(height: 10.0),
                  GestureDetector(
                    onTap: () {
                      NavigationService.replaceWith(const ContactUs());
                    },
                    child: TextUtils.display(
                        AppStrings.contactUs,
                        fontSize: 16.0,
                        // Increased fontSize for larger text
                        color: AppColors.black,
                        fontFamily: 'Poppins',
                        fontWeight: FontWeight.normal,
                        textAlign: TextAlign.center, // Center the text
                      ),
                  ),
                      const SizedBox(height: 10.0),
                  GestureDetector(
                    onTap: () {
                      NavigationService.replaceWith(const AboutUs());
                    },
                    child: TextUtils.display(
                        AppStrings.aboutUs,
                        fontSize: 16.0,
                        // Increased fontSize for larger text
                        color: AppColors.black,
                        fontFamily: 'Poppins',
                        fontWeight: FontWeight.normal,
                        textAlign: TextAlign.center, // Center the text
                      ),
                  ),
                      const SizedBox(height: 10.0),
                  GestureDetector(
                    onTap: () {
                      NavigationService.replaceWith(const PrivacyPolicy());
                    },
                    child: TextUtils.display(
                        AppStrings.privacyPolicy,
                        fontSize: 16.0,
                        // Increased fontSize for larger text
                        color: AppColors.black,
                        fontFamily: 'Poppins',
                        fontWeight: FontWeight.normal,
                        textAlign: TextAlign.center, // Center the text
                      ),
                  ),
                    
                      const SizedBox(height: 10.0),
                      SizedBox(
                        width: 120.0,
                        height: 50.0,
                        child: Card(
                          color: AppColors.fabbyBondiBlue,
                          child: Padding(
                            padding: const EdgeInsets.all(10.0),
                            child: TextUtils.display(
                              AppStrings.login,
                              fontSize: 14.0,
                              // Increased fontSize for larger text
                              color: AppColors.white,
                              fontFamily: 'Poppins',
                              fontWeight: FontWeight.normal,
                              textAlign: TextAlign.center, // Center the text
                            ),
                          ),
                        ),
                      )
                    ],
                  ),
                ),
                Align(
                  alignment: Alignment.bottomCenter,
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      PngImage.asset(
                        'assets/side_menu_banner.png',
                        // Path to your PNG image
                        width: 412.0,
                        height: 400.0,
                      ),
                      const SizedBox(height: 10.0),
                      // Space between the images
                      GestureDetector(
                        onTap: () {
                          NavigationService.goBack();
                        },
                        child: PngImage.asset(
                          'assets/fabby_top_logo.png',
                          // Path to your PNG image
                          width: 120.0,
                          height: 45.0,
                        ),
                      ),
                      const SizedBox(height: 20.0),
                      // Space from the bottom edge
                    ],
                  ),
                )
                // You can add other widgets here if needed
              ],
            ),
          ],
        )),
      ),
    );
  }
}
