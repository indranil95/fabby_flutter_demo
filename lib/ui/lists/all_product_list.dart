import 'package:flutter/material.dart';
import 'package:flutter_fabby_demo/models/all_product_model.dart';
import 'package:flutter_fabby_demo/ui/listItems/all_product_items.dart';

class AllProductList extends StatelessWidget {
  final List<Datum> items; // Ensure this matches your data type
  final Function(int) onMoveToProductDetail;

  const AllProductList({super.key, required this.items, required this.onMoveToProductDetail});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      scrollDirection: Axis.horizontal,
      itemCount: items.length,
      itemBuilder: (context, index) {
        final item = items[index];
        return AllProductItems(imageUrl: item.productImage, description: item.productName, price: item.price, onMoveToProductDetail: () {
          onMoveToProductDetail(index);
        },); // Updated to use imageUrl
      },
    );
  }
}