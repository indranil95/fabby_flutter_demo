import 'package:flutter/material.dart';
import 'package:flutter_fabby_demo/utils/logger_service.dart';

import '../../colors/colors.dart';
import '../../strings/strings.dart';
import '../../utils/custom_network_image.dart';
import '../../utils/image_utils.dart';
import '../../utils/text_utils.dart';

class CartListItem extends StatefulWidget {
  final String? imageSrc;
  final String? title;
  final double price;
  final String? cartCount;
  final String? productQuantity;
  final double? discountValue; // Discount value
  final int? discountType; // Discount type (1: Flat discount, 2: Percentage discount)
  final VoidCallback onDelete;
  final VoidCallback onTick;
  final VoidCallback onPlus;
  final VoidCallback onMinus;
  final bool isInitiallyTicked; // New parameter for initial ticked state
  final ValueChanged<double> onPriceChange; // New callback


  const CartListItem({
    super.key,
    required this.imageSrc,
    required this.title,
    required this.price,
    required this.cartCount,
    required this.productQuantity,
    required this.discountValue, // Added discount value
    required this.discountType, // Added discount type
    required this.onDelete,
    required this.onTick,
    required this.onPlus,
    required this.onMinus,
    required this.isInitiallyTicked, // Default to false
    required this.onPriceChange, // Pass the callback here

  });

  @override
  _WishlistItemState createState() => _WishlistItemState();
}

class _WishlistItemState extends State<CartListItem> {
  bool isTicked = false;
  bool outOfStock = false;
  List<bool> outOfStockList = [];

  @override
  void initState() {
    super.initState();
    isTicked = widget.isInitiallyTicked; // Initialize state in initState
    // Calculate the initial price and notify parent
    WidgetsBinding.instance.addPostFrameCallback((_) {
      widget.onPriceChange(calculatePrice());
    });
  }

  @override
  void didUpdateWidget(covariant CartListItem oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (widget.isInitiallyTicked != oldWidget.isInitiallyTicked) {
      setState(() {
        isTicked = widget.isInitiallyTicked; // Update state when widget changes
      });
    }
    // Recalculate the price if any relevant property changes
    if (widget.price != oldWidget.price || widget.cartCount != oldWidget.cartCount || widget.discountValue != oldWidget.discountValue || widget.discountType != oldWidget.discountType) {
      widget.onPriceChange(calculatePrice());
    }
  }
  double calculatePrice() {
    double finalPrice = widget.price;

    // Only apply discount if discountValue and discountType are not null
    if (widget.discountType != null && widget.discountValue != null) {
      if (widget.discountType == 1) {
        // Flat discount
        finalPrice = widget.price - widget.discountValue!;
      } else if (widget.discountType == 2) {
        // Percentage discount
        finalPrice = widget.price - (widget.price * (widget.discountValue! / 100));
      }
    }

    // Ensure cartCount is a valid number
    return finalPrice * (num.tryParse(widget.cartCount ?? '1') ?? 1);
  }

  void _checkStockStatus(int updatedCartCount) {
    final int? productQuantityInt = widget.productQuantity != null ? int.tryParse(widget.productQuantity.toString()) : null;
    final num? productQuantityNum = widget.productQuantity != null ? num.tryParse(widget.productQuantity.toString()) : null;

    if (updatedCartCount == productQuantityInt) {
      setState(() {
        outOfStock = false;
        outOfStockList.add(outOfStock);
      });
    } else if (updatedCartCount > productQuantityNum!) {
      setState(() {
        outOfStock = true;
        outOfStockList.add(outOfStock);
      });
    } else {
      setState(() {
        outOfStock = false;
        outOfStockList.add(outOfStock);
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    double finalPrice = calculatePrice();
    //LoggerService.d("isInitiallyTicked item ${widget.isInitiallyTicked}");
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10.0),
      child: Column(
        children: [
          Row(
            children: [
              Card(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20),
                ),
                child: SizedBox(
                  width: 115,
                  height: 115,
                  child: Stack(
                    children: [
                      // Center the network image
                      Center(
                        child: CustomNetworkImage(
                          imageUrl: widget.imageSrc.toString(),
                          height: double.infinity,
                          width: double.infinity,
                          fit: BoxFit.fill,
                        ),
                      ),
                      // Position the light pink border image in the top left corner
                      Positioned(
                        top: 10,
                        left: 10,
                        child: GestureDetector(
                          onTap: () {
                            setState(() {
                              isTicked = !isTicked;
                            });
                            widget.onTick(); // Correctly invoke onTick
                          },
                          child: SvgImage.asset(
                            isTicked
                                ? 'assets/tick.svg' // Replace with the ticked image asset
                                : 'assets/light_pink_border.svg',
                            // Replace with the unticked image asset
                            width: 16.0,
                            height: 16.0,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: const EdgeInsets.symmetric(vertical: 10.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          const SizedBox(
                            width: 10.0,
                          ),
                          Expanded(
                            child: TextUtils.display(
                              widget.title.toString(),
                              fontSize: 16,
                              color: Colors.black,
                              fontFamily: 'Poppins',
                              fontWeight: FontWeight.normal,
                              maxLines: 2,
                            ),
                          ),
                          const SizedBox(
                            width: 10.0,
                          ),
                          GestureDetector(
                            onTap:
                              widget.onDelete,
                            child: TextUtils.display(AppStrings.remove,
                                fontSize: 13,
                                color: Colors.black,
                                fontFamily: 'Poppins',
                                fontWeight: FontWeight.normal,
                                maxLines: 2,
                                decoration: TextDecoration.underline),
                          ),
                          const SizedBox(
                            width: 10.0,
                          )
                        ],
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 10.0, left: 10.0),
                      child: TextUtils.display(
                        AppStrings.quantity,
                        fontSize: 12,
                        color: AppColors.sortTextColor,
                        fontFamily: 'Poppins',
                        fontWeight: FontWeight.normal,
                        maxLines: 2,
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 10.0, left: 10.0),
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
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            GestureDetector(
                              onTap: () {
                                widget.onMinus();
                                _checkStockStatus(int.parse(widget.cartCount.toString()) - 1);
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
                              "${widget.cartCount} ", // Replace with actual count
                              fontSize: 18,
                              color: AppColors.sortTextColor,
                              // Replace with your color
                              fontWeight: FontWeight.bold,
                            ),
                            GestureDetector(
                              onTap: () {
                                widget.onPlus();
                                _checkStockStatus(int.parse(widget.cartCount.toString()) + 1);
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
                    Visibility(
                      visible: false, // Set to true if out of stock
                      child: Padding(
                        padding: const EdgeInsets.only(top: 10.0),
                        child: TextUtils.display(
                          outOfStock ? 'Out of stock'
                              : 'Only ${widget.productQuantity} items are in stock',
                          color: AppColors.errorTextColor,
                          // Replace with your color
                          fontSize: 14,
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 10.0, right: 10.0),
                      child: Align(
                        alignment: Alignment.centerRight,
                        child: TextUtils.display(
                          "₹${finalPrice.toStringAsFixed(2)}",
                          fontSize: 18,
                          color: AppColors.black,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
          const Divider(
            thickness: 1,
            color: AppColors.fabbyBondiBlueOpa,
            // Replace with your color
            indent: 10,
            endIndent: 10,
            height: 20,
          ),
        ],
      ),
    );
  }
}
