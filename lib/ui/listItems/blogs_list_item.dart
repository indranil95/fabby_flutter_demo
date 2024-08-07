import 'package:flutter/material.dart';

class BlogsListItems extends StatelessWidget {
  final String imageUrl;
  final String description;
  final String price;

  const BlogsListItems({
    super.key,
    required this.imageUrl,
    required this.description,
    required this.price,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.symmetric(horizontal: 8.0, vertical: 8.0),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(15.0),
      ),
      elevation: 5, // Elevation to give a shadow effect
      child: const SizedBox(
        width: 160.0, // Adjust the width to match your desired size
        height: 500.0, // Fixed height for the card
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Example of adding an image
            Text("ok"),
            Padding(
              padding: EdgeInsets.all(8.0),
              child: Text("ok"),
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 8.0, vertical: 4.0),
              child: Text("ok"),
            ),
            // Add additional widgets or text here

          ],
        ),
      ),
    );
  }
}
