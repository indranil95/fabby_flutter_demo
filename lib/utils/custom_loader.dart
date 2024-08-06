import 'package:flutter/material.dart';
import 'package:flutter_fabby_demo/colors/colors.dart';

class CustomLoader extends StatelessWidget {
  const CustomLoader({super.key});

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        ModalBarrier(
          color: Colors.black.withOpacity(0.0), // Fully transparent background
          dismissible: false, // Prevents dismissing by tapping outside
        ),
        const Center(
          child: CircularProgressIndicator(
            valueColor: AlwaysStoppedAnimation<Color>(AppColors.fabbyBondiBlue), // Pink loader color
          ),
        ),
      ],
    );
  }
}
