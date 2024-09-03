import 'package:flutter/material.dart';
import 'package:flutter_fabby_demo/colors/colors.dart';

import '../../utils/html_renderer.dart';
import '../../utils/text_utils.dart';

class CustomAddToCartDialog extends StatelessWidget {
  final String message;
  final String title;
  final VoidCallback onButtonPressed;
  final String buttonText;
  final int maxLines; // Optional maxLines field

  const CustomAddToCartDialog({
    super.key,
    required this.message,
    required this.title,
    required this.onButtonPressed,
    this.buttonText = 'OK', // Default button text
    required this.maxLines,
  });

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: TextUtils.display(
        title,
        fontSize: 15.0,
        color: Colors.black,
        fontFamily: 'DmSerifDisplay',
        fontWeight: FontWeight.w300,
        textAlign: TextAlign.center,
        maxLines: maxLines,
      ),
      content: SizedBox(
        width: MediaQuery.of(context).size.width * 0.8, // 80% of screen width
        child: HtmlRenderer(htmlData: "Product Name: $message"),
      ),
      actions: <Widget>[
        Container(
          width: double.infinity,
          height: 30.0,
          margin: const EdgeInsets.only(left: 20.0, right: 20.0),
          child: GestureDetector(
            onTap: () {
              onButtonPressed(); // Call the callback here
              Navigator.of(context).pop(); // Close the dialog
            },
            child: Card(
              color: AppColors.fabbyBondiBlue,
              child: TextUtils.display(
                buttonText,
                fontSize: 15.0,
                color: Colors.white,
                fontFamily: 'DmSerifDisplay',
                fontWeight: FontWeight.w300,
                textAlign: TextAlign.center,
              ),
            ),
          ),
        ),
      ],
    );
  }
}
