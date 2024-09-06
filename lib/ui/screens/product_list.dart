
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_fabby_demo/ui/lists/products_list_vertical.dart';
import 'package:flutter_fabby_demo/ui/screens/top_bar_detail.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';
import 'package:provider/provider.dart';

import '../../AppConstant/app_constant.dart';
import '../../colors/colors.dart';
import '../../strings/strings.dart';
import '../../viewModels/dashboard_viewmodel.dart';
import '../lists/products_list_vertical.dart';

class ProductListScreen extends StatefulWidget {
  ProductListScreen({super.key});
  @override
  _ProductListScreenState createState() => _ProductListScreenState();
}

class _ProductListScreenState extends State<ProductListScreen> {
  late DashboardViewModel viewModel;
  TextEditingController _searchController = TextEditingController();

  @override
  void initState() {
    super.initState();
    viewModel = Provider.of<DashboardViewModel>(context, listen: false);
    WidgetsBinding.instance.addPostFrameCallback((_) {
      viewModel.loadAllProduct(AppConstants.allProduct, "");
    });
  }


  // List of sorting options
  final List<String> sortingOptions = [
    "All Product",
    "High To Low",
    "Low To High",
    "A To Z",
    "Z To A",
  ];

  // Currently selected option
  String selectedSortOption = "All Product";

  @override
  Widget build(BuildContext context) {
    final data = ModalRoute.of(context)?.settings.arguments as Map<String, dynamic>?;

    return Scaffold(
      appBar: const TopBarDetail(title: AppStrings.products),
      body: Column(
        children: [
          // Search bar with custom icon
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Container(
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(8.0),
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey.withOpacity(0.3),
                    blurRadius: 10.0,
                    offset: Offset(0, 5),
                  ),
                ],
              ),
              child: TextField(
                controller: _searchController,
                onSubmitted: (value) {
                  // Perform search when user submits input
                  // Update your viewModel or function to handle search
                },
                decoration: InputDecoration(
                  hintText: 'Search your favorite product',
                  border: InputBorder.none,
                  contentPadding: const EdgeInsets.symmetric(vertical: 14.0, horizontal: 16.0),
                  suffixIcon: GestureDetector(
                    onTap: () {
                      // Perform search when search icon is tapped
                      // Update your viewModel or function to handle search
                    },
                    child: Padding(
                      padding: const EdgeInsets.only(right: 16.0), // Add padding to move icon away from the edge
                      child: Icon(Icons.search, color: AppColors.fabbyBondiBlue),
                    ),
                  ),
                ),
              ),
            ),
          ),

