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
      margin: const EdgeInsets.symmetric(horizontal: 5.0),
      width: 140.0,
      height: 400.0,
      child: Card(
        color: const Color(0xFFFFEDE1),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(20.0),
        ),
        elevation: 4.0,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(20.0),
              child: Image.network(
                imageUrl,
                fit: BoxFit.cover,
                errorBuilder: (context, error, stackTrace) {
                  return const Center(child: Icon(Icons.error, color: Colors.red));
                },
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10.0, vertical: 5.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    description,
                    style: const TextStyle(
                      fontSize: 16.0,
                      color: Colors.black,
                    ),
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                  ),
                  SizedBox(height: 5.0), // Space between description and price
                  Text(
                    price,
                    style: const TextStyle(
                      fontSize: 14.0,
                      color: Colors.grey,
                    ),
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
