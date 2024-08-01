import 'package:flutter/material.dart';
import 'package:flutter_fabby_demo/models/all_product_model.dart';
import 'package:flutter_fabby_demo/ui/listItems/all_product_items.dart';

class AllProductList extends StatelessWidget {
  final List<Data> items; // Ensure this matches your data type

  const AllProductList({super.key, required this.items});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      scrollDirection: Axis.horizontal,
      itemCount: items.length,
      itemBuilder: (context, index) {
        final item = items[index];
        return AllProductItems(imageUrl: item.productImage, description: item.productName, price: '',); // Updated to use imageUrl
      },
    );
  }
}