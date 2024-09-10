import 'package:flutter/material.dart';
import 'package:flutter_fabby_demo/colors/colors.dart';
import 'package:flutter_fabby_demo/utils/text_utils.dart';


class ProductTagListItems extends StatelessWidget {
  final String tagName;

  const ProductTagListItems({
    super.key,
    required this.tagName,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
      },
      child: Container(
        width: 50.0,
        height: 20.0,
        decoration: BoxDecoration(
          color: AppColors.transparentColor, // Background color for the card
          borderRadius: BorderRadius.circular(20.0), // Rounded corners
          border: Border.all(
            color: Colors.black, // Border color
            width: 1.0, // Border width
          ),
        ),
        alignment: Alignment.center,
        child: TextUtils.display(tagName,fontFamily: 'Poppins',fontSize: 13.0,fontWeight: FontWeight.normal,color: Colors.black)
        ,
      ),
      );
  }
}
