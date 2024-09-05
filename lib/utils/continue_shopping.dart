import 'dart:ffi';

import 'package:flutter/material.dart';

class ContinueShoppingButton extends StatelessWidget {
  final VoidCallback? onPressed;
  final String text;
  final double height;
  final double width;
  final Color? color;
  final Color? textColor;
  final double textSize;
  final FontWeight? fontWeight;
  final String? fontFamily;// Add textSize parameter


  ContinueShoppingButton({required this.text,required this.height,required this.width, this.onPressed,this.color,required this.textColor,required this.textSize,required this.fontWeight,required this.fontFamily,});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: height,
      width: width,
      margin: const EdgeInsets.only(top: 5.0, bottom: 5.0),
      padding: const EdgeInsets.symmetric(horizontal: 10.0),
      decoration: BoxDecoration(
        color: color, // Add background color if needed
        borderRadius: BorderRadius.circular(20.0),
        border: Border.all(
          color: Colors.black,
          width: 1.0,
        ),
      ),
      child: TextButton(
        onPressed: onPressed,
        style: TextButton.styleFrom(
          padding: EdgeInsets.zero, // Remove internal padding
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(20.0),
          ),
        ),
        child: Text(
          text, // Use the passed text
          style:  TextStyle(
            fontSize: textSize,
            fontFamily: fontFamily,
            fontWeight: fontWeight, // Equivalent to android:textStyle="bold"
            color: textColor, // Equivalent to @color/sort_text_color
          ),
        ),
      ),
    );
  }
}
