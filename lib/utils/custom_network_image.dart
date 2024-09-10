import 'package:flutter/material.dart';
import 'package:flutter_fabby_demo/utils/image_utils.dart';

class CustomNetworkImage extends StatelessWidget {
  final String imageUrl;
  final double height;
  final double width;
  final BoxFit fit;

  const CustomNetworkImage({
    super.key,
    required this.imageUrl,
    this.height = 200.0,
    this.width = double.infinity,
    this.fit = BoxFit.cover,
  });

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(20.0),
      child: Image.network(
        imageUrl,
        height: height,
        width: width,
        fit: fit,
        loadingBuilder: (BuildContext context, Widget child, ImageChunkEvent? loadingProgress) {
          if (loadingProgress == null) {
            return child; // Image loaded successfully
          } else {
            // Show a CircularProgressIndicator while the image is loading
            return Center(
              child: CircularProgressIndicator(
                value: loadingProgress.expectedTotalBytes != null
                    ? loadingProgress.cumulativeBytesLoaded / (loadingProgress.expectedTotalBytes ?? 1)
                    : null,
              ),
            );
          }
        },
        errorBuilder: (BuildContext context, Object exception, StackTrace? stackTrace) {
          // Show a placeholder or error message when the image fails to load
          return  Center(
            child: SvgImage.asset(
              'assets/fabby_placeholder_image.svg',
              // Ensure the placeholder scales properly
            ),
          );
        },
      ),
    );
  }
}
