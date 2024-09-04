import 'package:flutter/material.dart';
import 'package:flutter_fabby_demo/models/cart_data_model.dart';
import 'package:flutter_fabby_demo/ui/lists/cartlist_list.dart';
import 'package:flutter_fabby_demo/ui/screens/top_bar_detail.dart';
import 'package:flutter_fabby_demo/utils/snackbar_utils.dart';
import 'package:flutter_fabby_demo/viewModels/cart_viewModel.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';
import 'package:provider/provider.dart';

import '../../AppConstant/app_constant.dart';
import '../../colors/colors.dart';
import '../../strings/strings.dart';
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

  @override
  void initState() {
    viewModel = Provider.of<CartViewModel>(context, listen: false);
    _fetchCartList();
    super.initState();
  }

  Future<void> _fetchCartList() async {
    // Fetch mainId and guestId asynchronously
    String mainId = await viewModel.getMainId();
    String? guestId = await viewModel.getGuestId();

    final requestBody = {
      'buy_now': AppConstants.blankLimit,
      'store_id': AppConstants.storeId,
      'user_id': int.parse(mainId),
      'guestid': guestId ?? null, // Handle the case where guestId is null
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
          message: 'Item removed from wishlist successfully.',
          onButtonPressed: () {
            _fetchCartList();
          },
          buttonText: 'ok', // Customize button text if needed
        );
      },
    );
  }

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
                              onTap: () async {},
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
                        onPlus: (int index) {},
                        onMinus: (int index) {},
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
