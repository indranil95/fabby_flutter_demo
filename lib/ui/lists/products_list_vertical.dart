import 'package:flutter/material.dart';
import 'package:flutter_fabby_demo/models/all_product_model.dart';
import 'package:flutter_fabby_demo/ui/listItems/all_product_items.dart';

class ProductsListVertical extends StatelessWidget {
  final List<Datum> items; // Ensure this matches your data type

  const ProductsListVertical({super.key, required this.items});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      scrollDirection: Axis.vertical,
      itemCount: items.length,
      itemBuilder: (context, index) {
        final item = items[index];
        return AllProductItems(imageUrl: item.productImage, description: item.productName, price: item.price,); // Updated to use imageUrl
      },
    );
  }
}