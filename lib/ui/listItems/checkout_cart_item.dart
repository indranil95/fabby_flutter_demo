import 'package:flutter/material.dart';
import 'package:flutter_fabby_demo/colors/colors.dart';
import 'package:flutter_fabby_demo/utils/custom_network_image.dart';
import 'package:flutter_fabby_demo/utils/text_utils.dart';

class CheckoutCartItem extends StatefulWidget {
  final String imgurl;
  final String title;
  final String subtitle;
  final String price;
  final int discountType;
  final String discountValue;
  final String subtitlevalue;

  const CheckoutCartItem({
    super.key,
    required this.imgurl,
    required this.title,
    required this.subtitle,
    required this.price,
    required this.discountType,
    required this.discountValue,
    required this.subtitlevalue,
  });

  @override
  _CheckoutCartItemState createState() => _CheckoutCartItemState();
}

class _CheckoutCartItemState extends State<CheckoutCartItem> {
  @override
  Widget build(BuildContext context) {
    return Container(
      color: AppColors.paymentSelectBack, // Equivalent to @color/payment_select_back
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 10.0, horizontal: 10.0),
            child: Row(
              children: [
                Card(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10.0),
                  ),
                  child: SizedBox(
                    width: 70,
                    height: 70,
                    child: Center(
                      child: CustomNetworkImage(
                          imageUrl: widget.imgurl,
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                ),
                const SizedBox(width: 10), // For spacing between the CardView and TextViews
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        children: [
                          Expanded(
                            child: TextUtils.display(
                              widget.title,
                              fontFamily: "Poppins",
                              fontSize: 13,
                              color: AppColors.sortTextColor, // Equivalent to @color/sort_text_color
                              fontWeight: FontWeight.normal,
                              overflow: TextOverflow.ellipsis,// Set dynamic title here
                            ),
                          ),
                          TextUtils.display(
                            widget.titlevalue, // Set dynamic title value here
                            fontFamily: "Poppins",
                            fontSize: 14,
                            color: AppColors.removeTextColor, // Equivalent to @color/remove_text_color
                            fontWeight: FontWeight.bold,

                          ),
                        ],
                      ),
                      const SizedBox(height: 5),
                      Row(
                        children: [
                          Expanded(
                            child: TextUtils.display(
                              widget.subtitle, // Set dynamic subtitle here
                              fontFamily: "Poppins",
                              fontSize: 14,
                              color: AppColors.sortTextColor, // Equivalent to @color/sort_text_color
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          TextUtils.display(
                            widget.subtitlevalue,
                            fontFamily: "Poppins",
                            fontSize: 14,
                            color: AppColors.sortTextColor,
                          ),
                        ],
                      ),
                    ],
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
            const EdgeInsets.fromLTRB(0.0, 0.0, 0.0, 0.0),
            // Equivalent to layout_marginStart, layout_marginTop, layout_marginEnd
            color: AppColors
                .white, // Equivalent to android:background="@color/white"
          ),
        ],
      ),
    );
  }
}