          // Filter dropdown
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Text(
                  'Sort By :',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 16.0,
                    color: Colors.black,
                  ),
                ),
                Container(
                  padding: const EdgeInsets.symmetric(horizontal: 12.0),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(8.0),
                    border: Border.all(color: Colors.grey),
                    color: Colors.white,
                  ),
                  child: DropdownButtonHideUnderline(
                    child: DropdownButton<String>(
                      value: selectedSortOption,
                      icon: const Icon(Icons.arrow_drop_down),
                      onChanged: (String? newValue) {
                        setState(() {
                          selectedSortOption = newValue!;
                          // Handle filter action here based on selectedSortOption
                          // e.g., viewModel.sortProducts(selectedSortOption);
                        });
                      },
                      items: sortingOptions.map((String option) {
                        return DropdownMenuItem<String>(
                          value: option,
                          child: Text(
                            option,
                            style: const TextStyle(
                              fontSize: 14.0,
                              color: Colors.black,
                            ),
                          ),
                        );
                      }).toList(),
                    ),
                  ),
                ),
              ],
            ),
          ),

          // Product list
          Expanded(
            child: Consumer<DashboardViewModel>(
              builder: (context, viewModel, child) {
                if (viewModel.loading) {
                  return Center(
                    child: LoadingAnimationWidget.staggeredDotsWave(
                        color: AppColors.fabbyBondiBlue, size: 50.0),
                  );
                }

                return Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: ProductsListVertical(
                    items: viewModel.allProductData?.data ?? [],
                    onMoveToProductDetail: (int index) {
                      /*final items = viewModel.allProductCategoryMobile?.data ?? [];
                      final item=items[index];
                      NavigationService.navigateToWithData( BlogScreen(),data: {"productId":item.id});*/
                    },
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }


  // @override
  // Widget build(BuildContext context) {
  //   final data = ModalRoute.of(context)?.settings.arguments as Map<String, dynamic>?;
  //
  //   // List of sorting options
  //   List<String> sortingOptions = [
  //     "All Product",
  //     "High To Low",
  //     "Low To High",
  //     "A To Z",
  //     "Z To A",
  //   ];
  //
  //   // Currently selected option
  //   String selectedSortOption = sortingOptions[0];
  //
  //   return Scaffold(
  //     appBar: const TopBarDetail(title: AppStrings.products),
  //     body: Column(
  //       children: [
  //         // Search bar with custom icon
  //         Padding(
  //           padding: const EdgeInsets.all(16.0),
  //           child: Container(
  //             decoration: BoxDecoration(
  //               color: Colors.white,
  //               borderRadius: BorderRadius.circular(8.0),
  //               boxShadow: [
  //                 BoxShadow(
  //                   color: Colors.grey.withOpacity(0.3),
  //                   blurRadius: 10.0,
  //                   offset: Offset(0, 5),
  //                 ),
  //               ],
  //             ),
  //             child: TextField(
  //               controller: _searchController,
  //               onSubmitted: (value) {
  //                 // Perform search when user submits input
  //                 viewModel.loadAllProduct(AppConstants.allProduct, value);
  //               },
  //               decoration: InputDecoration(
  //                 hintText: 'Search your favorite product',
  //                 border: InputBorder.none,
  //                 contentPadding: const EdgeInsets.symmetric(vertical: 14.0, horizontal: 16.0),
  //                 suffixIcon: GestureDetector(
  //                   onTap: () {
  //                     // Perform search when search icon is tapped
  //                     viewModel.loadAllProduct(AppConstants.allProduct, _searchController.text);
  //                   },
  //                   child: Padding(
  //                     padding: const EdgeInsets.only(right: 16.0), // Add padding to move icon away from the edge
  //                     child: Icon(Icons.search, color: AppColors.fabbyBondiBlue),
  //                   ),
  //                 ),
  //               ),
  //             ),
  //           ),
  //         ),
  //
  //         // Filter dropdown
  //         Padding(
  //           padding: const EdgeInsets.symmetric(horizontal: 16.0),
  //           child: Row(
  //             mainAxisAlignment: MainAxisAlignment.spaceBetween,
  //             children: [
  //               const Text(
  //                 'Sort By :',
  //                 style: TextStyle(
  //                   fontWeight: FontWeight.bold,
  //                   fontSize: 16.0,
  //                   color: Colors.black,
  //                 ),
  //               ),
  //               Container(
  //                 padding: const EdgeInsets.symmetric(horizontal: 12.0),
  //                 decoration: BoxDecoration(
  //                   borderRadius: BorderRadius.circular(8.0),
  //                   border: Border.all(color: Colors.grey),
  //                   color: Colors.white,
  //                 ),
  //                 child: DropdownButtonHideUnderline(
  //                   child: DropdownButton<String>(
  //                     value: selectedSortOption,
  //                     icon: const Icon(Icons.arrow_drop_down),
  //                     onChanged: (String? newValue) {
  //                       setState(() {
  //                         selectedSortOption = newValue!;
  //                         // Handle filter action here based on selectedSortOption
  //                         // e.g., viewModel.sortProducts(selectedSortOption);
  //                       });
  //                     },
  //                     items: sortingOptions.map((String option) {
  //                       return DropdownMenuItem<String>(
  //                         value: option,
  //                         child: Text(
  //                           option,
  //                           style: const TextStyle(
  //                             fontSize: 14.0,
  //                             color: Colors.black,
  //                           ),
  //                         ),
  //                       );
  //                     }).toList(),
  //                   ),
  //                 ),
  //               ),
  //             ],
  //           ),
  //         ),
  //
  //         // Product list
  //         Expanded(
  //           child: Consumer<DashboardViewModel>(
  //             builder: (context, viewModel, child) {
  //               if (viewModel.loading) {
  //                 return Center(
  //                   child: LoadingAnimationWidget.staggeredDotsWave(
  //                       color: AppColors.fabbyBondiBlue, size: 50.0),
  //                 );
  //               }
  //
  //               return Padding(
  //                 padding: const EdgeInsets.all(16.0),
  //                 child: ProductsListVertical(
  //                   items: viewModel.allProductData?.data ?? [],
  //                 ),
  //               );
  //             },
  //           ),
  //         ),
  //       ],
  //     ),
  //   );
  // }
}