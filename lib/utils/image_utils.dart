// image_utils.dart

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/flutter_svg.dart';

class PngImage {
  static Widget asset(String assetPath, {double width = 25.0, double height = 25.0}) {
    return SizedBox(
      width: width,
      height: height,
      child: Image.asset(
        assetPath,
        width: width,
        height: height,
        fit: BoxFit.cover,
      ),
    );
  }
}

class SvgImage {
  static Widget asset(String assetPath, {double width = 25.0, double height = 25.0}) {
    return SizedBox(
      width: width,
      height: height,
      child: SvgPicture.asset(
        assetPath,
        width: width,
        height: height,
        fit: BoxFit.cover,
      ),
    );
  }
}

