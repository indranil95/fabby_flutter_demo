import 'package:flutter/material.dart';
import 'package:flutter_fabby_demo/utils/image_utils.dart';

class FrequentlyBoughtChooseItemListItem extends StatefulWidget {
  final String title;
  final String price;
  final int discountType;
  final String discountValue;

  const FrequentlyBoughtChooseItemListItem({
    super.key,
    required this.title,
    required this.price,
    required this.discountType,
    required this.discountValue,
  });

  @override
  _ProductDescriptionListItemsState createState() =>
      _ProductDescriptionListItemsState();
}

class _ProductDescriptionListItemsState
    extends State<FrequentlyBoughtChooseItemListItem> {
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
    return Container(
      margin: const EdgeInsets.all(8.0), // Adjust margin if needed
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        // Aligns children at start horizontally
        crossAxisAlignment: CrossAxisAlignment.center,
        // Aligns children vertically at the center
        children: [
          // Image equivalent to ImageView in XML
          Container(
            width: 16.0,
            height: 16.0,
            margin: const EdgeInsets.only(right: 5.0), // MarginEnd equivalent
            child: SvgImage.asset(
              'assets/tick.svg',
              width: 16.0,
              height: 16.0// Replace with your image asset path
            ),
          ),
          // Text equivalent to AppCompatTextView in XML
          Expanded(
              child: Container(
            margin: const EdgeInsets.only(left: 10.0, right: 10.0),
            child: RichText(
              text: TextSpan(
                text: '${widget.title} ', // Normal text for the title
                style: const TextStyle(
                  fontFamily: 'Poppins',
                  fontSize: 14.0,
                  color: Colors.black,
                  fontWeight: FontWeight.normal, // Normal weight for title
                ),
                children: <TextSpan>[
                  TextSpan(
                    text: '₹${totalAmount.toStringAsFixed(2)}',
                    // Bold text for price
                    style: const TextStyle(
                      fontWeight: FontWeight.bold, // Make the price bold
                    ),
                  ),
                ],
              ),
            ),
          )),
        ],
      ),
    );
  }
}
