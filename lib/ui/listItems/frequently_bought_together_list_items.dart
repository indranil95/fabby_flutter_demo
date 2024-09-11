import 'package:flutter/material.dart';
import 'package:flutter_fabby_demo/colors/colors.dart';
import 'package:flutter_fabby_demo/utils/custom_network_image.dart';
import 'package:flutter_fabby_demo/utils/text_utils.dart';

class FrequentlyBoughtTogetherListItems extends StatefulWidget {
  final String imageSrc;
  final bool isLastItem; // Add this parameter


  const FrequentlyBoughtTogetherListItems({
    super.key,
    required this.imageSrc,
    required this.isLastItem, // Initialize the parameter
  });

  @override
  _ProductDescriptionListItemsState createState() =>
      _ProductDescriptionListItemsState();
}

class _ProductDescriptionListItemsState
    extends State<FrequentlyBoughtTogetherListItems> {


  @override
  void initState() {
    super.initState();
  }


  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.min, // Wrap content width
      children: [
        // CardView equivalent
        Card(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(20.0), // Card corner radius
          ),
          elevation: 4.0, // Optional, for shadow effect
          child: SizedBox(
            width: 100.0, // Width equivalent to 100dp
            height: 100.0, // Height equivalent to 100dp
            child: CustomNetworkImage(
              imageUrl:widget.imageSrc,
              height: 200.0,
              width: double.infinity,
              fit: BoxFit.cover,
            ),
          ),
        ),
        const SizedBox(width: 10.0), // Optional spacing between Card and Text
        // TextView equivalent
        if (!widget.isLastItem)
        Container(
          width: 40.0, // Width equivalent to 40dp
          height: double.infinity, // Match parent height
          alignment: Alignment.center, // Center the text
          child: TextUtils.display(
            '+',
            fontSize: 18.0, // Font size equivalent to 18dp
            fontWeight: FontWeight.normal, // Default font weight
            color: AppColors.black,
          ),
        ),
      ],
    );
  }
}
