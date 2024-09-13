import 'package:flutter/material.dart';
import 'package:flutter_fabby_demo/colors/colors.dart';
import 'package:flutter_fabby_demo/strings/strings.dart';
import 'package:flutter_fabby_demo/utils/image_utils.dart';
import 'package:flutter_fabby_demo/utils/text_utils.dart';

class CheckoutAddressItem extends StatefulWidget {
  final String title;
  final String price;
  final int discountType;
  final String discountValue;
  final Function(bool) onItemSelected; // Callback to notify the parent


  const CheckoutAddressItem({
    super.key,
    required this.title,
    required this.price,
    required this.discountType,
    required this.discountValue,
    required this.onItemSelected, // Add callback for item selection

  });

  @override
  _CheckoutAddressItemState createState() =>
      _CheckoutAddressItemState();
}

class _CheckoutAddressItemState extends State<CheckoutAddressItem> {

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Container(
          padding: const EdgeInsets.symmetric(vertical: 10.0),
          color: AppColors.paymentSelectBack, // Replace with your color
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Padding(
                padding: const EdgeInsets.only(left: 20.0),
                child: PngImage.asset(
                  'assets/payment_unselected.png',
                  width: 20.0,
                  height: 20.0,
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 20.0),
                child: TextUtils.displayLargeText(
                  '',
                  fontSize: 14.0,
                  fontFamily: 'PoppinsRegular',
                ),
              ),
              const Spacer(),
              Padding(
                padding: const EdgeInsets.only(right: 10.0),
                child: TextUtils.display(
                  AppStrings.delete,
                  fontFamily: 'Poppins',
                  fontSize: 14.0,
                  fontWeight: FontWeight.w400,
                  color: AppColors.removeTextColor,
                    decoration: TextDecoration.underline

                ),
              ),
              Padding(
                padding: const EdgeInsets.only(right: 10.0),
                child: TextUtils.display(
                  AppStrings.edit,
                  fontFamily: 'Poppins',
                  fontSize: 14.0,
                  fontWeight: FontWeight.w400,
                  color: AppColors.removeTextColor,
                  decoration: TextDecoration.underline
                ),
              ),
            ],
          ),
        ),
        const Divider(
          color: AppColors.lightBlueFabby, // Replace with your color
          thickness: 1.0,
        ),
      ],
    );
  }
}
