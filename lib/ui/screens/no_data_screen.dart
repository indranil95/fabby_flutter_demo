import 'package:flutter/material.dart';
import 'package:flutter_fabby_demo/AppConstant/app_constant.dart';
import 'package:flutter_fabby_demo/utils/image_utils.dart';

import '../../colors/colors.dart';
import '../../strings/strings.dart';
import '../../utils/text_utils.dart';

class NoDataScreen extends StatelessWidget {
  final String imagePath;
  final String message;
  final bool isVisible;

  const NoDataScreen({
    super.key,
    required this.imagePath,   // Path to the image asset
    required this.message,     // Message to display
    this.isVisible = true,     // Visibility control
  });

  @override
  Widget build(BuildContext context) {
    return Visibility(
      visible: isVisible,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          // Image equivalent to ImageView in XML
          Padding(
            padding: const EdgeInsets.only(top: 30.0, bottom: 40.0),
            child: SvgImage.asset(
              imagePath,
              width: 200.0,  // wrap_content equivalent
              height: 200.0, // wrap_content equivalent
            ),
          ),
          // Text equivalent to TextView in XML
          TextUtils.display(
            AppStrings.noDataAvailable,
            fontSize: 14.0,
            // Increased fontSize for larger text
            color: AppColors.sortTextColor,
            fontFamily: 'Poppins',
            fontWeight: FontWeight.normal,
            textAlign: TextAlign.center, // Center the text
          ),
        ],
      ),
    );
  }
}
