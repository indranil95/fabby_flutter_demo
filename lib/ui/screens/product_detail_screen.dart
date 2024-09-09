import 'package:flutter/material.dart';
import 'package:flutter_fabby_demo/models/product_detail_model.dart';
import 'package:flutter_fabby_demo/ui/lists/product_tag_list.dart';
import 'package:flutter_fabby_demo/ui/screens/top_bar_detail.dart';
import 'package:flutter_fabby_demo/utils/logger_service.dart';
import 'package:flutter_fabby_demo/viewModels/product_detail_viewmodel.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';
import 'package:provider/provider.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

import '../../AppConstant/app_constant.dart';
import '../../colors/colors.dart';
import '../../strings/strings.dart';
import '../../utils/image_utils.dart';
import '../../utils/text_utils.dart';

class ProductDetailScreen extends StatefulWidget {
  const ProductDetailScreen({super.key});

  @override
  _ProductDetailScreenState createState() => _ProductDetailScreenState();
}

class _ProductDetailScreenState extends State<ProductDetailScreen> {
  late ProductDetailViewModel viewModel;
  final PageController _pageController = PageController();
  List<String> _imageUrls = [];
  List<ProductTag> _tag = [];
  String productIdString = AppConstants.noData;
  String productName = "";
  int productId = 0;

  late String priceText;
  String? strikeOffText;
  String? offersText;
  bool showOffers = false;
  bool showStrikeOffText = false;

  String removeDecimalPoints(String value) {
    // Implement the function to remove decimal points from the string
    return value.split('.')[0]; // This is a simple example
  }

  @override
  void initState() {
    super.initState();
    viewModel = Provider.of<ProductDetailViewModel>(context, listen: false);
    WidgetsBinding.instance.addPostFrameCallback((_) {
      if (productIdString.isNotEmpty &&
          productIdString != AppConstants.noData) {
        _callProductList(productIdString);
      }
    });
  }

  Future<void> _callProductList(String productId) async {
    String mainId = await viewModel.getMainId();
    String? guestId = await viewModel.getGuestId();
    viewModel.getProductDetail(productId, mainId, guestId ?? "");
  }

