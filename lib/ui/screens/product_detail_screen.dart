import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_fabby_demo/models/product_detail_model.dart';
import 'package:flutter_fabby_demo/ui/lists/frequestly_bought_together_list.dart';
import 'package:flutter_fabby_demo/ui/lists/product_description_list.dart';
import 'package:flutter_fabby_demo/ui/lists/similar_product_list.dart';
import 'package:flutter_fabby_demo/ui/screens/member_checkout_screen.dart';
import 'package:flutter_fabby_demo/ui/screens/top_bar_detail.dart';
import 'package:flutter_fabby_demo/utils/logger_service.dart';
import 'package:flutter_fabby_demo/utils/snackbar_utils.dart';
import 'package:flutter_fabby_demo/viewModels/product_detail_viewmodel.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';
import 'package:provider/provider.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';
import 'package:url_launcher/url_launcher.dart';

import '../../AppConstant/app_constant.dart';
import '../../colors/colors.dart';
import '../../strings/strings.dart';
import '../../utils/image_utils.dart';
import '../../utils/navigation_service.dart';
import '../../utils/text_utils.dart';
import '../dialog/custom_add_to_cart_dialog.dart';
import '../dialog/custom_dialog.dart';
import '../dialog/sort_filter_drpdown.dart';
import '../lists/frequently_bought_choose_item_list.dart';
import '../lists/product_tag_list.dart';
import 'checkout_screen.dart';

class ProductDetailScreen extends StatefulWidget {
  const ProductDetailScreen({super.key});

  @override
  _ProductDetailScreenState createState() => _ProductDetailScreenState();
}

class _ProductDetailScreenState extends State<ProductDetailScreen> {
  late String estimateDeliveryDate;
  late TextEditingController _pinCodeController;
  List<int> selectedProductIds = [];
  String addToCartStatus = "";

  // Error messages and visibility flags for each text field
  String _pinError = "";

  bool _showPinError = false;
  bool _showDate = false;
  bool _callCheck = false;
  bool _wishlist = false;

  int productCount = 1;
  late ProductDetailViewModel viewModel;
  final PageController _pageController = PageController();
  List<String> _imageUrls = [];
  List<ProductTag> _tag = [];
  List<ProductDescription>? productDescription = [];
  List<RelatedProducts>? relatedProducts = [];
  List<SimilarProducts>? similarProducts = [];
  String productIdString = AppConstants.noData;
  String productName = "";
  String slug = "";
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

  bool isValidPinCode(String pincode) {
    // Check if the pincode is not empty
    if (pincode.isEmpty) {
      return false;
    }

    // Define a regular expression for a valid pincode
    final RegExp pinCodeRegExp = RegExp(r'^[0-9]{5,6}$');

    // Test the pincode against the regular expression
    return pinCodeRegExp.hasMatch(pincode);
  }

