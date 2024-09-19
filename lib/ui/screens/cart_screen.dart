import 'package:flutter/material.dart';
import 'package:flutter_fabby_demo/models/cart_data_model.dart';
import 'package:flutter_fabby_demo/ui/lists/cartlist_list.dart';
import 'package:flutter_fabby_demo/ui/screens/member_checkout_screen.dart';
import 'package:flutter_fabby_demo/ui/screens/top_bar_detail.dart';
import 'package:flutter_fabby_demo/utils/navigation_service.dart';
import 'package:flutter_fabby_demo/utils/snackbar_utils.dart';
import 'package:flutter_fabby_demo/viewModels/cart_viewModel.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';
import 'package:provider/provider.dart';

import '../../AppConstant/app_constant.dart';
import '../../colors/colors.dart';
import '../../strings/strings.dart';
import '../../utils/continue_shopping.dart';
import '../../utils/image_utils.dart';
import '../../utils/logger_service.dart';
import '../../utils/text_utils.dart';
import '../dialog/custom_dialog.dart';

class CartScreen extends StatefulWidget {
  const CartScreen({super.key});

  @override
  _CartScreenState createState() => _CartScreenState();
}

class _CartScreenState extends State<CartScreen> {
  List<int> selectedIds = [];
  List<int> selectedProductIds = [];
  String itemCountDisplayText = "0/0 items Selected";
  bool areAllItemsSelected = false; // New variable to track all selection
  late CartViewModel viewModel;
  late final TextEditingController _couponController;
  String? loginSuccess;
  bool memberStat = false;

  @override
  void initState() {
    viewModel = Provider.of<CartViewModel>(context, listen: false);
    _couponController = TextEditingController();
    _fetchCartList();
    _checkLoginStatus();
    super.initState();
  }

  @override
  void dispose() {
    _couponController.dispose();
    super.dispose();
  }

  Future<void> _checkLoginStatus() async {
    loginSuccess = await viewModel.getLoginSuccess();
    setState(() {
      memberStat = loginSuccess?.isNotEmpty == true;
    });
  }

  String _getCouponCode() {
    String couponCode = _couponController.text;
    LoggerService.d('Coupon Code: $couponCode');
    return couponCode;
  }

  Future<void> _fetchCartList() async {
    // Fetch mainId and guestId asynchronously
    String mainId = await viewModel.getMainId();
    String? guestId = await viewModel.getGuestId();

    final requestBody = {
      'buy_now': AppConstants.blankLimit,
      'store_id': AppConstants.storeId,
      'user_id': int.parse(mainId),
      'guestid': guestId, // Handle the case where guestId is null
    };

    viewModel.cartDataList(requestBody);
  }

  void _onItemTick(dynamic itemId, String? productId) {
    setState(() {
      int parsedItemId =
          itemId is int ? itemId : int.tryParse(itemId.toString()) ?? 0;

      // Handle null productId
      int parsedProductId =
          productId != null ? int.tryParse(productId) ?? 0 : 0;

      if (!selectedIds.contains(parsedItemId)) {
        selectedIds.add(parsedItemId);
        selectedProductIds.add(parsedProductId);
      } else {
        selectedIds.remove(parsedItemId);
        selectedProductIds.remove(parsedProductId);
      }
    });
  }

  void _toggleSelectAll(int totalItems) {
    setState(() {
      areAllItemsSelected = !areAllItemsSelected;
      LoggerService.d("areAllItemsSelected $areAllItemsSelected");
      selectedIds.clear();
      selectedProductIds.clear();

      if (areAllItemsSelected) {
        for (var item in viewModel.cartData?.data?.carts ?? []) {
          selectedIds.add(item.id);
          selectedProductIds.add(item.productId);
        }
      }
      _updateItemCountDisplay(totalItems);
    });
  }

  void _updateItemCountDisplay(int totalItems) {
    setState(() {
      if (selectedIds.length <= totalItems) {
        // Update the text with selected and total items
        itemCountDisplayText =
            "${selectedIds.length}/$totalItems items Selected";
        areAllItemsSelected = selectedIds.length == totalItems;
      } else {
        // Reset to 0/0 if count exceeds total items
        itemCountDisplayText = "0/0 items Selected";
      }
    });
  }

