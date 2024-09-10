
import 'package:flutter/material.dart';

class CancelButton extends StatelessWidget {
  final VoidCallback? onPressed;
  final String text;
  final double height;
  final double width;

  const CancelButton({super.key, required this.text,required this.height,required this.width, this.onPressed});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: height,
      width: width,
      margin: const EdgeInsets.only(top: 5.0, bottom: 5.0),
      padding: const EdgeInsets.symmetric(horizontal: 10.0),
      decoration: BoxDecoration(
        color: Colors.white, // Add background color if needed
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
          style: const TextStyle(
            fontWeight: FontWeight.bold, // Equivalent to android:textStyle="bold"
            color: Color(0xFF8B8B8B), // Equivalent to @color/sort_text_color
          ),
        ),
      ),
    );
  }
}
