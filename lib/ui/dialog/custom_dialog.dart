import 'package:flutter/material.dart';
import 'package:flutter_fabby_demo/colors/colors.dart';

import '../../utils/text_utils.dart';

class CustomDialog extends StatelessWidget {
  final String message;
  final VoidCallback onButtonPressed;
  final String buttonText;

  const CustomDialog({
    super.key,
    required this.message,
    required this.onButtonPressed,
    this.buttonText = 'OK', // Default button text
  });

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      content: TextUtils.display(
        message,
        fontSize: 15.0,
        // Increased fontSize for larger text
        color: Colors.black,
        fontFamily: 'DmSerifDisplay',
        fontWeight: FontWeight.w300,
        textAlign: TextAlign.center, // Center the text
      ),
      actions: <Widget>[
        Container(
          width: double.infinity,
          height: 40.0,
          margin: const EdgeInsets.only(left: 20.0, right: 20.0),
          child: GestureDetector(
            onTap: () {
              Navigator.of(context).pop();
            },
            child: Card(
              color: AppColors.fabbyBondiBlue,
              child: TextUtils.display(
                buttonText,
                fontSize: 15.0,
                // Increased fontSize for larger text
                color: Colors.white,
                fontFamily: 'DmSerifDisplay',
                fontWeight: FontWeight.w300,
                textAlign: TextAlign.center, // Center the text
                /* ),*/
              ),
            ),
          ),
        ),
      ],
    );
  }
}
