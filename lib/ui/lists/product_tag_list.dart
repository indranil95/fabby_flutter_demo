import 'package:flutter/material.dart';
import 'package:flutter_fabby_demo/models/product_detail_model.dart';
import 'package:flutter_fabby_demo/ui/listItems/product_tag_list_items.dart';
import 'package:flutter_fabby_demo/utils/logger_service.dart';

class ProductTagList extends StatelessWidget {
  final List<ProductTag> items; // Ensure this matches your data type

  const ProductTagList({super.key, required this.items});

  @override
  Widget build(BuildContext context) {
    LoggerService.d("listSize ${items.length}");
    return Expanded(
        child: GridView.builder(
          padding: const EdgeInsets.all(0), // Optional padding
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 5, // Number of columns in the grid
            mainAxisSpacing: 2, // Space between rows
            crossAxisSpacing: 2, // Space between columns
            childAspectRatio: 0.9, // Aspect ratio to control item height/width
          ),
          itemCount: items.length,
          itemBuilder: (context, index) {
            final dataItem = items[index];

            // Ensure your BlogsListItems widget matches the structure of Data class
            return ProductTagListItems(
              tagName:dataItem.tagName ?? "",
            );
          },
        )); // Updated to use imageUrl

  }
}