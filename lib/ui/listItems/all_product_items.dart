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
      margin: const EdgeInsets.symmetric(horizontal: 5.0), // Equivalent to XML margins
      width: 140.0, // Equivalent to @dimen/_140sdp
      child: Card(
        color: const Color(0xFFFFEDE1), // Equivalent to #FFEDE1
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(40.0), // Equivalent to 40dp
        ),
        elevation: 2.0, // Slight elevation for shadow effect
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Card(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(40.0), // Equivalent to 40dp
              ),
              clipBehavior: Clip.antiAlias,
              child: Image.network(
                imageUrl,
                width: double.infinity,
                height: 220.0, // Equivalent to 220dp
                fit: BoxFit.cover, // Equivalent to fitCenter
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 10.0),
              child: Text(
                description,
                style: const TextStyle(
                  fontSize: 16.0, // Equivalent to 16sp
                  color: Colors.black,
                ),
                maxLines: 1,
                overflow: TextOverflow.ellipsis, // Equivalent to ellipsize="end"
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 10.0),
              child: Text(
                price,
                style: const TextStyle(
                  fontSize: 14.0, // Equivalent to 14sp
                  color: Colors.grey, // Replace with @color/sort_text_color if defined
                ),
                maxLines: 1,
                overflow: TextOverflow.ellipsis, // Equivalent to ellipsize="end"
              ),
            ),
          ],
        ),
      ),
    );
  }
}
