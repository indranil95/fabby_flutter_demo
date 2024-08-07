import 'package:flutter/material.dart';

class AllProductItems extends StatelessWidget {
  final String imageUrl;
  final String description;
  final String price;

  const AllProductItems({
    super.key,
    required this.imageUrl,
    required this.description,
    required this.price,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 8.0, vertical: 8.0),
      decoration: BoxDecoration(
        color: Colors.white, // Background color for the outer box
        borderRadius: BorderRadius.circular(15.0),
      ),
      width: 160.0, // Adjust the width to match your desired size
      height: 250.0, // Set a fixed height for all items
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          // Card section with image and description
          Expanded(
            child: Container(
              decoration: BoxDecoration(
                color: const Color(0xFFF8EDE8), // Background color for the card
                borderRadius: BorderRadius.circular(15.0),
              ),
              child: Column(
                children: [
                  ClipRRect(
                    borderRadius: const BorderRadius.only(
                      topLeft: Radius.circular(15.0),
                      topRight: Radius.circular(15.0),
                    ),
                    child: Image.network(
                      imageUrl,
                      fit: BoxFit.cover,
                      width: double.infinity,
                      height: 90.0, // Set fixed image height
                      errorBuilder: (context, error, stackTrace) {
                        return const Center(
                          child: Icon(Icons.error, color: Colors.red),
                        );
                      },
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text(
                      description,
                      style: const TextStyle(
                        fontSize: 14.0,
                        color: Colors.black,
                      ),
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                      textAlign: TextAlign.left,
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(4.0),
                    child: Text(
                      '₹ $price', // Added rupee symbol here
                      style: const TextStyle(
                        fontSize: 14.0,
                        color: Colors.black,
                      ),
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                      textAlign: TextAlign.left,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}