  void removeItemDialog(BuildContext context, String message) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return CustomDialog(
          maxLines: 2,
          message: message,
          onButtonPressed: () {
            _fetchCartList();
          },
          buttonText: 'ok', // Customize button text if needed
        );
      },
    );
  }

  void couponDialog(BuildContext context, String message) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return CustomDialog(
          maxLines: 2,
          message: message,
          onButtonPressed: () {},
          buttonText: 'ok', // Customize button text if needed
        );
      },
    );
  }

  double totalPrice = 0.0;
  String discount = "0";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const TopBarDetail(title: AppStrings.cart),
      backgroundColor: AppColors.fabbyBack,
      body: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Consumer<CartViewModel>(
          builder: (context, viewModel, child) {
            if (viewModel.loading) {
              return Center(
                child: LoadingAnimationWidget.staggeredDotsWave(
                    color: AppColors.fabbyBondiBlue, size: 50.0),
              );
            }
            /*if (viewModel.error.isNotEmpty) {
              return Center(
                child: SnackbarService.showErrorSnackbar(context, viewModel.error);

              );
            }*/
            final items = viewModel.cartData?.data?.carts;
            final itemCount = items?.length ?? 0;
            LoggerService.d("itemCount: ", itemCount);
            return Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: Row(
                    children: [
                      GestureDetector(
                        onTap: () {
                          _toggleSelectAll(itemCount);
                        },
                        child: SvgImage.asset(
                            areAllItemsSelected
                                ? 'assets/tick.svg' // Replace with the ticked image asset
                                : 'assets/light_pink_border.svg',
                            width: 16.0,
                            height: 16.0),
                      ),

                      const SizedBox(
                        width: 10.0,
                      ),
                      TextUtils.display(
                        itemCountDisplayText,
                        fontSize: 14.0,
                        // Increased fontSize for larger text
                        color: AppColors.sortTextColor,
                        fontFamily: 'Poppins',
                        fontWeight: FontWeight.normal,
                        textAlign: TextAlign.center, // Center the text
                      ),
                      const Spacer(),
                      // Pushes the next container to the end of the Row
                      Container(
                        alignment: Alignment.centerRight,
                        child: Row(
                          children: [
                            GestureDetector(
                              onTap: () async {
                                LoggerService.d("message", selectedIds);
                                if (selectedIds.isEmpty) {
                                  SnackbarService.showErrorSnackbar(context,
                                      'Please select a product to remove');
                                } else {
                                  String mainId = await viewModel.getMainId();
                                  final requestBody = {
                                    'product_id': selectedIds,
                                    'user_id': mainId,
                                    'cart_count':
                                        AppConstants.cartRemoveSingleCartCount,
                                    'store_id': AppConstants.storeId,
                                  };
                                  await viewModel
                                      .removeMultipleItem(requestBody);
                                  if (viewModel
                                          .removeMultipleItemModel?.success ==
                                      true) {
                                    removeItemDialog(
                                        context,
                                        viewModel.removeMultipleItemModel!
                                                .statusCode ??
                                            'Unknown error occurred');
                                  } else {
                                    SnackbarService.showErrorSnackbar(
                                        context,
                                        viewModel.removeMultipleItemModel!
                                                .statusCode ??
                                            'Unknown error occurred');
                                  }
                                }
                              },
                              child: SvgImage.asset(
                                  'assets/delete_icon_wishlist.svg',
                                  width: 35.0,
                                  height: 35.0),
                            ),
                            const SizedBox(width: 10.0),
                            GestureDetector(
                              onTap: () async {
                                if (selectedProductIds.isEmpty) {
                                  SnackbarService.showErrorSnackbar(context,
                                      'Please select a product to move to wishlist');
                                } else {
                                  String mainId = await viewModel.getMainId();
                                  String? guestId =
                                      await viewModel.getGuestId();
                                  final requestBody = {
                                    'productid': selectedProductIds,
                                    'userid': mainId,
                                    'guestid': guestId,
                                  };
                                  await viewModel.moveToWishList(requestBody);
                                  if (viewModel.moveToWishListModel?.success ==
                                      true) {
                                    removeItemDialog(
                                        context,
                                        viewModel.moveToWishListModel
                                                ?.statusCode ??
                                            'Unknown error occurred');
                                  } else {
                                    SnackbarService.showErrorSnackbar(
                                        context,
                                        viewModel.moveToWishListModel
                                                ?.statusCode ??
                                            'Unknown error occurred');
                                  }
                                }
                              },
                              child: SvgImage.asset('assets/return_icon.svg',
                                  width: 35.0, height: 35.0),
                            ),
                          ],
                        ),
                      )
                    ],
                  ),
                ),
                itemCount > 0
                    ? CartListList(
                        items: items as List<Carts>,
                        onDelete: (int index) async {
                          final item = items[index];
                          String mainId = await viewModel.getMainId();
                          String? guestId = await viewModel.getGuestId();
                          final requestBody = {
                            'cart_count':
                                AppConstants.cartRemoveSingleCartCount,
                            'guestid': guestId,
                            'product_id': item.productId,
                            'store_id': AppConstants.storeId,
                            'user_id': mainId,
                          };
                          await viewModel.removeSingleItem(requestBody);
                          if (viewModel.removeSingleItemModel?.success ==
                              true) {
                            removeItemDialog(
                                context,
                                viewModel.removeSingleItemModel!.statusCode ??
                                    'Unknown error occurred');
                          } else {
                            SnackbarService.showErrorSnackbar(
                                context,
                                viewModel.removeSingleItemModel!.statusCode ??
                                    'Unknown error occurred');
                          }
                        },
                        onTick: (int index) {
                          LoggerService.d('Tick clicked at index: $index');
                          final item = items[index];
                          _onItemTick(item.id, item.product!.productId);
                          _updateItemCountDisplay(itemCount);
                        },
                        onPlus: (int index) async {
                          LoggerService.d('plus clicked at index: $index');
                          final item = items[index];
                          String mainId = await viewModel.getMainId();
                          String? guestId = await viewModel.getGuestId();
                          num count = item.cartCount! + 1;
                          final requestBody = {
                            'cart_count': count,
                            'guestid': guestId,
                            'product_id': item.productId,
                            'product_name': item.productName,
                            'store_id': AppConstants.storeId,
                            'user_id': mainId,
                          };
                          await viewModel.addToCartMain(requestBody);
                          if (viewModel.addToCartModel?.success == true) {
                            _fetchCartList();
                          } else {
                            SnackbarService.showErrorSnackbar(
                                context,
                                viewModel.addToCartModel!.statusCode ??
                                    'Unknown error occurred');
                          }
                        },
                        onMinus: (int index) async {
                          LoggerService.d('Minus clicked at index: $index');
                          final item = items[index];
                          String mainId = await viewModel.getMainId();
                          String? guestId = await viewModel.getGuestId();
                          num count = item.cartCount! - 1;
                          final requestBody = {
                            'cart_count': count,
                            'guestid': guestId,
                            'product_id': item.productId,
                            'product_name': item.productName,
                            'store_id': AppConstants.storeId,
                            'user_id': mainId,
                          };
                          await viewModel.addToCartMain(requestBody);
                          if (viewModel.addToCartModel?.success == true) {
                            _fetchCartList();
                          } else {
                            SnackbarService.showErrorSnackbar(
                                context,
                                viewModel.addToCartModel!.statusCode ??
                                    'Unknown error occurred');
                          }
                        },
                        areAllItemsSelected: areAllItemsSelected,
                        // Pass this to the list
                        onTotalPriceChange: (double newTotalPrice) {
                          // Update the total price when it changes
                          LoggerService.d("total price", newTotalPrice);
                          setState(() {
                            totalPrice = newTotalPrice;
                          });
                        },
                      )
                    : Padding(
                        padding: const EdgeInsets.only(
                            left: 10.0, right: 10.0, top: 10.0, bottom: 10.0),
                        child: SvgImage.asset('assets/ic_no_data.svg',
                            width: double.infinity, height: 250.0),
                      ),
              ],
            );
          },
        ),
      ),
      bottomNavigationBar: Container(
        color: AppColors.couponBack,
        padding: const EdgeInsets.all(10.0),
        child: SizedBox(
          height: 260.0, // Constrain the height of the bottom bar
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                margin: const EdgeInsets.only(left: 10.0),
                child: TextUtils.display(
                  AppStrings.applyCouponCode,
                  fontSize: 16.0,
                  color: AppColors.recentTextColor,
                  fontFamily: 'Poppins',
                  fontWeight: FontWeight.bold,
                  textAlign: TextAlign.start,
                ),
              ),
              Container(
                margin:
                    const EdgeInsets.only(top: 10.0, left: 10.0, right: 10.0),
                height: 40.0,
                decoration: BoxDecoration(
                  color: AppColors.white,
                  // Equivalent to background drawable
                  borderRadius:
                      BorderRadius.circular(8), // Adjust as per your drawable
                ),
                child: Row(
                  children: [
                    Expanded(
                      child: TextField(
                        controller: _couponController,
                        decoration: const InputDecoration(
                          hintText: AppStrings.enterCouponCode,
                          // Replace with your localized string
                          hintStyle: TextStyle(color: Colors.grey),
                          // Customize hint color
                          border: InputBorder.none,
                          contentPadding: EdgeInsets.only(left: 20.0),
                        ),
                        style: const TextStyle(
                            fontSize: 16.0,
                            color: Colors.black), // Customize text style
                      ),
                    ),
                    GestureDetector(
                      onTap: () async {
                        String couponCode = _getCouponCode();
                        String mainId = await viewModel.getMainId();
                        String? guestId = await viewModel.getGuestId();
                        final requestBody = {
                          'promocode': couponCode,
                          'user_id': mainId,
                          'guest_id': guestId,
                        };
                        await viewModel.promoCode(requestBody);
                        if (viewModel.promoCodeModel?.success == true) {
                          couponDialog(context,
                              viewModel.promoCodeModel!.error.toString());
                          _couponController.clear();
                          setState(() {
                            discount = viewModel.promoCodeModel?.data?.dicount
                                    .toString() ??
                                "0";
                          });
                        } else {
                          SnackbarService.showErrorSnackbar(context,
                              viewModel.promoCodeModel!.error.toString());
                        }
                      },
                      child: Container(
                        height: 38.0,
                        // Adjust based on your drawable padding
                        decoration: BoxDecoration(
                          color: AppColors.black,
                          // Replace with your drawable's background color
                          borderRadius: BorderRadius.circular(
                              8), // Customize as per your drawable
                        ),
                        child: Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 10.0),
                          child: Center(
                            child: TextUtils.display(
                              AppStrings.apply,
                              color: AppColors.white,
                              fontSize: 11.0,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              Row(
                children: [
                  Container(
                    margin: const EdgeInsets.only(top: 10.0, left: 10.0),
                    child: TextUtils.display(
                      AppStrings.subtotal,
                      fontSize: 14.0,
                      color: AppColors.recentTextColor,
                      fontFamily: 'Poppins',
                      fontWeight: FontWeight.w500,
                      textAlign: TextAlign.start,
                    ),
                  ),
                  const Spacer(),
                  Container(
                    margin: const EdgeInsets.only(top: 10.0, right: 10.0),
                    child: TextUtils.display(
                      "${AppConstants.rupeeSign} $totalPrice",
                      fontSize: 14.0,
                      color: AppColors.recentTextColor,
                      fontFamily: 'DmSerifDisplay',
                      fontWeight: FontWeight.w500,
                      textAlign: TextAlign.start,
                    ),
                  ),
                ],
              ),
              Row(
                children: [
                  Container(
                    margin: const EdgeInsets.only(top: 10.0, left: 10.0),
                    child: TextUtils.display(
                      AppStrings.couponDiscount,
                      fontSize: 14.0,
                      color: AppColors.recentTextColor,
                      fontFamily: 'Poppins',
                      fontWeight: FontWeight.w500,
                      textAlign: TextAlign.start,
                    ),
                  ),
                  const Spacer(),
                  Container(
                    margin: const EdgeInsets.only(top: 10.0, right: 10.0),
                    child: TextUtils.display(
                      "${AppConstants.rupeeSign} $discount ",
                      fontSize: 14.0,
                      color: AppColors.recentTextColor,
                      fontFamily: 'DmSerifDisplay',
                      fontWeight: FontWeight.w500,
                      textAlign: TextAlign.start,
                    ),
                  ),
                ],
              ),
              // Guest Checkout LinearLayout equivalent
              Visibility(
                visible: !memberStat,
                child: Container(
                  margin: const EdgeInsets.symmetric(horizontal: 20.0),
                  decoration: BoxDecoration(
                    color: Colors.black,
                    borderRadius: BorderRadius.circular(20.0),
                  ),
                  alignment: Alignment.center,
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        TextUtils.display(
                          AppStrings.guestCheckout,
                          fontSize: 16.0,
                          color: AppColors.white,
                          fontWeight: FontWeight.w600,
                        ),
                        const SizedBox(width: 5.0),
                        SvgImage.asset(
                          'assets/guest_checkout.svg',
                          height: 20.0,
                          width: 20.0,
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 16.0),
              Visibility(
                visible: memberStat,
                child: Container(
                  margin: const EdgeInsets.symmetric(horizontal: 10.0),
                  decoration: BoxDecoration(
                    color: AppColors.fabbyBondiBlue,
                    borderRadius: BorderRadius.circular(20.0),
                  ),
                  alignment: Alignment.center,
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        GestureDetector(
                          onTap: () {
                            NavigationService.navigateToWithData(
                                const MemberCheckoutScreen(),
                                data: {
                                  "discount": discount,
                                  "coupon": _couponController.text.toString(),
                                  "buy_now": AppConstants.blankLimit
                                });
                          },
                          child: TextUtils.display(
                            AppStrings.proceedToCheckout,
                            fontFamily: "Poppins",
                            fontSize: 16.0,
                            color: AppColors.white,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                        const SizedBox(width: 5.0),
                        PngImage.asset('assets/cart_icon_new.png',
                            width: 20.0, height: 20.0,color: AppColors.white, ),
                      ],
                    ),
                  ),
                ),
              ),
              Container(
                margin:
                    const EdgeInsets.only(top: 10.0, left: 10.0, right: 10.0),
                child: ContinueShoppingButton(
                  text: AppStrings.continueShopping,
                  height: 40.0,
                  textSize: 15.0,
                  fontWeight: FontWeight.w500,
                  fontFamily: 'Poppins',
                  width: double.infinity,
                  textColor: AppColors.black,
                  onPressed: () {
                    //NavigationService.goBack();
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
