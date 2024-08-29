import 'package:flutter/material.dart';

import '../../colors/colors.dart';
import '../../utils/image_utils.dart';
import '../../utils/logger_service.dart';
import '../../utils/text_utils.dart';

class WishlistItem extends StatefulWidget {
  final String imageSrc;
  final String title;
  final String price;
  final VoidCallback onDelete;
  final VoidCallback onMoveToCart;
  final VoidCallback onTick;

  const WishlistItem({
    super.key,
    required this.imageSrc,
    required this.title,
    required this.price,
    required this.onDelete,
    required this.onMoveToCart,
    required this.onTick,
  });

  @override
  _WishlistItemState createState() => _WishlistItemState();
}

class _WishlistItemState extends State<WishlistItem> {
  bool isTicked = false;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 180,
      margin: const EdgeInsets.only(left: 5, right: 5, bottom: 10),
      padding: const EdgeInsets.only(bottom: 5),
      child: Card(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(20),
        ),
        color: Colors.white,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Container(
              margin: const EdgeInsets.symmetric(horizontal: 20, vertical: 24),
              child: Row(
                children: [
                  GestureDetector(
                    onTap: () {
                      setState(() {
                        isTicked = !isTicked;
                      });
                      widget.onTick(); // Correctly invoke onTick
                    },
                    child: SvgImage.asset(
                      isTicked
                          ? 'assets/tick.svg' // Replace with the ticked image asset
                          : 'assets/light_pink_border.svg', // Replace with the unticked image asset
                      width: 16.0,
                      height: 16.0,
                    ),
                  ),
                  const Spacer(),
                  GestureDetector(
                    onTap: widget.onDelete, // Correctly invoke onDelete
                    child: SvgImage.asset(
                      'assets/delete_icon_item.svg',
                      width: 16.0,
                      height: 16.0,
                    ),
                  ),
                ],
              ),
            ),
            Image.network(
              widget.imageSrc,
              width: double.infinity,
              height: 90,
              fit: BoxFit.cover,
            ),
            const SizedBox(height: 20.0),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: TextUtils.display(
                widget.title,
                fontFamily: 'DMSerif',
                color: AppColors.sortTextColor,
                fontWeight: FontWeight.w600,
                fontSize: 15.0,
                maxLines: 1,
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
              child: TextUtils.display(
                widget.price,
                fontFamily: 'Poppins',
                fontWeight: FontWeight.w600,
                color: AppColors.sortTextColor,
                fontSize: 13,
                maxLines: 1,
              ),
            ),
            Container(
              margin: const EdgeInsets.symmetric(horizontal: 10, vertical: 0),
              child: Card(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20),
                ),
                color: AppColors.fabbyBondiBlue,
                child: InkWell(
                  onTap: widget.onMoveToCart, // Correctly invoke onMoveToCart
                  child: Padding(
                    padding: const EdgeInsets.symmetric(vertical: 10),
                    child: Center(
                      child: TextUtils.displayLargeText(
                        'Move to Cart',
                        fontFamily: 'Poppins',
                        color: Colors.white,
                        fontSize: 13,
                        fontWeight: FontWeight.normal,
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
