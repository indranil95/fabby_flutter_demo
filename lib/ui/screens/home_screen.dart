import 'package:flutter/material.dart';
import 'package:flutter_fabby_demo/colors/colors.dart';
import 'package:flutter_fabby_demo/strings/strings.dart';
import 'package:flutter_fabby_demo/ui/lists/all_product_list.dart';
import 'package:flutter_fabby_demo/ui/lists/blogs_list.dart';
import 'package:flutter_fabby_demo/ui/screens/blog_detail.dart';
import 'package:flutter_fabby_demo/ui/screens/blog_list.dart';
import 'package:flutter_fabby_demo/ui/screens/product_list.dart';
import 'package:flutter_fabby_demo/ui/screens/top_bar.dart';
import 'package:flutter_fabby_demo/utils/text_utils.dart';
import 'package:provider/provider.dart';

import '../../AppConstant/app_constant.dart';
import '../../utils/logger_service.dart';
import '../../utils/navigation_service.dart';
import '../../viewModels/dashboard_viewmodel.dart';
import '../lists/banner_list.dart';
import '../lists/category_list.dart';
import 'package:flutter_fabby_demo/ui/listItems/Testimonial_items.dart';
import 'package:flutter_fabby_demo/ui/lists/testimonial_list.dart';

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
                          height: 60.0, // Adjust height as needed
                          child: CategoryList(
                            items: viewModel.categories,
                            onItemSelected:
                            _handleCategorySelection, // Pass the callback
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
                          child: GestureDetector(
                            onTap: () {
                              // Perform your action here, like navigating to another screen
                              print("View All tapped");
                              NavigationService.navigateToWithData(ProductListScreen());
                            },
                            child: Card(
                              color: AppColors.fabbyBondiBlue,
                              child: Padding(
                                padding: const EdgeInsets.only(
                                    left: 15.0, right: 15.0, top: 10.0, bottom: 10.0),
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
                      ),

                      const SizedBox(height: 10.0,),
                      Center(
                        child: TextUtils.display(
                          AppStrings.blogs,
                          fontSize: 20.0,
                          color: AppColors.sortTextColor,
                          fontFamily: 'DmSerifDisplay',
                          fontWeight: FontWeight.normal,
                        ),
                      ),
                      const SizedBox(height: 10.0,),
                      Padding(
                        padding: const EdgeInsets.only(top: 16.0),
                        // Add padding between text and list
                        child: SizedBox(
                          height: 250.0, // Adjust height as needed
                          child: BlogsList(

                            items: viewModel.blogsModelData?.data.articles ?? [],
                            onMoveToBlogDetail: (int index) {
                              // Handle move to cart action here
                              LoggerService.d('Blog Detail clicked at index: $index');
                              final items = viewModel.blogsModelData?.data.articles ?? [];
                              final item=items[index];
                              /*NavigationService.navigateToWithData(
                              const BlogScreen(), data: {"email": _emailController.text});
                              });*/
                              NavigationService.navigateToWithData( BlogScreen(),data: {"slug":item.slug});
                            },
                           ),
                        ),
                      ),

                      Center(
                        child: Padding(
                          padding: const EdgeInsets.all(0.0),
                          child: GestureDetector(
                            onTap: () {
                              // Perform your action here, like navigating to another screen
                              print("View All tapped");
                              NavigationService.navigateToWithData(BlogListScreen());
                            },
                            child: Card(
                              color: AppColors.cardBackColor,
                              child: Padding(
                                padding: const EdgeInsets.only(
                                    left: 15.0, right: 15.0, top: 10.0, bottom: 10.0),
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
                      ),
                      const SizedBox(height: 10.0),
                      Center(
                        child: TextUtils.display(
                          "What Pet Lovers Say About Us",
                          fontSize: 20.0,
                          color: AppColors.sortTextColor,
                          fontFamily: 'DmSerifDisplay',
                          fontWeight: FontWeight.normal,
                        ),
                      ),
                      const SizedBox(height: 10.0),
                      const TestimonialsList(
                        testimonials: [
                          {
                            "name": "Juhi Shetty",
                            "title": "Dog Lover",
                            "testimonial": "I'm so impressed with the results I've seen since using Fabby's Deo Fresh. The deodorizing spray keeps my dog Leo, smelling fresh between baths. Fabby Furever now has become an essential part of our routine, ensuring my dog looks,smells and feels amazing.",// Replace with actual image URL
                          },
                          {
                            "name": "Kartik U",
                            "title": "Dog Lover",
                            "testimonial": "Dealing with ticks and fleas used to be a constant battle until I discovered Fabby Furever's Anti Tick & Flea spray. It's become a lifesaver for my dog, offering protection without the harsh chemicals. I highly recommend it to every pet owner looking for a reliable and safe solution",
                          },
                          {
                            "name": "Loyal Dsouza",
                            "title": "Dog Lover",
                            "testimonial": "I've tried several anti-tick and flea products, and Fabby’s Anit tick Spray is hands down the best. It not only protected my dog from ticks and fleas but also provided long-lasting relief. I can't thank Fabby enough for creating a product that truly cares for our furry friends.",
                          },
                          // Add more testimonials here...
                        ],
                      ),
                      const SizedBox(height: 10.0),
                    ],
                  ),
                ),
              ],
            ) ,
          );
        },
      ),
    );
  }
}
