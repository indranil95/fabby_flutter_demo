import 'package:flutter/material.dart';
import 'package:flutter_fabby_demo/ui/screens/cart_screen.dart';
import 'package:flutter_fabby_demo/ui/screens/rightSideMenu.dart';
import 'package:flutter_fabby_demo/ui/screens/side_menu.dart';
import 'package:flutter_fabby_demo/ui/screens/wishlist_screen.dart';

import '../../utils/image_utils.dart';
import '../../utils/navigation_service.dart'; // Import your image_utils.dart

class TopBarIcons extends StatelessWidget {
  const TopBarIcons({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.only(bottom: 5.0),
      // Equivalent to marginBottom in XML
      height: 70.0,
      // Equivalent to @dimen/_50sdp
      decoration: BoxDecoration(
        color: Colors.white, // Background color
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.5),
            spreadRadius: 2,
            blurRadius: 5,
            offset: const Offset(0, 2), // Shadow position
          ),
        ],
        borderRadius: const BorderRadius.only(
          bottomLeft: Radius.circular(20.0), // Radius for bottom left corner
          bottomRight: Radius.circular(20.0), // Radius for bottom right corner
        ),
      ),
      child: ClipRRect(
        borderRadius: const BorderRadius.only(
          bottomLeft: Radius.circular(20.0), // Radius for bottom left corner
          bottomRight: Radius.circular(20.0), // Radius for bottom right corner
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            // Drawer icon with click event
            GestureDetector(
              onTap: () {
                // Handle the click event here
                goToSideMenu(context);
              },
              child: const Padding(
                padding: EdgeInsets.symmetric(horizontal: 15.0),
                child: Icon(
                  Icons.menu, // Drawer icon
                  size: 24.0, // Size of the icon
                  color: Colors.black, // Color of the icon
                ),
              ),
            ),

            // Logo
            SizedBox(
              width: 120.0,
              height: 55.0,
              child: PngImage.asset(
                'assets/fabby_top_logo.png', // Path to your PNG image
                width: 120.0,
                height: 45.0,
              ),
            ),

            // Expanded section to push icons to the right
            Expanded(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  // Notification icon
                  SvgImage.asset('assets/notification_fabby.svg'),

                  const SizedBox(width: 10.0),

                  // Wishlist icon
                  GestureDetector(
                    onTap: () {
                      NavigationService.navigateTo(const WishListScreen());
                    },
                    child: SvgImage.asset('assets/wishlist_icon_fabby.svg'),
                  ),

                  const SizedBox(width: 10.0),

                  // Cart icon
                  GestureDetector(
                    onTap: () {
                      NavigationService.navigateTo(const CartScreen());
                    },
                    child: SvgImage.asset('assets/bag_fabby.svg'),
                  ),

                  const SizedBox(width: 10.0),

                  // Profile image with border
                  GestureDetector(
                    onTap: () {
                      // Handle the click event
                      print("Profile image clicked!");
                      NavigationService.navigateTo(const RightsideMenuScreen());
                      // You can also navigate to another page or show a dialog here
                    },
                    child: Container(
                      width: 30.0,
                      height: 30.0,
                      decoration: const BoxDecoration(
                        shape: BoxShape.circle,
                        color: Colors.pinkAccent, // Border color
                      ),
                      child: const Center(
                        child: CircleAvatar(
                          radius: 13.0,
                          backgroundImage: AssetImage('assets/profile_img_login.png'), // Profile image
                        ),
                      ),
                    ),
                  ),

                  const SizedBox(width: 15.0),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  void goToSideMenu(BuildContext context) {
    NavigationService.navigateTo(const SideMenuScreen());
  }
}
