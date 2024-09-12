import 'package:flutter/material.dart';
import 'package:flutter_fabby_demo/utils/custom_network_image.dart';
import 'package:flutter_fabby_demo/utils/text_utils.dart';

import '../../colors/colors.dart';

class SimilarProductListItem extends StatefulWidget {
  final String image;
  final String description;
  final String price;
  final int discountType;
  final String discountValue;
  final VoidCallback onMoveToProductDetail; // Callback to notify the parent

  const SimilarProductListItem({
    super.key,
    required this.image,
    required this.description,
    required this.price,
    required this.discountType,
    required this.discountValue,
    required this.onMoveToProductDetail, // Add callback for item selection
  });

  @override
  _ProductDescriptionListItemsState createState() =>
      _ProductDescriptionListItemsState();
}

class _ProductDescriptionListItemsState extends State<SimilarProductListItem> {
  bool isSelected = true; // Track the selection state
  double totalAmount = 0.0;


  @override
  void initState() {
    super.initState();
    calculateTotalAmount(); // Initialize discount calculation
  }

  void calculateTotalAmount() {
    double price = double.tryParse(widget.price) ?? 0.0;
    double discountValue = double.tryParse(widget.discountValue) ?? 0.0;

    if (widget.discountType == 1) {
      // Discount in amount
      totalAmount = price - discountValue;
    } else if (widget.discountType == 2) {
      // Discount in percentage
      totalAmount = price - (price * (discountValue / 100));
    } else {
      // No discount
      totalAmount = price;
    }
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(onTap: (){
      widget.onMoveToProductDetail();
    },child: Container(
      padding: const EdgeInsets.only(bottom: 5.0),
      margin: const EdgeInsets.only(
        left: 5.0,
        right: 5.0,
        bottom: 10.0,
      ),
      child: Card(
        color: const Color(0xFFFFEDE1), // Equivalent to "#FFEDE1"
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(40.0),
        ),
        child: Column(
          children: [
            Card(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(40.0),
              ),
              clipBehavior: Clip.antiAlias,
              child: SizedBox(
                width: double.infinity,
                height: 250.0,
                child: CustomNetworkImage(
                  imageUrl:widget.image,
                  height: double.infinity,
                  width: double.infinity,
                  fit: BoxFit.cover,
                ),
              ),
            ),
            Padding(
              padding:
              const EdgeInsets.only(top: 10.0, left: 20.0, right: 20.0),
              child: TextUtils.display(
                widget.description,
                fontFamily: 'Poppins',
                fontSize: 16.0,
                color: AppColors.black,
                // Replace with dynamic text
                maxLines: 1,
                overflow: TextOverflow
                    .ellipsis, // Equivalent to `android:ellipsize="end"`
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(
                  top: 10.0, left: 20.0, right: 20.0, bottom: 10.0),
              child: TextUtils.display(
                '₹${totalAmount.toStringAsFixed(2)}',
                fontFamily: 'Poppins',
                fontSize: 14.0,
                color: AppColors.sortTextColor,
                // Replace with dynamic text
                maxLines: 1,
                overflow: TextOverflow
                    .ellipsis, // Equivalent to `android:ellipsize="end"`
              ),
            ),
          ],
        ),
      ),
    ),)
    ;
  }
}
