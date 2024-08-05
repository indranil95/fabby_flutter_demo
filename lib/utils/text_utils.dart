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
  // Method to create an editable text field with default styling
  static Widget editableText({
    required TextEditingController controller,
    double fontSize = 14.0,
    FontWeight fontWeight = FontWeight.normal,
    Color color = Colors.black,
    TextAlign textAlign = TextAlign.start,
    int maxLines = 1,
    String? fontFamily, // Added parameter for custom font
    bool obscureText = false, // To handle password fields
    TextInputType keyboardType = TextInputType.text, // To specify keyboard type
  }) {
    return TextField(
      controller: controller,
      style: TextStyle(
        fontSize: fontSize,
        fontWeight: fontWeight,
        color: color,
        fontFamily: fontFamily, // Apply the custom font here
      ),
      textAlign: textAlign,
      maxLines: maxLines,
      obscureText: obscureText,
      keyboardType: keyboardType,
    );
  }

  // Method to create an editable text field with initial value
  static Widget editableTextWithValue({
    required TextEditingController controller,
    required String initialValue,
    double fontSize = 14.0,
    FontWeight fontWeight = FontWeight.normal,
    Color color = Colors.black,
    TextAlign textAlign = TextAlign.start,
    int maxLines = 1,
    String? fontFamily, // Added parameter for custom font
    bool obscureText = false, // To handle password fields
    TextInputType keyboardType = TextInputType.text, // To specify keyboard type
  }) {
    controller.text = initialValue;
    return editableText(
      controller: controller,
      fontSize: fontSize,
      fontWeight: fontWeight,
      color: color,
      textAlign: textAlign,
      maxLines: maxLines,
      fontFamily: fontFamily,
      obscureText: obscureText,
      keyboardType: keyboardType,
    );
  }
}