  void addToCartDialog(BuildContext context, String title, String productName) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return CustomAddToCartDialog(
          maxLines: 2,
          title: title,
          message: productName,
          onButtonPressed: () {
            _callProductList(productIdString);
          },
          buttonText: 'ok', // Customize button text if needed
        );
      },
    );
  }

  @override
  void initState() {
    super.initState();
    viewModel = Provider.of<ProductDetailViewModel>(context, listen: false);

    // Initialize the controllers
    _pinCodeController = TextEditingController();

    _pinCodeController.addListener(() {
      String pinCode = _pinCodeController.text;

      // Update the state only once at the end to avoid multiple `setState` calls
      setState(() {
        if (pinCode.isEmpty) {
          _pinError = AppStrings.thisFieldIsRequired;
          _showPinError = true;
          _callCheck = false;
        } else if (isValidPinCode(pinCode) && pinCode.length == 6) {
          _pinError = "";
          _showPinError = false;
          _callCheck = true;
        } else {
          _pinError = "Invalid Pin Code";
          _showPinError = true;
          _callCheck = false;
        }
      });
    });

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

  void showSimpleDialog(BuildContext context, String message) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return CustomDialog(
          maxLines: 2,
          message: message,
          onButtonPressed: () {
            _callProductList(productIdString);
          },
          buttonText: 'ok', // Customize button text if needed
        );
      },
    );
  }

  double totalPrice = 0.0;

  void updateTotalPrice(double newTotalPrice) {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      if (mounted) {
        // Check if the widget is still mounted
        setState(() {
          totalPrice = newTotalPrice;
        });
      }
    });
  }

  List<RelatedProducts> selectedProducts = [];

  void updateSelectedProducts(List<RelatedProducts> selectedItems) {
    setState(() {
      selectedProducts = selectedItems;
    });
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
          slug = viewModel.productDetailMode?.data?.products?[0].slug ?? "";
          _wishlist = viewModel.productDetailMode?.data?.wishlist ?? false;
          productDescription =
              viewModel.productDetailMode?.data?.productDescription;
          relatedProducts = viewModel.productDetailMode?.data?.relatedProducts;
          similarProducts = viewModel.productDetailMode?.data?.similarProducts;
          //LoggerService.d("products: ", products?.length);

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

            //LoggerService.d("listSize", _tag.length);
            productName = products[0].productName ?? "";

            // Ensure the UI is updated
            WidgetsBinding.instance.addPostFrameCallback((_) {
              setState(() {}); // Update the state after the build
            });
          } else {
            //LoggerService.d('No products available');
            _imageUrls = []; // Clear images if no products are available
          }

          return SingleChildScrollView(
            child: Column(
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
                              padding:
                                  const EdgeInsets.symmetric(vertical: 16.0),
                              child: Align(
                                alignment: Alignment
                                    .bottomCenter, // Center horizontally
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
                Row(
                  children: [
                    Expanded(
                      child: Container(
                          width: double.infinity,
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
                                GestureDetector(
                                  onTap: () {
                                    SortAndFilterDropdown(
                                      context: context,
                                      partnerView: const SizedBox.shrink(),
                                      // You can pass any Widget if required
                                      result: Constants.allProductSort,
                                      // Pass the initial selected sort option
                                      itemClick:
                                          MyItemClickListener(context),
                                      productId: productId,// Implement the listener
                                    ).showShareDropdown();
                                    // Show the sort dropdown
                                  },
                                  child: Container(
                                    margin: const EdgeInsets.all(10.0),
                                    child: PngImage.asset(
                                      'assets/share_pro_details.png',
                                      width: 30.0,
                                      height: 30.0,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                            Visibility(
                              visible: _tag.isNotEmpty,
                              child: Container(
                                margin: const EdgeInsets.all(10.0),
                                height: 200.0,
                                child: Flexible(
                                  child: ProductTagList(items: _tag),
                                ),
                              ),
                            ),
                            Container(
                              width: double.infinity,
                              // Equivalent to match_parent
                              height: 1.0,
                              // Equivalent to 1dp height
                              margin: const EdgeInsets.fromLTRB(
                                  10.0, 10.0, 10.0, 0.0),
                              // Equivalent to layout_marginStart, layout_marginTop, layout_marginEnd
                              color: Colors
                                  .white, // Equivalent to android:background="@color/white"
                            ),
                            Container(
                              margin: const EdgeInsets.only(
                                  left: 10.0, right: 10.0),
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
                                        borderRadius:
                                            BorderRadius.circular(5.0),
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
                              margin: const EdgeInsets.fromLTRB(
                                  10.0, 10.0, 10.0, 0.0),
                              // Equivalent to layout_marginStart, layout_marginTop, layout_marginEnd
                              color: Colors
                                  .white, // Equivalent to android:background="@color/white"
                            ),
                            Row(
                              children: [
                                Container(
                                  margin: const EdgeInsets.only(
                                      left: 10.0, right: 10.0),
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
                                  margin: const EdgeInsets.only(
                                      left: 10.0, right: 10.0),
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
                                  margin: const EdgeInsets.only(
                                      left: 10.0, right: 10.0),
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
                            Row(
                              children: [
                                Flexible(
                                    child: Container(
                                  width: double.infinity,
                                  // Equivalent to match_parent
                                  height: 1.0,
                                  // Equivalent to 1dp height
                                  margin: const EdgeInsets.fromLTRB(
                                      10.0, 5.0, 10.0, 5.0),
                                  // Equivalent to layout_marginStart, layout_marginTop, layout_marginEnd
                                  color: Colors
                                      .white, // Equivalent to android:background="@color/white"
                                )),
                              ],
                            ),
                            Row(
                              children: [
                                Container(
                                  margin: const EdgeInsets.only(
                                      left: 10.0, right: 10.0),
                                  height: 50.0,
                                  child: TextUtils.display(
                                    AppStrings.quantity,
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
                                  margin: const EdgeInsets.only(
                                      left: 10.0,
                                      right: 10.0,
                                      top: 5.0,
                                      bottom: 5.0),
                                  child: Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      GestureDetector(
                                        onTap: () {},
                                        child: Container(
                                          width: 100,
                                          height: 35,
                                          decoration: BoxDecoration(
                                            color: Colors.white,
                                            // Equivalent to `solid android:color="@color/white"`
                                            border: Border.all(
                                              color: AppColors.fabbyBondiBlue,
                                              // Equivalent to `stroke android:color="@color/light_blue_fabby"`
                                              width:
                                                  1.0, // Equivalent to `stroke android:width="@dimen/_1sdp"`
                                            ),
                                            borderRadius: BorderRadius.circular(
                                                5.0), // Equivalent to `corners android:radius="5dp"`
                                          ),
                                          child: Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceBetween,
                                            children: [
                                              GestureDetector(
                                                onTap: () {
                                                  if (productCount > 1) {
                                                    setState(() {
                                                      productCount =
                                                          productCount - 1;
                                                    });
                                                  }
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
                                                productCount.toString(),
                                                // Replace with actual count
                                                fontSize: 18,
                                                color: AppColors.sortTextColor,
                                                // Replace with your color
                                                fontWeight: FontWeight.bold,
                                              ),
                                              GestureDetector(
                                                onTap: () {
                                                  setState(() {
                                                    productCount =
                                                        productCount + 1;
                                                  });
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
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                            Row(
                              children: [
                                Flexible(
                                    child: Container(
                                  width: double.infinity,
                                  // Equivalent to match_parent
                                  height: 1.0,
                                  // Equivalent to 1dp height
                                  margin: const EdgeInsets.fromLTRB(
                                      10.0, 5.0, 10.0, 5.0),
                                  // Equivalent to layout_marginStart, layout_marginTop, layout_marginEnd
                                  color: Colors
                                      .white, // Equivalent to android:background="@color/white"
                                )),
                              ],
                            ),
                            Row(
                              children: [
                                Container(
                                  margin: const EdgeInsets.only(
                                      left: 10.0, right: 10.0),
                                  height: 50.0,
                                  child: TextUtils.display(
                                    AppStrings.estimateDelivery,
                                    fontSize: 14.0,
                                    fontWeight: FontWeight.normal,
                                    color: AppColors.productDetailText,
                                    fontFamily: 'Poppins',
                                  ),
                                ),
                              ],
                            ),
                            Container(
                              margin:
                                  const EdgeInsets.only(left: 10.0, top: 10.0),
                              height: 50.0,
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                                  Container(
                                    width: 200.0,
                                    height: 40.0,
                                    margin: const EdgeInsets.only(right: 10.0),
                                    child: TextField(
                                      controller: _pinCodeController,
                                      decoration: InputDecoration(
                                        hintText: 'Enter Pincode',
                                        hintStyle: const TextStyle(
                                          color: Colors.grey,
                                          // Replace with your hint color
                                          fontSize: 13.0,
                                        ),
                                        filled: true,
                                        fillColor: Colors.white,
                                        // Replace with your background color
                                        contentPadding:
                                            const EdgeInsets.symmetric(
                                                horizontal: 10.0,
                                                vertical: 5.0),
                                        border: OutlineInputBorder(
                                          borderRadius:
                                              BorderRadius.circular(5.0),
                                          borderSide: const BorderSide(
                                            color: AppColors.lightGrayAlpha,
                                            // Change this to your desired border color
                                            width:
                                                1.0, // Border width when focused
                                          ), // Adjust radius if needed
                                        ),
                                      ),
                                    ),
                                  ),
                                  Container(
                                    width: 100.0,
                                    height: 40.0,
                                    margin: const EdgeInsets.only(left: 10.0),
                                    child: ElevatedButton(
                                      style: ElevatedButton.styleFrom(
                                        backgroundColor:
                                            AppColors.fabbyBondiBlue,
                                        // Ensure this color contrasts with white text
                                        shape: RoundedRectangleBorder(
                                          borderRadius:
                                              BorderRadius.circular(20.0),
                                        ),
                                      ),
                                      onPressed: () async {
                                        //LoggerService.d("pinCodeText: ", _callCheck);
                                        if (_callCheck) {
                                          await viewModel.checkEstimateDelivery(
                                              _pinCodeController.text);
                                          if (viewModel
                                                  .checkEstimateDeliveryModel
                                                  ?.success ==
                                              true) {
                                            final estimateDelivery = viewModel
                                                .checkEstimateDeliveryModel
                                                ?.data;
                                            setState(() {
                                              _showDate = true;
                                              estimateDeliveryDate =
                                                  "Delivery in ${estimateDelivery?.days} Days, ${estimateDelivery?.date}";
                                            });
                                          } else {
                                            SnackbarService.showErrorSnackbar(
                                                context,
                                                viewModel
                                                        .checkEstimateDeliveryModel
                                                        ?.statusCode ??
                                                    "Something went wrong");
                                          }
                                        } else {
                                          _pinError =
                                              AppStrings.thisFieldIsRequired;
                                          _showPinError = true;
                                        }
                                      },
                                      child: TextUtils.display(
                                        AppStrings.check,
                                        color: Colors.white,
                                        fontSize: 13.0,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            if (_showPinError)
                              Container(
                                padding: const EdgeInsets.only(left: 5.0),
                                alignment: Alignment.topLeft,
                                child: TextUtils.errorText(
                                  _pinError,
                                  fontSize: 15.0,
                                  fontWeight: FontWeight.normal,
                                  color: Colors.red,
                                  textAlign: TextAlign.start,
                                  maxLines: 1,
                                  fontFamily: 'Poppins',
                                ),
                              ),
                            if (_showDate)
                              Container(
                                padding: const EdgeInsets.only(left: 5.0),
                                alignment: Alignment.topLeft,
                                child: TextUtils.errorText(
                                  estimateDeliveryDate,
                                  fontSize: 15.0,
                                  fontWeight: FontWeight.normal,
                                  color: AppColors.productDetailText,
                                  textAlign: TextAlign.start,
                                  maxLines: 1,
                                  fontFamily: 'Poppins',
                                ),
                              ),
                            Container(
                              margin:
                                  const EdgeInsets.only(left: 10.0, top: 20.0),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                                  // Image
                                  GestureDetector(
                                    onTap: () async {
                                      String mainId =
                                          await viewModel.getMainId();
                                      String? guestId =
                                          await viewModel.getGuestId();
                                      final requestBody = {
                                        'slug': slug,
                                        'product_id': productId,
                                        'userid': mainId,
                                        'guestid': guestId,
                                      };
                                      await viewModel.favourite(requestBody);
                                      if (viewModel.favouriteModel?.success ==
                                          true) {
                                        showSimpleDialog(
                                            context,
                                            viewModel.favouriteModel
                                                    ?.statusCode ??
                                                "Something went wrong");
                                      } else {
                                        SnackbarService.showErrorSnackbar(
                                            context,
                                            viewModel.favouriteModel
                                                    ?.statusCode ??
                                                "Something went wrong");
                                      }
                                    },
                                    child: PngImage.asset(
                                      _wishlist
                                          ? 'assets/wishlist1.png'
                                          : 'assets/wishlist_grey.png',
                                      width: 55.0,
                                      height: 55.0,
                                    ),
                                  ), // Replace with your image asset

                                  const SizedBox(width: 10.0),
                                  // Text with drawable end
                                  GestureDetector(
                                    onTap: () async {
                                      String mainId =
                                          await viewModel.getMainId();
                                      String? guestId =
                                          await viewModel.getGuestId();
                                      final requestBody = {
                                        'cart_count': productCount,
                                        'guestid': guestId,
                                        'product_id': productId,
                                        "product_name": productName,
                                        "store_id": AppConstants.storeId,
                                        'userid': mainId,
                                      };
                                      await viewModel.addToCart(requestBody);
                                      if (viewModel.addToCartModel?.success ==
                                          true) {
                                        if (viewModel
                                                .addToCartModel?.statusCode ==
                                            "Success") {
                                          setState(() {
                                            addToCartStatus = "1";
                                          });
                                          addToCartDialog(
                                              context,
                                              AppStrings.addedToCart,
                                              productName);
                                        } else {
                                          addToCartDialog(
                                              context,
                                              AppStrings.productAlreadyInCart,
                                              productName);
                                        }
                                      } else {
                                        SnackbarService.showErrorSnackbar(
                                            context,
                                            viewModel.addToCartModel
                                                    ?.statusCode ??
                                                "Something went wrong");
                                      }
                                    },
                                    child: Container(
                                      width: 150.0,
                                      height: 50.0,
                                      padding: const EdgeInsets.symmetric(
                                          horizontal: 10.0),
                                      decoration: BoxDecoration(
                                        color: AppColors.transparentColor,
                                        // Replace with your drawable background
                                        borderRadius:
                                            BorderRadius.circular(20.0),
                                        border: Border.all(
                                          color: Colors
                                              .black, // Black border color
                                          width: 1.0, // Border width
                                        ), // Rounded corners
                                      ),
                                      child: Row(
                                        mainAxisSize: MainAxisSize.min,
                                        children: [
                                          Expanded(
                                            child: Center(
                                              child: TextUtils.display(
                                                addToCartStatus.isNotEmpty
                                                    ? AppStrings.addedToCart
                                                    : AppStrings.addToCart,
                                                fontFamily: 'Poppins',
                                                fontSize: 13.0,
                                                fontWeight: FontWeight.w400,
                                                color: Colors.black,
                                              ),
                                            ),
                                          ),
                                          const SizedBox(width: 10.0),
                                          PngImage.asset(
                                              'assets/cart_icon_new.png',
                                              width: 20.0,
                                              height: 20.0),
                                          // Replace with your drawable end icon
                                        ],
                                      ),
                                    ),
                                  ),
                                  const SizedBox(width: 10.0),
                                  // Card with Text
                                  GestureDetector(
                                    onTap: () async {
                                      String mainId =
                                          await viewModel.getMainId();
                                      String? guestId =
                                          await viewModel.getGuestId();
                                      String? loginSuccess =
                                          await viewModel.getLoginSuccess();
                                      final requestBody = {
                                        'buy_now': AppConstants.buyNow,
                                        'cart_count':
                                            AppConstants.wishListCartCount,
                                        'guestid': guestId,
                                        'product_id': productId,
                                        "product_name": productName,
                                        "store_id": AppConstants.storeId,
                                        'user_id': mainId,
                                      };
                                      await viewModel
                                          .addToCartBuyNow(requestBody);
                                      if (viewModel
                                              .addToCartModelBuyNow?.success ==
                                          true) {
                                        if (loginSuccess?.isNotEmpty == true) {
                                          LoggerService.d("stat: ", "member");
                                          NavigationService.navigateToWithData(
                                              const MemberCheckoutScreen(),
                                              data: {
                                                "discount":
                                                    AppConstants.buyNowDiscount,
                                                "coupon":
                                                    AppConstants.blankLimit,
                                                "buy_now": AppConstants.buyNow
                                              });
                                        } else {
                                          LoggerService.d("stat: ", "guest");
                                          NavigationService.navigateToWithData(
                                              const CheckoutScreen(),
                                              data: {
                                                "discount":
                                                    AppConstants.buyNowDiscount,
                                                "coupon":
                                                    AppConstants.blankLimit,
                                                "buy_now": AppConstants.buyNow
                                              });
                                        }
                                      } else {
                                        SnackbarService.showErrorSnackbar(
                                            context,
                                            viewModel.addToCartModelBuyNow
                                                    ?.statusCode ??
                                                "Something went wrong");
                                      }
                                    },
                                    child: Card(
                                      margin: const EdgeInsets.only(left: 10.0),
                                      color: AppColors.fabbyBondiBlue,
                                      // Replace with your card background color
                                      shape: RoundedRectangleBorder(
                                        borderRadius:
                                            BorderRadius.circular(20.0),
                                      ),
                                      child: SizedBox(
                                        width: 120.0,
                                        height: 50.0,
                                        child: Center(
                                          child: TextUtils.display(
                                            AppStrings.buyNow,
                                            fontFamily: 'Poppins',
                                            fontSize: 14.0,
                                            fontWeight: FontWeight.w600,
                                            color: Colors.white,
                                          ),
                                        ),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            Container(
                              margin: const EdgeInsets.only(
                                  left: 10.0, right: 10.0, top: 10.0),
                              height: 50.0,
                              child: TextUtils.display(
                                AppStrings.morePaymentOptions,
                                fontSize: 14.0,
                                fontWeight: FontWeight.normal,
                                color: AppColors.productDetailText,
                                fontFamily: 'Poppins',
                              ),
                            ),
                            Container(
                              margin: const EdgeInsets.only(
                                  left: 10.0, right: 10.0, bottom: 10.0),
                              width: double.infinity,
                              child: PngImage.asset('assets/payment_icons.png',
                                  width: double.infinity, height: 40.0),
                            ),
                          ])),
                    )
                  ],
                ),
                Visibility(
                  visible: productDescription!.isNotEmpty,
                  child: Container(
                    margin: const EdgeInsets.only(left: 10.0, right: 10.0),
                    height: 250.0,
                    child: ProductDescriptionList(
                      items: productDescription,
                      onToggle: (int index) {},
                    ),
                  ),
                ),
                Visibility(
                    visible: relatedProducts!.isNotEmpty,
                    child: Container(
                      margin: const EdgeInsets.only(
                          left: 20.0, right: 20.0, bottom: 20.0),
                      decoration: BoxDecoration(
                        color: Colors.transparent,
                        // Equivalent to @color/transparent
                        borderRadius: BorderRadius.circular(5.0),
                        // Equivalent to android:radius="5dp"
                        border: Border.all(
                          color: AppColors.lightBlueFabby,
                          // Replace with actual color value for @color/light_blue_fabby
                          width:
                              1.0, // Replace with actual dimension value for @dimen/_1sdp
                        ),
                      ),
                      child: Column(
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Container(
                                margin: const EdgeInsets.only(
                                  top: 10.0,
                                ),
                                child: TextUtils.display(
                                    AppStrings.frequentlyBoughtTogether,
                                    fontSize: 17.0,
                                    fontWeight: FontWeight.w600,
                                    color: AppColors.productDetailText,
                                    fontFamily: 'Poppins'),
                              ),
                            ],
                          ),
                          Container(
                            margin: const EdgeInsets.all(10.0),
                            height: 150.0,
                            child: FrequentlyBoughtTogetherList(
                              items: relatedProducts,
                            ),
                          ),
                          Row(
                            children: [
                              Container(
                                margin: const EdgeInsets.all(20.0),
                                child: TextUtils.display(
                                    "Total Price: ₹$totalPrice",
                                    fontSize: 14.0,
                                    fontWeight: FontWeight.normal,
                                    color: AppColors.sortTextColor,
                                    fontFamily: 'Poppins'),
                              )
                            ],
                          ),
                          Visibility(
                            visible: relatedProducts!.isNotEmpty,
                            child: Container(
                              margin: const EdgeInsets.all(10.0),
                              height: 300.0,
                              child: Frequentlyboughtchooseitemlist(
                                items: relatedProducts,
                                onTotalPriceUpdated: updateTotalPrice,
                                onItemsSelected: updateSelectedProducts,
                              ),
                            ),
                          ),
                          GestureDetector(
                            onTap: () async {
                              //LoggerService.d("check: ", "click");
                              String mainId = await viewModel.getMainId();
                              String? guestId = await viewModel.getGuestId();
                              for (int i = 0;
                                  i < relatedProducts!.length;
                                  i++) {
                                selectedProductIds.add(relatedProducts![i]
                                    .id!
                                    .toInt()); // Convert num to int
                              }
                              await viewModel.moveToCartFrequently(
                                  selectedProductIds,
                                  int.parse(mainId),
                                  guestId ?? "");
                              if (viewModel
                                      .frequentlyMoveToCartModel?.success ==
                                  true) {
                                showSimpleDialog(context,
                                    "items added to cart successfully");
                              } else {
                                SnackbarService.showErrorSnackbar(
                                    context,
                                    viewModel.frequentlyMoveToCartModel
                                            ?.statusCode ??
                                        "Something went wrong");
                              }
                            },
                            child: Card(
                              margin: const EdgeInsets.only(
                                  left: 20.0, right: 20.0, bottom: 20.0),
                              color: AppColors.fabbyBondiBlue,
                              // Replace with your card background color
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(20.0),
                              ),
                              child: SizedBox(
                                height: 35.0,
                                child: Center(
                                  child: TextUtils.display(
                                    AppStrings.addToCart,
                                    fontFamily: 'Poppins',
                                    fontSize: 14.0,
                                    fontWeight: FontWeight.w600,
                                    color: Colors.white,
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    )),
                Container(
                  margin: const EdgeInsets.only(top: 10.0, bottom: 10.0),
                  child: TextUtils.display(AppStrings.otherProductsYouMayLike,
                      fontSize: 18.0,
                      fontWeight: FontWeight.bold,
                      color: AppColors.productDetailText,
                      fontFamily: 'Poppins'),
                ),
                Visibility(
                  visible: similarProducts!.isNotEmpty,
                  child: Container(
                    margin: const EdgeInsets.all(10.0),
                    height: 300.0,
                    child: SimilarProductList(
                      items: similarProducts,
                      onMoveToProductDetail: (i) {
                        //LoggerService.d("ok: ",i);
                        final productId = similarProducts?[i].id ?? 0;
                        _callProductList(productId.toString());
                      },
                    ),
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

class MyItemClickListener implements OnAdapterItemClickListener {
  final BuildContext context;

  MyItemClickListener(this.context); // Constructor to receive BuildContext
  @override
  void onClick(String sortOption,int productId) {
    LoggerService.d("Selected option: $sortOption");
    if (sortOption == "80") {
      shareWhatsapp(context,productId);
    } else if (sortOption == "81") {
      shareFacebook(context,productId);
    } else if (sortOption == "82") {
      String url=generateLink(productId);
      shareLinkOnInstagram(url);
    } else if (sortOption == "83") {
      shareTextOnTwitter(context,productId);
    } else if (sortOption == "84") {
      copy(context,productId);
    }
  }

  Future<void> shareWhatsapp(BuildContext context,int productId) async {
    final String message =
        generateLink(productId); // Replace with your actual link generation logic
    final String whatsappUrl = "whatsapp://send?text=$message";

    try {
      final Uri uri = Uri.parse(whatsappUrl);
      if (await canLaunchUrl(uri)) {
        await launchUrl(uri);
      } else {
        SnackbarService.showErrorSnackbar(
            context, "WhatsApp is not installed.");
      }
    } catch (e) {
      SnackbarService.showErrorSnackbar(context, "WhatsApp is not installed.");
    }
  }

  Future<void> shareFacebook(BuildContext context,int productId) async {
    final String link = generateLink(productId); // Replace with your actual link generation logic
    final String facebookUrl = "https://www.facebook.com/sharer/sharer.php?u=$link";

    final Uri uri = Uri.parse(facebookUrl);

    try {
      // Check if the Facebook app is installed
      final bool isFacebookInstalled = await canLaunchUrl(Uri.parse("fb://"));

      if (isFacebookInstalled) {
        // If Facebook app is installed, use the app with just the URL
        await launchUrl(Uri.parse("fb://faceweb/f?href=$link"));
      } else {
        // Open in browser if Facebook app is not installed
        await launchUrl(uri);
      }
    } catch (e) {
      SnackbarService.showErrorSnackbar(context, "Could not open Facebook.");
    }
  }

  void shareLinkOnInstagram(String url) async {
    final instagramUrl = 'instagram://url?path=${Uri.encodeFull(url)}';

    if (await canLaunch(instagramUrl)) {
      await launch(instagramUrl);
    } else {
      // Handle the case where Instagram is not installed
      // You can redirect the user to the Instagram website or use a different sharing method
      await launch('https://www.instagram.com');
    }
  }

  Future<void> shareTextOnTwitter(BuildContext context,int productId) async {
    final String message = Uri.encodeComponent(generateLink(productId)); // Encode your message properly
    final String twitterUrl = "https://twitter.com/intent/tweet?text=$message"; // Twitter intent URL

    final Uri uri = Uri.parse(twitterUrl);

    try {
      // Check if Twitter app is installed
      final bool isTwitterInstalled = await canLaunchUrl(Uri.parse("twitter://"));

      if (isTwitterInstalled) {
        // If Twitter app is installed, use the browser intent URL which also works within the app
        await launchUrl(uri, mode: LaunchMode.externalApplication); // Use externalApplication mode for opening
      } else {
        // If not, open in the browser as a fallback
        await launchUrl(uri, mode: LaunchMode.inAppWebView); // Use inAppWebView for browser fallback
      }
    } catch (e) {
      SnackbarService.showErrorSnackbar(context, "Could not open Twitter.");
    }
  }


  Future<void> copy(BuildContext context,int productId) async {
    final String link =
        generateLink(productId); // Replace with your actual link generation logic

    // Copy the link to the clipboard
    await Clipboard.setData(ClipboardData(text: link));

    // Show a snackbar or toast indicating the link was copied
    SnackbarService.showSuccessSnackbar(context, "link copied");
  }


  String generateLink(int productId) {
    // Implement the link generation logic here
    return "https://uat.admin.fabbyfurever.com/product/$productId";
  }
}
