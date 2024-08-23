import 'package:flutter/material.dart';
import 'package:flutter_fabby_demo/colors/colors.dart';
import 'package:flutter_fabby_demo/strings/strings.dart';
import 'package:flutter_fabby_demo/ui/lists/all_product_list.dart';
import 'package:flutter_fabby_demo/ui/lists/blogs_list.dart';
import 'package:flutter_fabby_demo/ui/screens/top_bar.dart';
import 'package:flutter_fabby_demo/utils/text_utils.dart';
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
  Future<void>? _loadProductsFuture; // To track the future of loading products

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      final viewModel = Provider.of<DashboardViewModel>(context, listen: false);
      viewModel.loadBanner();
      viewModel.loadCategories();
      viewModel.loadAllProduct(AppConstants.allProduct, AppConstants.limit);
      viewModel.blogsList(AppConstants.blogsStartLimit);
    });
  }

  void _handleCategorySelection(String category) {
    setState(() {
      if(category == "All Products"){
        _selectedCategory = AppConstants.allProduct;
      }else if(category == "Dog"){
        _selectedCategory = AppConstants.dog;
      }else{
        _selectedCategory = AppConstants.cat;
      }
       // Update the selected category
      _loadProductsFuture = _loadProducts(); // Trigger product loading
    });
  }

  Future<void> _loadProducts() async {
    final viewModel = Provider.of<DashboardViewModel>(context, listen: false);

    if (_selectedCategory.isNotEmpty) {
      await viewModel.productsCategoryMobile(_selectedCategory);
    } else {
      await viewModel.loadAllProduct(
          AppConstants.allProduct, AppConstants.limit);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.redAccent,
        leading: IconButton(
          iconSize: 20,
          icon: const Icon(Icons.favorite),
          onPressed: (

              ) {
            // ...
          },
        ),

      ),
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

          return SingleChildScrollView(

            child: Column(
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
                    crossAxisAlignment: CrossAxisAlignment.center,
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
                        padding: const EdgeInsets.only(top: 16.0),
                        child: SizedBox(
                          height: 60.0,
                          child: CategoryList(
                            items: viewModel.categories,
                            onItemSelected: _handleCategorySelection,
                          ),
                        ),
                      ),
                      FutureBuilder<void>(
                        future: _loadProductsFuture,
                        builder: (context, snapshot) {
                          if (snapshot.connectionState == ConnectionState.waiting) {
                            return const Center(child: CircularProgressIndicator());
                          }

                          if (snapshot.hasError) {
                            return Center(child: Text('Error: ${snapshot.error}'));
                          }

                          return Padding(
                            padding: const EdgeInsets.only(top: 16.0),
                            child: SizedBox(
                              height: 190.0,
                              child: _selectedCategory.isNotEmpty
                                  ? AllProductList(
                                items: viewModel
                                    .allProductCategoryMobile?.data ??
                                    [],
                              )
                                  : AllProductList(
                                items: viewModel.allProductData?.data ?? [],
                              ),
                            ),
                          );
                        },
                      ),
                      const SizedBox(height: 10.0),
                      Center(
                        child: Padding(
                          padding: const EdgeInsets.all(0.0),
                          child: Card(
                            color: AppColors.fabbyBondiBlue,
                            child: Padding(
                              padding: const EdgeInsets.only(left: 15.0, right: 15.0, top: 10.0, bottom: 10.0),
                              child: TextUtils.display(
                                AppStrings.viewAll,
                                fontSize: 15.0,
                                color: AppColors.white,
                                fontFamily: 'Poppins',
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                        ),
                      ),
                      const SizedBox(height: 10.0),
                      Center(
                        child: TextUtils.display(
                          AppStrings.blogs,
                          fontSize: 20.0,
                          color: AppColors.sortTextColor,
                          fontFamily: 'DmSerifDisplay',
                          fontWeight: FontWeight.normal,
                        ),
                      ),
                      const SizedBox(height: 10.0),
                      Center(
                        child: Padding(
                          padding: const EdgeInsets.only(top: 16.0,bottom: 20.0),
                          child: SizedBox(
                            height: 380.0,
                            child: BlogsList(
                              items: viewModel.blogsModelData?.data.articles ?? [],
                            ),
                          ),
                        ),
                      ),
                      const SizedBox(height: 10.0),
                    ],
                  ),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
