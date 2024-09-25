import 'package:flutter/material.dart';
import 'package:flutter_fabby_demo/ui/screens/my_account.dart';

import '../../colors/colors.dart';
import '../../utils/navigation_service.dart';
import '../../utils/shared_prefs.dart';
import 'blog_list.dart';
import 'login_screen.dart';

class RightsideMenuScreen extends StatefulWidget {
  const RightsideMenuScreen({super.key});

  @override
  _RightsideMenuScreenState createState() => _RightsideMenuScreenState();
}

class _RightsideMenuScreenState extends State<RightsideMenuScreen> {
  // List<int> selectedIds = [];
  // List<int> selectedProductIds = [];
  // String itemCountDisplayText = "0/0 items Selected";
  // bool areAllItemsSelected = false; // New variable to track all selection
  //
  // late WishlistViewModel viewModel;

  @override
  void initState() {
    // viewModel = Provider.of<WishlistViewModel>(context, listen: false);
    // _fetchWishlist();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: AppColors.fabbyBack,
      body: Padding(
        padding: const EdgeInsets.symmetric(vertical: 50.0, horizontal: 16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Close Button on the top-right corner
            Align(
              alignment: Alignment.topRight,
              child: GestureDetector(
                onTap: () {
                  Navigator.of(context).pop();
                },
                child: Container(
                  padding: const EdgeInsets.all(8.0),
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: Colors.pink[100],
                  ),
                  child: const Icon(Icons.close, color: Colors.pink, size: 20),
                ),
              ),
            ),
            const SizedBox(height: 16.0),

            // Profile picture and User Information
            Row(
              children: [
                // Profile Picture
                CircleAvatar(
                  radius: 35.0,
                  backgroundColor: Colors.pink[100],
                  child: const Icon(
                    Icons.person,
                    size: 40.0,
                    color: Colors.pink,
                  ),
                ),
                const SizedBox(width: 16.0),

                // User Name and Email
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: const [
                    Text(
                      'Pranay',
                      style: TextStyle(
                        fontSize: 20.0,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    SizedBox(height: 4.0),
                    Text(
                      'pranay@appic.me',
                      style: TextStyle(fontSize: 16.0),
                    ),
                  ],
                ),
              ],
            ),
            const SizedBox(height: 40.0),

            // List items (My Accounts and Logout)
            ListTile(
              title: const Text(
                'My Accounts',
                style: TextStyle(fontSize: 18.0),
              ),
              onTap: () {
                // Handle My Accounts tap
                NavigationService.navigateToWithData(MyAccountScreen());
              },
            ),
            const Divider(),
            ListTile(
              title: const Text(
                'Logout',
                style: TextStyle(fontSize: 18.0),
              ),
              onTap: () async{
                clearData();
                NavigationService.replaceWith(const LoginScreen());
              },
            ),
          ],
        ),
      ),
    );
  }

}
Future<void> clearData() async {
  final prefs = await SharedPrefsHelper.getInstance();
  prefs.clearAll();
}
