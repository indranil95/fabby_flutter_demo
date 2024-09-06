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
    TextDecoration decoration = TextDecoration.none, // Added parameter
  }) {
    return Text(
      text,
      style: TextStyle(
        fontSize: fontSize,
        fontWeight: fontWeight,
        color: color,
        fontFamily: fontFamily, // Apply the custom font here
        decoration: decoration,
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

  static Widget editableText({
    required TextEditingController controller,
    double fontSize = 14.0,
    FontWeight fontWeight = FontWeight.normal,
    Color color = Colors.black, // Color for the text
    Color hintColor = Colors.grey, // Color for hint text
    TextAlign textAlign = TextAlign.start,
    int maxLines = 1,
    String? fontFamily, // Added parameter for custom font
    bool obscureText = false, // To handle password fields
    TextInputType keyboardType = TextInputType.text, // To specify keyboard type
    String? hintText, // Text to show as hint
    EdgeInsetsGeometry? contentPadding, // Padding for the text field
    void Function(String)? onChanged, // Callback for text changes
  }) {
    // Attach listener to the TextEditingController if a callback is provided
    if (onChanged != null) {
      controller.addListener(() {
        onChanged(controller.text);
      });
    }

    return TextField(
      controller: controller,
      style: TextStyle(
        fontSize: fontSize,
        fontWeight: fontWeight,
        color: Colors.black, // Apply the custom text color here
        fontFamily: fontFamily, // Apply the custom font here
      ),
      textAlign: textAlign,
      maxLines: maxLines,
      obscureText: obscureText,
      keyboardType: keyboardType,
      decoration: InputDecoration(
        hintText: hintText,
        hintStyle: TextStyle(
          color: hintColor, // Apply the custom hint color here
          fontFamily: fontFamily, // Apply the custom font for hint text
        ),
        contentPadding: contentPadding,
        // Apply padding for the text field
        border: const OutlineInputBorder(),
        // Default border
        focusedBorder: OutlineInputBorder(
          borderSide: BorderSide(color: color.withOpacity(0.8)),
        ),
        enabledBorder: OutlineInputBorder(
          borderSide: BorderSide(color: color.withOpacity(0.8)),
        ),
      ),
    );
  }

  static Widget errorText(
    String text, {
    double fontSize = 12.0,
    FontWeight fontWeight = FontWeight.normal,
    Color color = Colors.red, // Color for error text
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
        color: color, // Apply the custom color here
        fontFamily: fontFamily, // Apply the custom font here
      ),
      textAlign: textAlign,
      maxLines: maxLines,
      overflow: overflow,
    );
  }
}
