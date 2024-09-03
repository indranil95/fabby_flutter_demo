import 'dart:core';

import 'package:flutter/material.dart';
import 'package:flutter_fabby_demo/AppConstant/app_constant.dart';
import 'package:flutter_fabby_demo/colors/colors.dart';
import 'package:flutter_fabby_demo/models/wishlist_model.dart';
import 'package:flutter_fabby_demo/ui/dialog/custom_add_to_cart_dialog.dart';
import 'package:flutter_fabby_demo/ui/lists/wishlist_list.dart';
import 'package:flutter_fabby_demo/ui/screens/top_bar_detail.dart';
import 'package:flutter_fabby_demo/utils/image_utils.dart';
import 'package:flutter_fabby_demo/utils/logger_service.dart';
import 'package:flutter_fabby_demo/utils/text_utils.dart';
import 'package:flutter_fabby_demo/viewModels/wishlist_viewmodel.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';
import 'package:provider/provider.dart';

import '../../strings/strings.dart';
import '../../utils/snackbar_utils.dart';
import '../dialog/custom_dialog.dart';

class WishListScreen extends StatefulWidget {
  const WishListScreen({super.key});

  @override
  _WishListScreenState createState() => _WishListScreenState();
}

class _WishListScreenState extends State<WishListScreen> {
  List<int> selectedIds = [];
  List<int> selectedProductIds = [];
  String itemCountDisplayText = "0/0 items Selected";
  bool areAllItemsSelected = false; // New variable to track all selection

  late WishlistViewModel viewModel;

  @override
  void initState() {
    viewModel = Provider.of<WishlistViewModel>(context, listen: false);
    _fetchWishlist();
    super.initState();
  }

  Future<void> _fetchWishlist() async {
    // Fetch mainId and guestId asynchronously
    String mainId = await viewModel.getMainId();
    String? guestId = await viewModel.getGuestId();

    final requestBody = {
      'userid': mainId,
      'guestid': guestId ?? "", // Handle the case where guestId is null
    };

    viewModel.wishlist(requestBody);
  }

  void removeItemDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return CustomDialog(
          maxLines: 2,
          message: 'Item removed from wishlist successfully.',
          onButtonPressed: () {
            _fetchWishlist();
          },
          buttonText: 'ok', // Customize button text if needed
        );
      },
    );
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
            _fetchWishlist();
          },
          buttonText: 'ok', // Customize button text if needed
        );
      },
    );
  }

  void removeMultipleItemDialog(BuildContext context, int count) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return CustomDialog(
          maxLines: 2,
          message: '$count Items removed from wishlist successfully.',
          onButtonPressed: () {
            _fetchWishlist();
          },
          buttonText: 'ok', // Customize button text if needed
        );
      },
    );
  }

  void moveToCartDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return CustomDialog(
          maxLines: 2,
          message: 'Items moved to cart successfully',
          onButtonPressed: () {
            _fetchWishlist();
          },
          buttonText: 'ok', // Customize button text if needed
        );
      },
    );
  }

  void _onItemTick(int itemId, int productId) {
    setState(() {
      if (!selectedIds.contains(itemId)) {
        selectedIds.add(itemId);
        selectedProductIds.add(productId);
      } else {
        selectedIds.remove(itemId);
        selectedProductIds.remove(productId);
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
        for (var item in viewModel.wishListData?.data ?? []) {
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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const TopBarDetail(title: AppStrings.wishlist),
      backgroundColor: AppColors.fabbyBack,
      body: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Consumer<WishlistViewModel>(
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
            final items = viewModel.wishListData?.data;
            final itemCount = items?.length ?? 0;
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
                                if (selectedProductIds.isEmpty) {
                                  SnackbarService.showErrorSnackbar(context,
                                      'Please select a product to move to cart');
                                } else {
                                  String mainId = await viewModel.getMainId();
                                  String? guestId =
                                      await viewModel.getGuestId();
                                  await viewModel.moveToCart(selectedProductIds,
                                      int.parse(mainId), guestId.toString());
                                  if (viewModel.moveToCartModel?.statusCode ==
                                      "Success") {
                                    moveToCartDialog(context);
                                  }
                                }
                              },
                              child: SvgImage.asset(
                                  'assets/wishlist_add_to_cart_icon.svg',
                                  width: 35.0,
                                  height: 35.0),
                            ),
                            const SizedBox(width: 10.0),
                            GestureDetector(
                              onTap: () async {
                                LoggerService.d("message", selectedIds);
                                if (selectedIds.isEmpty) {
                                  SnackbarService.showErrorSnackbar(context,
                                      'Please select a product to remove');
                                } else {
                                  final requestBody = {
                                    'ids': selectedIds,
                                  };
                                  await viewModel
                                      .removeWishItemMultiple(requestBody);
                                  if (viewModel
                                          .removeItemModelMultiple?.success ==
                                      true) {
                                    removeMultipleItemDialog(
                                        context, selectedIds.length);
                                  }
                                }
                              },
                              child: SvgImage.asset(
                                  'assets/delete_icon_wishlist.svg',
                                  width: 35.0,
                                  height: 35.0),
                            ),
                          ],
                        ),
                      )
                    ],
                  ),
                ),
                itemCount > 0
                    ? WishListList(
                        items: items as List<Data>,
                        onMoveToCart: (int index) async {
                          // Handle move to cart action here
                          LoggerService.d(
                              'Move to Cart clicked at index: $index');
                          final item = items[index];
                          String mainId = await viewModel.getMainId();
                          String? guestId = await viewModel.getGuestId();
                          final requestBody = {
                            'cart_count': AppConstants.wishListCartCount,
                            'guestid': guestId,
                            'product_id': item.productId,
                            'product_name': item.product.productName,
                            'store_id': AppConstants.storeId,
                            'user_id': mainId,
                          };
                          await viewModel.addToCart(requestBody);
                          if (viewModel.addToCartModel?.statusCode ==
                              "Success") {
                            addToCartDialog(context, AppStrings.addedToCart,
                                item.product.productName);
                          } else {
                            addToCartDialog(
                                context,
                                AppStrings.productAlreadyInCart,
                                item.product.productName);
                          }
                        },
                        onDelete: (int index) async {
                          // Handle delete action here
                          LoggerService.d('Delete clicked at index: $index');
                          final item = items[index];
                          final requestBody = {
                            'ids': item.id,
                          };
                          await viewModel.removeWishItem(requestBody);
                          if (viewModel.removeItemModel?.success == true) {
                            removeItemDialog(context);
                          }
                        },
                        onTick: (int index) {
                          // Handle tick action here
                          LoggerService.d('Tick clicked at index: $index');
                          final item = items[index];
                          _onItemTick(item.id, item.productId);
                          _updateItemCountDisplay(itemCount);
                        },
                        areAllItemsSelected:
                            areAllItemsSelected, // Pass this to the list
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
    );
  }
}
