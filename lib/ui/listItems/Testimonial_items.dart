import 'package:flutter/material.dart';

class TestimonialCard extends StatelessWidget {
  final String name;
  final String title;
  final String testimonial;
  final double width;

  const TestimonialCard({
    super.key,
    required this.name,
    required this.title,
    required this.testimonial,
    this.width = 250.0,
  });

  @override
  Widget build(BuildContext context) {
    final double screenWidth = (MediaQuery.of(context).size.width) - 10;
    return Container(
      width: width == 250.0 ? screenWidth : width, // Set the width for each card
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(10.0),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.3),
            blurRadius: 5,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                const CircleAvatar(
                  backgroundImage: AssetImage("assets/testimonial_logo.png"),
                  radius: 20.0,
                ),
                const SizedBox(width: 10.0),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      name,
                      style: const TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 16.0,
                      ),
                    ),
                    Text(
                      title,
                      style: const TextStyle(
                        color: Colors.grey,
                        fontSize: 14.0,
                      ),
                    ),
                  ],
                ),
              ],
            ),
            const SizedBox(height: 10.0),
            Expanded(
              child: Text(
                testimonial,
                style: const TextStyle(
                  fontSize: 14.0,
                  color: Colors.black87,
                ),
                maxLines: 4,
                overflow: TextOverflow.ellipsis,
              ),
            ),
          ],
        ),
      ),
    );
  }
}