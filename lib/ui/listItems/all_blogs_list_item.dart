
import 'package:flutter/material.dart';

class AllBlogListItem extends StatelessWidget {
  final String imageUrl;
  final String title;
  final String description;
  final VoidCallback onMoveToBlogDetail;

  const AllBlogListItem({
    super.key,
    required this.imageUrl,
    required this.title,
    required this.description,
    required this.onMoveToBlogDetail,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(10.0),
      child: GestureDetector(
        onTap: onMoveToBlogDetail,
        child: Card(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(20.0), // Adjust to match the picture
          ),
          elevation: 4.0, // Add shadow if needed
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Image section with adjusted size and border radius
              ClipRRect(
                borderRadius: BorderRadius.circular(20.0), // Adjust to match the picture
                child: Image.network(
                  imageUrl,
                  fit: BoxFit.cover,
                  width: double.infinity,
                  height: 200.0, // Adjust height as per the design
                ),
              ),
              // Text section
              Padding(
                padding: const EdgeInsets.all(15.0), // Add padding around text content
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // Title
                    Text(
                      title,
                      style: const TextStyle(
                        fontFamily: 'Poppins',
                        fontWeight: FontWeight.w600, // Semibold
                        fontSize: 16,
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
                        fontSize: 14,
                        color: Colors.grey,
                      ),
                      overflow: TextOverflow.ellipsis,
                      maxLines: 2, // Adjust as per requirement
                    ),
                    const SizedBox(height: 10.0),
                    // Read More
                    const Text(
                      'Read More',
                      style: TextStyle(
                        fontFamily: 'Poppins',
                        fontWeight: FontWeight.w600, // Semibold
                        fontSize: 14,
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