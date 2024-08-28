import 'package:flutter/material.dart';

class WishlistItem extends StatelessWidget {
  final String imageSrc;
  final String title;
  final String price;
  final VoidCallback onDelete;
  final VoidCallback onMoveToCart;

  const WishlistItem({
    super.key,
    required this.imageSrc,
    required this.title,
    required this.price,
    required this.onDelete,
    required this.onMoveToCart,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 130, // equivalent to @dimen/_130sdp
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
                  Image.asset('assets/light_pink_border.png', width: 16, height: 16),
                  const SizedBox(width: 5),
                  Expanded(
                    child: Text(
                      title,
                      style: TextStyle(
                        fontFamily: 'Poppins',
                        color: Color(0xFF999999), // Replace with actual color
                        fontSize: 14,
                      ),
                      textAlign: TextAlign.left,
                    ),
                  ),
                  IconButton(
                    icon: Image.asset('assets/delete_icon_item.png', width: 20, height: 20),
                    onPressed: onDelete,
                  ),
                ],
              ),
            ),
            Image.asset(
              imageSrc,
              width: double.infinity,
              height: 100,
              fit: BoxFit.cover,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Text(
                title,
                style: TextStyle(
                  fontFamily: 'DMSerif',
                  color: Color(0xFF999999), // Replace with actual color
                  fontSize: 15,
                ),
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
              child: Text(
                price,
                style: TextStyle(
                  fontFamily: 'Poppins',
                  fontWeight: FontWeight.w600,
                  color: Color(0xFF999999), // Replace with actual color
                  fontSize: 13,
                ),
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
              ),
            ),
            Container(
              margin: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
              child: Card(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20),
                ),
                color: Color(0xFF00A3E0), // Replace with actual color
                child: InkWell(
                  onTap: onMoveToCart,
                  child: Padding(
                    padding: const EdgeInsets.symmetric(vertical: 10),
                    child: Center(
                      child: Text(
                        'Move to Cart',
                        style: TextStyle(
                          fontFamily: 'Poppins',
                          color: Colors.white,
                          fontSize: 13,
                          fontWeight: FontWeight.bold,
                        ),
                        textAlign: TextAlign.center,
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
