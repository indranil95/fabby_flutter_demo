import 'package:flutter/material.dart';
import 'package:flutter_html/flutter_html.dart';

class HtmlRenderer extends StatelessWidget {
  final String htmlData;

  const HtmlRenderer({super.key, required this.htmlData});

  @override
  Widget build(BuildContext context) {
    return Html(
      data: htmlData,
    );
  }
}
