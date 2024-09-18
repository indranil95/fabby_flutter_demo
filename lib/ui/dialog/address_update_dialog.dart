import 'package:flutter/material.dart';
import 'package:flutter_fabby_demo/colors/colors.dart';
import 'package:flutter_fabby_demo/utils/text_utils.dart';
import 'package:lottie/lottie.dart'; // For Lottie animation

class SuccessMessageCard extends StatefulWidget {
  final String title;
  final VoidCallback onButtonPressed;
  final String buttonText;
  final int maxLines;

  const SuccessMessageCard(
      {Key? key, required this.title,required this.onButtonPressed,
        this.buttonText = 'OK', // Default button text
        required this.maxLines,})
      : super(key: key);

  @override
  _SuccessMessageCardState createState() => _SuccessMessageCardState();
}
class _SuccessMessageCardState extends State<SuccessMessageCard> {


  @override
  Widget build(BuildContext context) {
    return Center(
      child: Card(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10.0),
        ),
        child: Container(
          width: 300.0, // Equivalent to 300dp in Android XML
          padding: const EdgeInsets.all(20.0),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              // TextView for success message
              TextUtils.display(
                widget.title,
                fontSize: 18.0,
                fontFamily: 'DMSerifDisplay',
                color: Colors.black,
                textAlign: TextAlign.center,
                maxLines: widget.maxLines
              ),

              const SizedBox(height: 20.0),

              // Lottie Animation for tick animation
              Lottie.asset(
                'assets/tick_anim_new.json', // Replace with the actual path of the animation file
                width: double.infinity,
                height: 100.0, // Equivalent to 100dp in Android XML
                repeat: true,
                animate: true,
              ),

              const SizedBox(height: 10.0),

              // Button inside a CardView
              Card(
                color: AppColors.fabbyBondiBlue, // Replace with your app-specific color
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20.0),
                ),
                child: InkWell(
                  onTap: () {
                    widget.onButtonPressed(); // Call the callback here
                    Navigator.of(context).pop(); // Close the dialog
                  },
                  child: Padding(
                    padding: const EdgeInsets.symmetric(vertical: 8.0),
                    child: Center(
                      child: TextUtils.display(
                        widget.buttonText,
                        fontFamily: 'PoppinsSemiBold', // Assuming this is the correct font
                        fontSize: 12.0, // Equivalent to 12sp in Android XML
                        color: Colors.white,
                      ),
                    ),
                  ),
                ),
              ),

              const SizedBox(height: 20.0),
            ],
          ),
        ),
      ),
    );
  }
}
