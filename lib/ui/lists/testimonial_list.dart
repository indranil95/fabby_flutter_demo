import 'package:flutter/material.dart';
import 'package:flutter_fabby_demo/ui/listItems/Testimonial_items.dart';

// class TestimonialsList extends StatelessWidget {
//   final List<Map<String, String>> testimonials;
//
//   const TestimonialsList({
//     Key? key,
//     required this.testimonials,
//   }) : super(key: key);
//
//   @override
//   Widget build(BuildContext context) {
//     return Column(
//       crossAxisAlignment: CrossAxisAlignment.start,
//       children: testimonials.map((testimonial) {
//         return TestimonialCard(
//           name: testimonial['name']!,
//           title: testimonial['title']!,
//           testimonial: testimonial['testimonial']!,
//           imageUrl: testimonial['imageUrl']!,
//         );
//       }).toList(),
//     );
//   }
// }
class TestimonialsList extends StatelessWidget {
  final List<Map<String, String>> testimonials;

  const TestimonialsList({
    Key? key,
    required this.testimonials,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 180.0, // Adjust height based on the card's height
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: testimonials.length,
        itemBuilder: (context, index) {
          final testimonial = testimonials[index];
          return Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8.0),
            child: TestimonialCard(
              name: testimonial['name']!,
              title: testimonial['title']!,
              testimonial: testimonial['testimonial']!,
            ),
          );
        },
      ),
    );
  }
}