  @override
  Widget build(BuildContext context) {
    final data =
        ModalRoute.of(context)?.settings.arguments as Map<String, dynamic>?;
    productId = data?['productId'] ?? 0;
    productIdString = productId.toString();

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

          final products = viewModel.productDetailMode?.data?.products;
          LoggerService.d("products: ", products?.length);

          if (products != null && products.isNotEmpty) {
            _imageUrls = products
                .expand((product) =>
                    product.productImageArr
                        ?.map((image) => image.image.toString()) ??
                    [])
                .cast<String>()
                .toList();
            _tag = (products[0].productTag as List<ProductTag>) ?? [];

            if (products[0].offers != null) {
              if (products[0].offers.discountType == 1) {
                double discountValue =
                    double.parse(products[0].price.toString()) -
                        products[0].offers.discountValue.toDouble();
                priceText =
                    "₹ ${removeDecimalPoints(discountValue.toString())} /-";
                strikeOffText =
                    "₹${removeDecimalPoints(products[0].price.toString())}";
                offersText = "₹${products[0].offers.discountValue} flat off";
                showOffers = true;
                showStrikeOffText = true;
              } else {
                double discountedPrice =
                    double.parse(products[0].price.toString()) -
                        (double.parse(products[0].price.toString()) *
                            (products[0].offers.discountValue.toDouble() /
                                100));
                priceText =
                    "₹ ${removeDecimalPoints(discountedPrice.toString())} /-";
                strikeOffText =
                    "₹${removeDecimalPoints(products[0].price.toString())}";
                offersText = "${products[0].offers.discountValue}% off";
                showOffers = true;
                showStrikeOffText = true;
              }
            } else {
              priceText =
                  "₹ ${removeDecimalPoints(products[0].price.toString())} /-";
            }

            LoggerService.d("listSize", _tag.length);
            productName = products[0].productName ?? "";

            // Ensure the UI is updated
            WidgetsBinding.instance.addPostFrameCallback((_) {
              setState(() {}); // Update the state after the build
            });
          } else {
            LoggerService.d('No products available');
            _imageUrls = []; // Clear images if no products are available
          }

          return Column(
            children: [
              _imageUrls.isNotEmpty
                  ? Stack(
                      children: [
                        Container(
                          margin:
                              const EdgeInsets.only(left: 10.0, right: 10.0),
                          height: 250.0,
                          child: PageView.builder(
                            controller: _pageController,
                            itemCount: _imageUrls.length,
                            itemBuilder: (context, index) {
                              return Image.network(_imageUrls[index],
                                  fit: BoxFit.cover);
                            },
                          ),
                        ),
                        Positioned(
                          bottom: 0.0, // Align to the bottom of the PageView
                          left: 0.0, // Align to the left
                          right: 0.0, // Align to the right
                          child: Padding(
                            padding: const EdgeInsets.symmetric(vertical: 16.0),
                            child: Align(
                              alignment:
                                  Alignment.bottomCenter, // Center horizontally
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
                          ),
                        ),
                      ],
                    )
                  : Container(
                      margin: const EdgeInsets.only(left: 10.0, right: 10.0),
                      height: 250.0,
                      child: SvgImage.asset('assets/ic_no_data.svg',
                          width: double.infinity, height: 250.0),
                    ),
              Column(children: [
                Expanded(
                  child: Container(
                      width: double.infinity,
                      height: 200.0,
                      margin: const EdgeInsets.all(10.0),
                      decoration: BoxDecoration(
                        color: AppColors.productDetailBack,
                        borderRadius: BorderRadius.circular(20.0),
                      ),
                      child: Column(children: [
                        Row(
                          children: [
                            Expanded(
                              child: Container(
                                margin: const EdgeInsets.all(10.0),
                                child: TextUtils.displayLargeText(
                                  productName,
                                  fontFamily: 'Poppins',
                                  fontWeight: FontWeight.normal, // Regular
                                  fontSize: 18.0,
                                ),
                              ),
                            ),
                            const SizedBox(width: 10.0),
                            // This provides the 10dp space
                            Container(
                              margin: const EdgeInsets.all(10.0),
                              child: PngImage.asset(
                                'assets/share_pro_details.png',
                                width: 30.0,
                                height: 30.0,
                              ),
                            ),
                          ],
                        ),
                        Container(
                          margin: const EdgeInsets.all(10.0),
                          height: 100.0,
                          child: ProductTagList(items: _tag),
                        ),
                        Container(
                          width: double.infinity,
                          // Equivalent to match_parent
                          height: 1.0,
                          // Equivalent to 1dp height
                          margin:
                          const EdgeInsets.fromLTRB(10.0, 10.0, 10.0, 0.0),
                          // Equivalent to layout_marginStart, layout_marginTop, layout_marginEnd
                          color: Colors
                              .white, // Equivalent to android:background="@color/white"
                        ),
                        Container(
                          margin: const EdgeInsets.only(left: 10.0, right: 10.0),
                          height: 50.0,
                          child: Row(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Expanded(
                                child: TextUtils.display(
                                  priceText,
                                  maxLines: 1,
                                  overflow: TextOverflow.ellipsis,
                                  color: AppColors.sortTextColor,
                                  fontSize: 14.0,
                                  fontFamily: 'Poppins',
                                ),
                              ),
                              Visibility(
                                visible: showStrikeOffText,
                                child: TextUtils.display(
                                  strikeOffText.toString(),
                                  color: AppColors.sortTextColor,
                                  fontSize: 14.0,
                                  fontFamily: 'Poppins',
                                ),
                              ),
                              Visibility(
                                visible: showOffers,
                                child: Card(
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(5.0),
                                  ),
                                  color: AppColors.cardBackColor,
                                  child: Padding(
                                    padding: const EdgeInsets.symmetric(
                                        vertical: 4.0, horizontal: 8.0),
                                    child: TextUtils.display(
                                      offersText.toString(),
                                      fontSize: 12.0,
                                      fontWeight: FontWeight.bold,
                                      color: Colors.white,
                                      fontFamily: 'Poppins',
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                        Container(
                          width: double.infinity,
                          // Equivalent to match_parent
                          height: 1.0,
                          // Equivalent to 1dp height
                          margin:
                          const EdgeInsets.fromLTRB(10.0, 10.0, 10.0, 0.0),
                          // Equivalent to layout_marginStart, layout_marginTop, layout_marginEnd
                          color: Colors
                              .white, // Equivalent to android:background="@color/white"
                        ),
                        Row(
                          children: [
                            Container(
                              margin:
                              const EdgeInsets.only(left: 10.0, right: 10.0),
                              height: 50.0,
                              child: TextUtils.display(
                                AppStrings.premiumQuality,
                                fontSize: 14.0,
                                fontWeight: FontWeight.normal,
                                color: AppColors.productDetailText,
                                fontFamily: 'Poppins',
                              ),
                            ),
                          ],
                        ),
                        Row(
                          children: [
                            Container(
                              margin:
                              const EdgeInsets.only(left: 10.0, right: 10.0),
                              height: 50.0,
                              child: TextUtils.display(
                                AppStrings.thirtyDayMoneyBackGuarantee,
                                fontSize: 14.0,
                                fontWeight: FontWeight.normal,
                                color: AppColors.productDetailText,
                                fontFamily: 'Poppins',
                              ),
                            ),
                          ],
                        ),
                        Row(
                          children: [
                            Container(
                              margin:
                              const EdgeInsets.only(left: 10.0, right: 10.0),
                              height: 50.0,
                              child: TextUtils.display(
                                AppStrings.fastAndFreeShipping,
                                fontSize: 14.0,
                                fontWeight: FontWeight.normal,
                                color: AppColors.productDetailText,
                                fontFamily: 'Poppins',
                              ),
                            ),
                          ],
                        ),
                        /*Row(children: [Container(
                        width: double.infinity,
                        // Equivalent to match_parent
                        height: 1.0,
                        // Equivalent to 1dp height
                        margin:
                        const EdgeInsets.fromLTRB(10.0, 10.0, 10.0, 0.0),
                        // Equivalent to layout_marginStart, layout_marginTop, layout_marginEnd
                        color: Colors
                            .white, // Equivalent to android:background="@color/white"
                      ),],),
                      Row(children: [Container(
                        margin: const EdgeInsets.only(left: 10.0, right: 10.0),
                        height: 50.0,
                        child: TextUtils.display(
                          AppStrings.quantity,
                          fontSize: 14.0,
                          fontWeight: FontWeight.normal,
                          color: AppColors.productDetailBack,
                          fontFamily: 'Poppins',
                        ),
                      ),],),
                      Row(children: [Container(
                        margin: const EdgeInsets.all( 10.0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            GestureDetector(
                              onTap: () {

                              },
                              child: Container(
                                width: 40.0,
                                // Set the desired width for the button
                                alignment: Alignment.center,
                                child: TextUtils.display(
                                  '-',
                                  fontSize: 18,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ),
                            TextUtils.display(
                              "cartCount ", // Replace with actual count
                              fontSize: 18,
                              color: AppColors.sortTextColor,
                              // Replace with your color
                              fontWeight: FontWeight.bold,
                            ),
                            GestureDetector(
                              onTap: () {
                              },
                              child: Container(
                                width: 40.0,
                                // Set the desired width for the button
                                alignment: Alignment.center,
                                child: TextUtils.display(
                                  '+',
                                  fontSize: 18,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),],),
                      Row(children: [Container(
                        width: double.infinity,
                        // Equivalent to match_parent
                        height: 1.0,
                        // Equivalent to 1dp height
                        margin:
                        const EdgeInsets.fromLTRB(10.0, 10.0, 10.0, 10.0),
                        // Equivalent to layout_marginStart, layout_marginTop, layout_marginEnd
                        color: Colors
                            .white, // Equivalent to android:background="@color/white"
                      ),],),
                      Row(children: [Container(
                        margin: const EdgeInsets.only(left: 10.0, right: 10.0),
                        height: 50.0,
                        child: TextUtils.display(
                          AppStrings.estimateDelivery,
                          fontSize: 14.0,
                          fontWeight: FontWeight.normal,
                          color: AppColors.productDetailBack,
                          fontFamily: 'Poppins',
                        ),
                      ),],)*/
                      ])),
                ),
              ],)

            ],
          );
        },
      ),
    );
  }
}
