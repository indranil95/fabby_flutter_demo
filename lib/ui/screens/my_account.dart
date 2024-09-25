import 'package:flutter/material.dart';
import 'package:flutter_fabby_demo/ui/screens/saved_address.dart';
import 'package:flutter_fabby_demo/ui/screens/top_bar_detail.dart';

import '../../strings/strings.dart';
import 'Notification_screen.dart';
import 'profile_screen.dart';
import 'order_history.dart';

class MyAccountScreen extends StatefulWidget {
  const MyAccountScreen({super.key});

  @override
  _MyAccountScreenState createState() => _MyAccountScreenState();
}

class _MyAccountScreenState extends State<MyAccountScreen> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const TopBarDetail(title: AppStrings.myAccounts),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            Container(
              padding: const EdgeInsets.all(16.0),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(8.0),
                border: Border.all(color: Colors.grey.shade300),
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey.withOpacity(0.2),
                    spreadRadius: 2,
                    blurRadius: 5,
                    offset: const Offset(0, 3),
                  ),
                ],
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    'Hello,',
                    style: TextStyle(
                      fontFamily: 'Poppins',
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 16.0),
                  buildAccountOption(context, 'Profile'),
                  buildAccountOption(context, 'Order History'),
                  buildAccountOption(context, 'Saved Addresses'),
                  buildAccountOption(context, 'Notification'),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  // Widget buildAccountOption(BuildContext context, String title) {
  //   return Column(
  //     children: [
  //       ListTile(
  //         title: Text(
  //           title,
  //           style: const TextStyle(
  //             fontSize: 16,
  //           ),
  //         ),
  //         onTap: () {
  //           // Handle navigation here
  //         },
  //       ),
  //       Divider(
  //         color: Colors.grey.shade300,
  //       ),
  //     ],
  //   );
  // }
  Widget buildAccountOption(BuildContext context, String title) {
    return Column(
      children: [
        ListTile(
          title: Text(
            title,
            style: const TextStyle(
              fontSize: 16,
            ),
          ),
          onTap: () {
            // Handle navigation here
            if (title == 'Profile') {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => ProfileScreen()),
              );
            } else if (title == 'Order History') {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => OrderHistoryScreen()),
              );
            } else if (title == 'Saved Addresses') {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => SavedAddressScreen()),
              );
            } else if (title == 'Notification') {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => NotificationScreen()),
              );
            }
          },
        ),
        Divider(
          color: Colors.grey.shade300,
        ),
      ],
    );
  }
}