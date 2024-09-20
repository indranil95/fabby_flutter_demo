import 'package:flutter/material.dart';
import 'package:flutter_fabby_demo/models/all_product_model.dart';
import 'package:flutter_fabby_demo/models/product_detail_model.dart';
import 'package:flutter_fabby_demo/ui/listItems/all_product_items.dart';
import 'package:flutter_fabby_demo/ui/listItems/product_description_list_items.dart';
import 'package:flutter_fabby_demo/utils/logger_service.dart';

class ProductDescriptionList extends StatelessWidget {
  final List<ProductDescription>? items; // Ensure this matches your data type
  final Function(int) onToggle;

  const ProductDescriptionList({super.key, required this.items, required this.onToggle});

  @override
  Widget build(BuildContext context) {
   // LoggerService.d("stat:","listSize ${items?.length}");
    return ListView.builder(
      scrollDirection: Axis.vertical,
      itemCount: items?.length ?? 0,
      itemBuilder: (context, index) {
        final item = items?[index];
        return ProductDescriptionListItems(title: item?.title ?? "", description: item?.description ?? "",  onToggle: () {
          onToggle(index);
        },); // Updated to use imageUrl
      },
    );
  }
}