import 'package:flutter/material.dart';
import 'package:flutter_fabby_demo/ui/screens/top_bar_detail.dart';
import 'package:flutter_fabby_demo/utils/logger_service.dart';
import 'package:flutter_fabby_demo/viewModels/product_detail_viewmodel.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';
import 'package:provider/provider.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

import '../../AppConstant/app_constant.dart';
import '../../colors/colors.dart';
import '../../strings/strings.dart';

class ProductDetailScreen extends StatefulWidget {
  const ProductDetailScreen({super.key});

  @override
  _ProductDetailScreenState createState() => _ProductDetailScreenState();
}

class _ProductDetailScreenState extends State<ProductDetailScreen> {
  late ProductDetailViewModel viewModel;
  final PageController _pageController = PageController();
  final List<String> _imageUrls = [
    'https://via.placeholder.com/600x300?text=Image+1',
    'https://via.placeholder.com/600x300?text=Image+2',
    'https://via.placeholder.com/600x300?text=Image+3',
  ];
  String productId =AppConstants.noData;

  @override
  void initState() {
    super.initState();
    viewModel = Provider.of<ProductDetailViewModel>(context, listen: false);
    WidgetsBinding.instance.addPostFrameCallback((_) {
      if (productId.isNotEmpty && productId != AppConstants.noData) {
        _callProductList(productId);

      }
    });

  }
  Future<void> _callProductList(String productId) async {
    // Fetch mainId and guestId asynchronously
    String mainId = await viewModel.getMainId();
    String? guestId = await viewModel.getGuestId();

    final requestBody = {
      'userid': mainId,
      'guestid': guestId ?? "", // Handle the case where guestId is null
    };

    viewModel.getProductDetail(productId,mainId,guestId!);
  }

  @override
  Widget build(BuildContext context) {
    final data =
        ModalRoute.of(context)?.settings.arguments as Map<String, dynamic>?;
    productId = data?['productId'] ?? "0";
    return Scaffold(
      appBar: const TopBarDetail(title: AppStrings.products),
      backgroundColor: AppColors.fabbyBack,
      body: Consumer<ProductDetailViewModel>(
        builder: (context, viewModel, child) {
          if (viewModel.loading) {
            return Center(
              child: LoadingAnimationWidget.staggeredDotsWave(
                  color: AppColors.fabbyBondiBlue, size: 50.0),
            );
          }
          final mainData = viewModel.productDetailMode?.data;
          final products = viewModel.productDetailMode?.data?.products;

          if (products != null && products.isNotEmpty) {
            for (var product in products) {
              final imageArr = product.productImageArr;

              if (imageArr != null && imageArr.isNotEmpty) {
                for (var image in imageArr) {
                  LoggerService.d('Product Image URL: $image');
                }
              } else {
                LoggerService.d('No images found for this product');
              }
            }
          } else {
            LoggerService.d('No products available');
          }

          return Column(
            children: [
              SizedBox(
                height: 250.0,
                child: PageView.builder(
                  controller: _pageController,
                  itemCount: _imageUrls.length,
                  itemBuilder: (context, index) {
                    return Image.network(_imageUrls[index], fit: BoxFit.cover);
                  },
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 16.0),
                child: SmoothPageIndicator(
                  controller: _pageController,
                  count: _imageUrls.length,
                  effect: const ExpandingDotsEffect(
                    activeDotColor: Colors.red,
                    dotColor: Colors.grey,
                    dotHeight: 8.0,
                    dotWidth: 8.0,
                    spacing: 16.0,
                  ),
                ),
              ),
            ],
          );
        },
      ),
    );
  }
}
