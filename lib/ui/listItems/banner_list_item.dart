import 'package:flutter/material.dart';
import 'package:flutter_fabby_demo/utils/logger_service.dart';
import 'package:flutter_svg/flutter_svg.dart'; // Import for SVG support

class BannerListItem extends StatelessWidget {
  final String imageUrl; // URL or path to the image
  final double width; // Width for the image container
  final double height; // Height for the image container

  const BannerListItem({
    super.key,
    required this.imageUrl,
    this.width = 250.0, // Default width
    this.height = 100.0, // Default height
  });

  @override
  Widget build(BuildContext context) {
    // Check if the image is SVG or PNG based on file extension
    bool isSvg = imageUrl.endsWith('.svg');
    LoggerService.i("imageSVGUrl: $imageUrl");
    final double screenWidth = (MediaQuery.of(context).size.width) - 20;

    return Container(
      width: width == 250.0 ? screenWidth : width, // Set the width for the container
      height: height, // Set the height for the container
      margin: const EdgeInsets.symmetric(horizontal: 8.0),
      child: isSvg
          ? SvgPicture.network(
        imageUrl,
        fit: BoxFit.fill, // Ensure the SVG scales properly
        placeholderBuilder: (context) => Image.asset(
          'assets/fabby_placeholder_image.svg',
          fit: BoxFit.cover, // Ensure the placeholder scales properly
        ),
      )
          : Image.network(
        imageUrl,
        fit: BoxFit.contain, // Ensure the PNG scales properly
        loadingBuilder: (context, child, progress) {
          if (progress == null) {
            return child;
          } else {
            return Image.asset(
              'assets/fabby_placeholder_image.svg',
              fit: BoxFit.cover, // Ensure the placeholder scales properly
            );
          }
        },
        errorBuilder: (context, error, stackTrace) => Image.asset(
          'assets/fabby_placeholder_image.svg',
          fit: BoxFit.cover, // Ensure the placeholder scales properly
        ),
      ),
    );
  }
}
