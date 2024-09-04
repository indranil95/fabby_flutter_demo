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
  final String? price;
  final VoidCallback onDelete;
  final VoidCallback onTick;
  final VoidCallback onPlus;
  final VoidCallback onMinus;
  final bool isInitiallyTicked; // New parameter for initial ticked state

  const CartListItem({
    super.key,
    required this.imageSrc,
    required this.title,
    required this.price,
    required this.onDelete,
    required this.onTick,
    required this.onPlus,
    required this.onMinus,
    required this.isInitiallyTicked, // Default to false
  });

  @override
  _WishlistItemState createState() => _WishlistItemState();
}

class _WishlistItemState extends State<CartListItem> {
  bool isTicked = false;

  @override
  void initState() {
    super.initState();
    isTicked = widget.isInitiallyTicked; // Initialize state in initState
  }

  @override
  void didUpdateWidget(covariant CartListItem oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (widget.isInitiallyTicked != oldWidget.isInitiallyTicked) {
      setState(() {
        isTicked = widget.isInitiallyTicked; // Update state when widget changes
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    LoggerService.d("isInitiallyTicked item ${widget.isInitiallyTicked}");
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
                child: Container(
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
                            onTap: () {
                              // Handle remove action
                            },
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
                                // Handle decrement
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
                              '1', // Replace with actual count
                              fontSize: 18,
                              color: AppColors.sortTextColor,
                              // Replace with your color
                              fontWeight: FontWeight.bold,
                            ),
                            GestureDetector(
                              onTap: () {
                                // Handle increment
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
                          'Out of stock',
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
                          "${widget.price} ",
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
