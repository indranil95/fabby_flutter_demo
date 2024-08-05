import 'package:flutter/material.dart';

class TextUtils {
  // Method to display text with default styling
  static Widget display(
    String text, {
    double fontSize = 14.0,
    FontWeight fontWeight = FontWeight.normal,
    Color color = Colors.black,
    TextAlign textAlign = TextAlign.start,
    int maxLines = 1,
    TextOverflow overflow = TextOverflow.ellipsis,
    String? fontFamily, // Added parameter for custom font
  }) {
    return Text(
      text,
      style: TextStyle(
        fontSize: fontSize,
        fontWeight: fontWeight,
        color: color,
        fontFamily: fontFamily, // Apply the custom font here
      ),
      textAlign: textAlign,
      maxLines: maxLines,
      overflow: overflow,
    );
  }

  static Widget displayLargeText(
    String text, {
    double fontSize = 14.0,
    FontWeight fontWeight = FontWeight.normal,
    Color color = Colors.black,
    TextAlign textAlign = TextAlign.start,
    String? fontFamily, // Added parameter for custom font
  }) {
    return Text(
      text,
      style: TextStyle(
        fontSize: fontSize,
        fontWeight: fontWeight,
        color: color,
        fontFamily: fontFamily, // Apply the custom font here
      ),
      textAlign: textAlign,
    );
  }
}
