import 'package:flutter/material.dart';

class BlogsListItems extends StatelessWidget {
  final String imageUrl;
  final String title;
  final String description;
  final VoidCallback onMoveToBlogDetail;

  const BlogsListItems({
    super.key,
    required this.imageUrl,
    required this.title,
    required this.description,
    required this.onMoveToBlogDetail,
  });

  @override
  Widget build(BuildContext context) {
    // Calculate width to fit two items on the screen
    final double itemWidth = MediaQuery.of(context).size.width / 2 - 20; // Adjust padding to fit two items

    return GestureDetector(
      onTap: onMoveToBlogDetail,
      child: Container(
        width: itemWidth,
        margin: const EdgeInsets.symmetric(horizontal: 10.0),
        child: Card(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(20.0), // Adjust to match the picture
          ),
          elevation: 2.0,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Image section
              ClipRRect(
                borderRadius: const BorderRadius.only(
                  topLeft: Radius.circular(20.0),
                  topRight: Radius.circular(20.0),
                ),
                child: Image.network(
                  imageUrl,
                  height: 120.0, // Adjust height as per the design
                  width: double.infinity,
                  fit: BoxFit.cover,
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(10.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // Title
                    Text(
                      title,
                      style: const TextStyle(
                        fontFamily: 'Poppins',
                        fontWeight: FontWeight.w600, // Semibold
                        fontSize: 14,
                        color: Colors.black,
                      ),
                      overflow: TextOverflow.ellipsis,
                      maxLines: 1,
                    ),
                    const SizedBox(height: 5.0),
                    // Description
                    Text(
                      description,
                      style: const TextStyle(
                        fontFamily: 'Poppins',
                        fontWeight: FontWeight.normal, // Regular
                        fontSize: 12,
                        color: Colors.white,
                      ),
                      overflow: TextOverflow.ellipsis,
                      maxLines: 2,
                    ),
                    const SizedBox(height: 10.0),
                    // Read More
                    const Text(
                      'Read More',
                      style: TextStyle(
                        fontFamily: 'Poppins',
                        fontWeight: FontWeight.w600, // Semibold
                        fontSize: 12,
                        color: Colors.blue,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}