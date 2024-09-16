import 'package:flutter/material.dart';
import 'package:flutter_fabby_demo/colors/colors.dart';
import 'package:flutter_fabby_demo/strings/strings.dart';
import 'package:flutter_fabby_demo/utils/image_utils.dart';
import 'package:flutter_fabby_demo/utils/text_utils.dart';

class CheckoutAddressItem extends StatefulWidget {
  final String location;
  final String pin;
  final String city;
  final String state;
  final String country;
  final bool isSelected;
  final VoidCallback onItemSelected; // Callback to notify the parent
  final VoidCallback onEdit; // Callback to notify the parent
  final VoidCallback onDelete; // Callback to notify the parent

  const CheckoutAddressItem({
    super.key,
    required this.location,
    required this.pin,
    required this.city,
    required this.state,
    required this.country,
    required this.isSelected,
    required this.onItemSelected, // Add callback for item selection
    required this.onEdit, // Add callback for item selection
    required this.onDelete, // Add callback for item selection
  });

  @override
  _CheckoutAddressItemState createState() => _CheckoutAddressItemState();
}

class _CheckoutAddressItemState extends State<CheckoutAddressItem> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: widget.onItemSelected,
      child: Column(
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
                  child: SvgImage.asset(
                    widget.isSelected
                        ? 'assets/payment_selected.svg' // Show selected image
                        : 'assets/payment_unselected.svg', // Show unselected image
                    width: 20.0,
                    height: 20.0,
                  ),
                ),
                Expanded(
                    child: Padding(
                  padding: const EdgeInsets.only(left: 20.0),
                  child: TextUtils.displayLargeText(
                    '${widget.location}  ,  ${widget.pin}  ,  ${widget.city}  ,  ${widget.state}  ,  ${widget.country}',
                    fontSize: 14.0,
                    fontFamily: 'PoppinsRegular',
                  ),
                )),
                const Spacer(),
                Padding(
                  padding: const EdgeInsets.only(right: 10.0),
                  child: GestureDetector(
                    onTap: widget.onDelete,
                    child: TextUtils.display(AppStrings.delete,
                        fontFamily: 'Poppins',
                        fontSize: 14.0,
                        fontWeight: FontWeight.w400,
                        color: AppColors.removeTextColor,
                        decoration: TextDecoration.underline),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(right: 10.0),
                  child: GestureDetector(
                    onTap: widget.onEdit,
                    child: TextUtils.display(AppStrings.edit,
                        fontFamily: 'Poppins',
                        fontSize: 14.0,
                        fontWeight: FontWeight.w400,
                        color: AppColors.removeTextColor,
                        decoration: TextDecoration.underline),
                  ),
                ),
              ],
            ),
          ),
          Container(
            width: double.infinity,
            // Equivalent to match_parent
            height: 1.0,
            // Equivalent to 1dp height
            margin:
            const EdgeInsets.fromLTRB(0.0, 0.0, 0.0, 0.0),
            // Equivalent to layout_marginStart, layout_marginTop, layout_marginEnd
            color: AppColors
                .lightBlueFabby, // Equivalent to android:background="@color/white"
          ),
        ],
      ),
    );
  }
}
