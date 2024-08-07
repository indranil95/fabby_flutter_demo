// image_utils.dart

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:http/http.dart' as http;


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

class SvgFromApiWidget extends StatefulWidget {
  final String url;

  SvgFromApiWidget({required this.url});

  @override
  _SvgFromApiWidgetState createState() => _SvgFromApiWidgetState();
}

class _SvgFromApiWidgetState extends State<SvgFromApiWidget> {
  String? svgData;
  bool isLoading = true;
  bool hasError = false;

  @override
  void initState() {
    super.initState();
    fetchSvgData();
  }

  Future<void> fetchSvgData() async {
    try {
      final response = await http.get(Uri.parse(widget.url));
      if (response.statusCode == 200) {
        setState(() {
          svgData = response.body;
          isLoading = false;
        });
      } else {
        setState(() {
          hasError = true;
          isLoading = false;
        });
      }
    } catch (e) {
      setState(() {
        hasError = true;
        isLoading = false;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    if (isLoading) {
      return CircularProgressIndicator();
    } else if (hasError || svgData == null) {
      return Text('Error loading SVG');
    } else {
      return SvgPicture.string(
        svgData!,
        width: 25.0,
        height: 25.0,
        fit: BoxFit.cover,
      );
    }
  }
}
