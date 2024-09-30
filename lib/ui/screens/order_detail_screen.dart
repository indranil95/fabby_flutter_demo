import 'package:flutter/material.dart';
import 'package:flutter_fabby_demo/ui/screens/top_bar_detail.dart';

import '../../colors/colors.dart';
import '../../strings/strings.dart';
import '../../utils/text_utils.dart';

class OrderDetailScreen extends StatelessWidget {
  // Sample data simulating what comes from an API
  final String customerName = "Pranay Barua"; // From API
  final String address = "jyotinagar bamunimaidannijarapath\n781021 Guwahati Assam India\n7002271159"; // From API
  final String orderNumber = "20240712134230918265"; // From API
  final String paymentMethod = "COD"; // From API

  final List<Map<String, dynamic>> products = [
    {
      'name': 'Equipment Bags',
      'price': 350.00,
      'image': 'https://via.placeholder.com/150', // Replace with product image URL
    },
    {
      'name': 'Fitness Gloves',
      'price': 120.00,
      'image': 'https://via.placeholder.com/150', // Replace with product image URL
    }
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const TopBarDetail(title: "Order Details"),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(height: 10),
            TextUtils.display(
            AppStrings.yourDeliveryAddress,
            fontSize: 20.0,
            color: AppColors.black,
            fontFamily: 'DmSerifDisplay',
            // fontWeight: FontWeight.bold,
            ),
              Divider(),
              SizedBox(height: 8),
              TextUtils.display(
                customerName,
                fontSize: 16.0,
                color: AppColors.black,
                fontFamily: 'poppins',
                fontWeight: FontWeight.w400,
              ),
              SizedBox(height: 8),
              TextUtils.display(
                address,
                fontSize: 16.0,
                color: AppColors.black,
                fontFamily: 'poppins',
                fontWeight: FontWeight.w400,
                maxLines: 4
              ),
              SizedBox(height: 16),
              Divider(),
              SizedBox(height: 16),
              TextUtils.display(
                  AppStrings.orderNumber,
                  fontSize: 16.0,
                  color: AppColors.black,
                  fontFamily: 'poppins',
                  fontWeight: FontWeight.bold,
                  maxLines: 4
              ),
              Text(
                'Order Number',
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
              ),
              SizedBox(height: 4),
              TextUtils.display(
                  AppStrings.orderNumber,
                  fontSize: 16.0,
                  color: AppColors.black,
                  fontFamily: 'poppins',
                  fontWeight: FontWeight.bold,
                  maxLines: 4
              ),
              Text('20240712134230918265'),
              SizedBox(height: 16),
              Text(
                'Payment Method',
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
              ),
              SizedBox(height: 4),
              Text('COD'),
              SizedBox(height: 16),
              GestureDetector(
                onTap: () {
                  // Add your invoice download logic here
                },
                child: Text(
                  'Download Invoice',
                  style: TextStyle(
                    color: Colors.pink,
                    decoration: TextDecoration.underline,
                  ),
                ),
              ),
              SizedBox(height: 16),
              Divider(),
              SizedBox(height: 16),
              // Product List Section
              ListView.builder(
                physics: NeverScrollableScrollPhysics(),
                shrinkWrap: true,
                itemCount: products.length,
                itemBuilder: (context, index) {
                  return Column(
                    children: [
                      Row(
                        children: [
                          Image.network(
                            products[index]['image'],
                            width: 60,
                            height: 60,
                          ),
                          SizedBox(width: 16),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                products[index]['name'],
                                style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 18,
                                ),
                              ),
                              SizedBox(height: 4),
                              Text('₹${products[index]['price']}',
                                  style: TextStyle(fontSize: 16)),
                            ],
                          ),
                        ],
                      ),
                      SizedBox(height: 16),
                    ],
                  );
                },
              ),
              SizedBox(height: 16),
              Divider(),
              // Order Status Section
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      CircleAvatar(
                        radius: 8,
                        backgroundColor: Colors.pink,
                      ),
                      SizedBox(width: 8),
                      Text('Order Confirmed'),
                    ],
                  ),
                  SizedBox(height: 16),
                  Row(
                    children: [
                      CircleAvatar(
                        radius: 8,
                        backgroundColor: Colors.grey,
                      ),
                      SizedBox(width: 8),
                      Text('Shipped'),
                    ],
                  ),
                  SizedBox(height: 16),
                  Row(
                    children: [
                      CircleAvatar(
                        radius: 8,
                        backgroundColor: Colors.grey,
                      ),
                      SizedBox(width: 8),
                      Text('Out of Delivery'),
                    ],
                  ),
                  SizedBox(height: 16),
                  Row(
                    children: [
                      CircleAvatar(
                        radius: 8,
                        backgroundColor: Colors.grey,
                      ),
                      SizedBox(width: 8),
                      Text('Delivered'),
                    ],
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}