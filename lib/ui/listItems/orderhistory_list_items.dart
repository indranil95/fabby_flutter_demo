import 'package:flutter/material.dart';

class OrderListItem extends StatefulWidget {
  final String orderDate;
  final String totalPrice;
  final String recipientName;
  final String status; // e.g., 'processing'
  final String productDescription;
  final String productImage;

  const OrderListItem({
    Key? key,
    required this.orderDate,
    required this.totalPrice,
    required this.recipientName,
    required this.status,
    required this.productDescription,
    required this.productImage,
  }) : super(key: key);

  @override
  _OrderListItemState createState() => _OrderListItemState();
}

class _OrderListItemState extends State<OrderListItem> {
  bool _isExpanded = false;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        decoration: BoxDecoration(
          color: Colors.pink[50],
          borderRadius: BorderRadius.circular(12),
          border: Border.all(color: Colors.pinkAccent),
        ),
        child: Column(
          children: [
            ListTile(
              title: Text(
                'Order Placed',
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
              subtitle: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(widget.orderDate),
                  SizedBox(height: 8),
                  Text('Total'),
                  Text('₹ ${widget.totalPrice}'),
                  SizedBox(height: 8),
                  Text('Ship To'),
                  Text(widget.recipientName),
                ],
              ),
              trailing: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Container(
                    padding: EdgeInsets.symmetric(horizontal: 10, vertical: 5),
                    decoration: BoxDecoration(
                      color: Colors.blue,
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: Text(
                      widget.status,
                      style: TextStyle(color: Colors.white),
                    ),
                  ),
                  IconButton(
                    icon: Icon(
                      _isExpanded
                          ? Icons.keyboard_arrow_up
                          : Icons.keyboard_arrow_down,
                    ),
                    onPressed: () {
                      setState(() {
                        _isExpanded = !_isExpanded;
                      });
                    },
                  ),
                ],
              ),
            ),
            if (_isExpanded)
              Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        Image.network(
                          widget.productImage,
                          height: 60,
                          width: 60,
                          fit: BoxFit.cover,
                        ),
                        SizedBox(width: 16),
                        Expanded(
                          child: Text(widget.productDescription),
                        ),
                      ],
                    ),
                    SizedBox(height: 16),
                    ElevatedButton(
                      onPressed: () {
                        // Add action for "Buy Again" button
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.pink, // Background color
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(18.0),
                        ),
                      ),
                      child: Text('Buy Again'),
                    ),
                    OutlinedButton(
                      onPressed: () {
                        // Add action for "View Details" button
                      },
                      style: OutlinedButton.styleFrom(
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(18.0),
                        ),
                      ),
                      child: Text('View Details'),
                    ),
                  ],
                ),
              ),
          ],
        ),
      ),
    );
  }
}
