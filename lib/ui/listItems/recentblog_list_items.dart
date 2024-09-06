import 'package:flutter/material.dart';

class RecentBlogListItem extends StatelessWidget {
  final String imageUrl;
  final String title;
  final String description;
  final VoidCallback onMoveToBlogDetail;

  const RecentBlogListItem({
    super.key,
    required this.imageUrl,
    required this.title,
    required this.description,
    required this.onMoveToBlogDetail,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 8.0),
      padding: const EdgeInsets.all(10.0),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(15.0),
        border: Border.all(color: Colors.black12), // Adds a border
      ),
      child: Row(
        children: [
          // Image section
          ClipRRect(
            borderRadius: BorderRadius.circular(10.0), // Rounded corners for the image
            child: Image.network(
              imageUrl,
              fit: BoxFit.cover,
              width: 80.0,
              height: 80.0,
            ),
          ),
          const SizedBox(width: 16.0),
          // Text section
          Expanded(
            child: Text(
              title,
              style: const TextStyle(
                fontFamily: 'Poppins',
                fontWeight: FontWeight.bold,
                fontSize: 16,
                color: Colors.black,
              ),
              overflow: TextOverflow.ellipsis,
              maxLines: 2,
            ),
          ),
        ],
      ),
    );
  }
}