import 'package:flutter/material.dart';
import 'package:flutter_fabby_demo/ui/screens/top_bar.dart';
import 'package:provider/provider.dart'; // Import Provider
import '../../viewModels/dashboard_viewmodel.dart';
import '../lists/banner_list.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  void initState() {
    super.initState();
    // Call loadData when the screen is initialized
    WidgetsBinding.instance.addPostFrameCallback((_) {
      final viewModel = Provider.of<DashboardViewModel>(context, listen: false);
      viewModel.loadBanner();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Consumer<DashboardViewModel>(
        builder: (context, viewModel, child) {
          if (viewModel.loading) {
            return const Center(child: CircularProgressIndicator());
          }

          if (viewModel.error.isNotEmpty) {
            return Center(child: Text('Error: ${viewModel.error}'));
          }

          if (viewModel.data == null) {
            return const Center(child: Text('No data available'));
          }

          return Column(
            children: [
              SafeArea(
                child: Container(
                  // Add decoration to mimic AppBar styling
                  decoration: BoxDecoration(
                    color: Colors.white, // Background color similar to AppBar
                    boxShadow: [
                      BoxShadow(
                        color: Colors.grey.withOpacity(0.5),
                        spreadRadius: 2,
                        blurRadius: 5,
                        offset: const Offset(0, 2), // Shadow position
                      ),
                    ],
                  ),
                  child: const TopBarIcons(), // Use BottomIcons here
                ),
              ),
              // Set the height for BannerList
              SizedBox(
                height: 200.0, // Fixed height for the banner list
                child: BannerList(
                  items: viewModel.data!.data.webBanners, // Pass the list of banners
                ),
              ),
              // Add two more text widgets below the BannerList
              const Padding(
                padding: EdgeInsets.all(16.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                        'First Text View'
                    ),
                    SizedBox(height: 10), // Space between text views
                    Text(
                        'Second Text View'
                    ),
                  ],
                ),
              ),
            ],
          );
        },
      ),
    );
  }
}
