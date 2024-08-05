import 'package:flutter/material.dart';
import 'package:flutter_fabby_demo/utils/text_utils.dart';
import '../../colors/colors.dart';

class CategoryListItem extends StatelessWidget {
  final String label; // Label for the category item
  final Color backgroundColor; // Background color of the card
  final Color textColor; // Text color of the label

  const CategoryListItem({
    super.key,
    required this.label,
    required this.backgroundColor,
    required this.textColor,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 8.0, vertical: 4.0),
      child: ConstrainedBox(
        constraints: const BoxConstraints(
          minWidth: 100.0, // Minimum width constraint
          minHeight: 40.0, // Minimum height constraint
        ),
        child: Card(
          color: backgroundColor,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(15.0),
          ),
          elevation: 4.0, // Add elevation for shadow effect
          child: Center(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8.0, vertical: 4.0),
              /*child: FittedBox(
                fit: BoxFit.scaleDown, // Scale down the text if it overflows*/
                child: TextUtils.display(
                  label,
                  fontSize: 15.0, // Increased fontSize for larger text
                  color: textColor,
                  fontFamily: 'NunitoSans',
                  fontWeight: FontWeight.w300,
                  textAlign: TextAlign.center, // Center the text
               /* ),*/
              ),
            ),
          ),
        ),
      ),
    );
  }
}
