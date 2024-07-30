import 'package:flutter/material.dart';
import 'package:flutter_fabby_demo/colors/colors.dart';
import 'package:flutter_fabby_demo/strings/strings.dart';
import 'package:flutter_fabby_demo/ui/lists/all_product_list.dart';
import 'package:flutter_fabby_demo/ui/screens/top_bar.dart';
import 'package:flutter_fabby_demo/utils/logger_service.dart';
import 'package:flutter_fabby_demo/utils/text_utils.dart';
import 'package:logger/logger.dart';
import 'package:provider/provider.dart';

import '../../AppConstant/app_constant.dart';
import '../../viewModels/dashboard_viewmodel.dart';
import '../lists/banner_list.dart';
import '../lists/category_list.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  String _selectedCategory = ''; // Variable to store the selected category

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      final viewModel = Provider.of<DashboardViewModel>(context, listen: false);
      viewModel.loadBanner();
      viewModel.loadCategories();
      viewModel.loadAllProduct(AppConstants.allProduct,AppConstants.limit);// Load categories as well
    });
  }

  void _handleCategorySelection(String category) {
    setState(() {
      _selectedCategory = category; // Update the selected category
    });
    // You can add additional logic here if needed
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

          // Handle the dynamic widget list
          List<Widget> categoryWidgets = [];
          if (_selectedCategory == "All Products") {
            LoggerService.i("all product");
          } else if (_selectedCategory == "Dog") {
            LoggerService.i("Dog");
          } else if (_selectedCategory == "Cat") {
            LoggerService.i("Cat");
          }

          return Column(
            children: [
              SafeArea(
                child: Container(
                  decoration: BoxDecoration(
                    color: Colors.white,
                    boxShadow: [
                      BoxShadow(
                        color: Colors.grey.withOpacity(0.5),
                        spreadRadius: 2,
                        blurRadius: 5,
                        offset: const Offset(0, 2),
                      ),
                    ],
                  ),
                  child: const TopBarIcons(),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(16.0),
                child: SizedBox(
                  height: 200.0,
                  child: BannerList(
                    items: viewModel.data!.data.webBanners,
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Center(
                      child: TextUtils.display(
                        AppStrings.experienceFabby,
                        fontSize: 20.0,
                        color: AppColors.sortTextColor,
                        fontFamily: 'DmSerifDisplay',
                        fontWeight: FontWeight.normal,
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 16.0), // Add padding between text and list
                      child: SizedBox(
                        height: 80.0, // Adjust height as needed
                        child: CategoryList(
                          items: viewModel.categories,
                          onItemSelected: _handleCategorySelection, // Pass the callback
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 16.0), // Add padding between text and list
                      child: SizedBox(
                        height: 80.0, // Adjust height as needed
                        child: AllProductList(
                          items: viewModel.allProductData!.data,
                        ),
                      ),
                    ),
                    // Here you can use the `categoryWidgets` list to include additional widgets
                    // based on `_selectedCategory` or other conditions if needed
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
