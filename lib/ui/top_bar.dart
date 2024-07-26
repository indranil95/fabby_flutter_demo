import 'package:flutter/material.dart';

class BottomIcons extends StatelessWidget {
  const BottomIcons({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.only(bottom: 5.0), // Equivalent to marginBottom in XML
      height: 50.0, // Equivalent to @dimen/_50sdp
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          // Drawer icon
          const Padding(
            padding: EdgeInsets.only(left: 10.0),
            child: Icon(
              Icons.menu, // Replace with your icon
              size: 24.0, // Adjust size as needed
              color: Colors.black, // Replace with your color
            ),
          ),

          // Placeholder for included layout
          // Replace with your actual widget for `@layout/select_shop_dropdown`

          Expanded(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                // Notification icon and animation
                 SizedBox(
                  width: 22.0,
                  height: 22.0,
                  child: Stack(
                    children: [
                      Positioned.fill(
                        child: Align(
                          alignment: Alignment.center,
                           child: Image.asset(
                            'assets/notification_fabby.svg', // Path to your custom image
                            width: 20.0,
                            height: 20.0,
                            fit: BoxFit.cover,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),

                const SizedBox(width: 5.0),

                // Wishlist icon and badge
                SizedBox(
                  width: 22.0,
                  height: 22.0,
                  child: Stack(
                    children: [
                       Positioned.fill(
                        child: Align(
                          alignment: Alignment.center,
                          child: Image.asset(
                            'assets/wishlist_icon_fabby.svg', // Path to your custom image
                            width: 20.0,
                            height: 20.0,
                            fit: BoxFit.cover,
                          ),
                        ),
                      ),
                      Positioned(
                        top: 0,
                        right: 0,
                        child: Container(
                          padding: const EdgeInsets.all(4.0),
                          decoration: const BoxDecoration(
                            color: Colors.blue, // Replace with your color
                            shape: BoxShape.circle,
                          ),
                          child: const Center(
                            child: Text(
                              '0', // Replace with dynamic badge count
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 10.0,
                              ),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),

                const SizedBox(width: 5.0),

                // Cart icon and badge
                SizedBox(
                  width: 21.0,
                  height: 21.0,
                  child: Stack(
                    children: [
                       Positioned.fill(
                        child: Align(
                          alignment: Alignment.center,
                          child: Image.asset(
                            'assets/bag_fabby.svg', // Path to your custom image
                            width: 20.0,
                            height: 20.0,
                            fit: BoxFit.cover,
                          ),
                        ),
                      ),
                      Positioned(
                        top: 0,
                        right: 0,
                        child: Container(
                          padding: const EdgeInsets.all(4.0),
                          decoration: const BoxDecoration(
                            color: Colors.blue, // Replace with your color
                            shape: BoxShape.circle,
                          ),
                          child: const Center(
                            child: Text(
                              '0', // Replace with dynamic badge count
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 10.0,
                              ),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),

                const SizedBox(width: 5.0),

                // Profile image
                const CircleAvatar(
                  radius: 10.0,
                  backgroundImage: AssetImage('assets/profile_img_login.png'),
                  backgroundColor: Colors.blue, // Border color
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
