import 'package:flutter/material.dart';
import 'package:flutter_fabby_demo/utils/logger_service.dart';

import '../../colors/colors.dart';
import '../../utils/image_utils.dart';
import '../../utils/text_utils.dart';

class CartListItem extends StatefulWidget {
  final String? imageSrc;
  final String? title;
  final String? price;
  final VoidCallback onDelete;
  final VoidCallback onTick;
  final bool isInitiallyTicked; // New parameter for initial ticked state

  const CartListItem({
    super.key,
    required this.imageSrc,
    required this.title,
    required this.price,
    required this.onDelete,
    required this.onTick,
    required this.isInitiallyTicked, // Default to false
  });

  @override
  _WishlistItemState createState() => _WishlistItemState();
}

class _WishlistItemState extends State<CartListItem> {
  bool isTicked = false;

  @override
  void initState() {
    super.initState();
    isTicked = widget.isInitiallyTicked; // Initialize state in initState
  }

  @override
  void didUpdateWidget(covariant CartListItem oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (widget.isInitiallyTicked != oldWidget.isInitiallyTicked) {
      setState(() {
        isTicked = widget.isInitiallyTicked; // Update state when widget changes
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    LoggerService.d("isInitiallyTicked item ${widget.isInitiallyTicked}");
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10.0),
      child: Column(
        children: [
          Row(
            children: [
              Card(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Container(
                  width: 100,
                  height: 100,
                  child: Stack(
                    children: [
                      Positioned(
                        top: 10,
                        left: 10,
                        child: Image.asset(
                          'assets/light_pink_border.png', // Replace with actual image path
                          width: 16,
                          height: 16,
                        ),
                      ),
                      Center(
                        child: Image.asset(
                          'assets/fabby_icon.png', // Replace with actual image path
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: const EdgeInsets.symmetric(vertical: 10.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Expanded(
                            child: Text(
                              'Title Here', // Replace with actual title
                              style: TextStyle(
                                fontSize: 16,
                                color: Colors.black,
                                fontWeight: FontWeight.normal,
                                overflow: TextOverflow.ellipsis,
                              ),
                              maxLines: 2,
                            ),
                          ),
                          GestureDetector(
                            onTap: () {
                              // Handle remove action
                            },
                            child: Text(
                              'Remove',
                              style: TextStyle(
                                color: Colors.red, // Replace with your color
                                fontWeight: FontWeight.bold,
                                fontSize: 14,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 10.0),
                      child: Text(
                        'Quantity',
                        style: TextStyle(
                          fontSize: 12,
                          color: Colors.grey, // Replace with your color
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 10.0),
                      child: Container(
                        width: 100,
                        height: 35,
                        decoration: BoxDecoration(
                          image: DecorationImage(
                            image: AssetImage(
                              'assets/quantity_back.png', // Replace with actual background
                            ),
                            fit: BoxFit.cover,
                          ),
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            GestureDetector(
                              onTap: () {
                                // Handle decrement
                              },
                              child: Padding(
                                padding: const EdgeInsets.all(5.0),
                                child: Text(
                                  '-',
                                  style: TextStyle(
                                    fontSize: 18,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ),
                            ),
                            Text(
                              '0', // Replace with actual count
                              style: TextStyle(
                                fontSize: 18,
                                color: Colors.blue, // Replace with your color
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            GestureDetector(
                              onTap: () {
                                // Handle increment
                              },
                              child: Padding(
                                padding: const EdgeInsets.all(5.0),
                                child: Text(
                                  '+',
                                  style: TextStyle(
                                    fontSize: 18,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    Visibility(
                      visible: false, // Set to true if out of stock
                      child: Padding(
                        padding: const EdgeInsets.only(top: 10.0),
                        child: Text(
                          'Out of stock',
                          style: TextStyle(
                            color: Colors.red, // Replace with your color
                            fontSize: 14,
                          ),
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 10.0),
                      child: Align(
                        alignment: Alignment.centerRight,
                        child: Text(
                          '\$Price', // Replace with actual price
                          style: TextStyle(
                            fontSize: 18,
                            color: Colors.black,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
          Divider(
            thickness: 1,
            color: Colors.blue.withOpacity(0.5), // Replace with your color
            indent: 10,
            endIndent: 10,
            height: 20,
          ),
        ],
      ),
    );
  }
}
