import 'package:flutter/material.dart';
import 'package:flutter_fabby_demo/colors/colors.dart';
import 'package:flutter_fabby_demo/utils/text_utils.dart';
import 'package:webview_flutter/webview_flutter.dart';

class ProductDescriptionListItems extends StatefulWidget {
  final String title;
  final String description; // Assuming this is HTML content, not a URL
  final VoidCallback onToggle;

  const ProductDescriptionListItems({
    super.key,
    required this.title,
    required this.description,
    required this.onToggle,
  });

  @override
  _ProductDescriptionListItemsState createState() =>
      _ProductDescriptionListItemsState();
}

class _ProductDescriptionListItemsState
    extends State<ProductDescriptionListItems> {
  late WebViewController _controller;
  bool _isVisible = false; // Default to hidden
  double _webViewHeight = 200.0; // Default height of the WebView

  @override
  void initState() {
    super.initState();
    _controller = WebViewController()
      ..setJavaScriptMode(JavaScriptMode.unrestricted)
      ..setNavigationDelegate(
        NavigationDelegate(
          onProgress: (int progress) {
            // Handle progress update
            print('WebView loading progress: $progress%');
          },
          onPageStarted: (String url) {
            print('Page started loading: $url');
          },
          onPageFinished: (String url) {
            print('Page finished loading: $url');
          },
          onHttpError: (HttpResponseError error) {
            print('HTTP error: $error');
          },
          onWebResourceError: (WebResourceError error) {
            print('Web resource error: ${error.description}');
          },
          onNavigationRequest: (NavigationRequest request) {
            if (request.url.startsWith('https://www.youtube.com/')) {
              return NavigationDecision
                  .prevent; // Prevent navigation to YouTube
            }
            return NavigationDecision.navigate;
          },
        ),
      )
      ..loadHtmlString(widget.description); // Load the HTML content
  }

  void _toggleVisibility() {
    setState(() {
      _isVisible = !_isVisible; // Toggle the visibility
    });
    widget.onToggle(); // Call the passed onToggle callback
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        // Divider view (unchanged)
        Container(
          height: 1,
          margin: const EdgeInsets.only(top: 10, left: 10, right: 10),
          color: Colors.grey, // Replace with your custom color
        ),

        // Relative Layout equivalent (unchanged)
        Container(
          height: 30.0,
          margin: const EdgeInsets.only(top: 10, left: 10, right: 10),
          child: Stack(
            children: [
              // Title Text (unchanged)
              Positioned(
                left: 0,
                child: TextUtils.display(
                  widget.title,
                  color: AppColors.black, // Replace with your custom color
                  fontWeight: FontWeight.bold,
                  fontSize: 16, // Replace with your title data
                ),
              ),
              // Toggle Button
              Positioned(
                right: 0,
                child: GestureDetector(
                  onTap: _toggleVisibility, // Toggle visibility on tap
                  child: Container(
                    width: 20,
                    height: 20,
                    alignment: Alignment.center,
                    decoration: const BoxDecoration(
                      shape: BoxShape.circle,
                      color: AppColors
                          .fabbyBondiBlue, // Replace with your background drawable
                    ),
                    child: TextUtils.display(
                      _isVisible ? "-" : "+",
                      color: Colors.white, // Replace with your text color
                      fontSize: 14,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),

        // Conditionally render the WebView widget based on _isVisible
        if (_isVisible)
          Container(
            margin: const EdgeInsets.only(left: 10, right: 10, top: 10),
            height: _webViewHeight, // Adjust height as needed
            child: WebViewWidget(controller: _controller),
          ),
      ],
    );
  }
}
