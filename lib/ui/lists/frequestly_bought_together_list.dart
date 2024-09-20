import 'package:flutter/material.dart';
import 'package:flutter_fabby_demo/models/all_product_model.dart';
import 'package:flutter_fabby_demo/models/product_detail_model.dart';
import 'package:flutter_fabby_demo/ui/listItems/all_product_items.dart';
import 'package:flutter_fabby_demo/ui/listItems/product_description_list_items.dart';
import 'package:flutter_fabby_demo/utils/logger_service.dart';

import '../listItems/frequently_bought_together_list_items.dart';

class FrequentlyBoughtTogetherList extends StatelessWidget {
  final List<RelatedProducts>? items; // Ensure this matches your data type

  const FrequentlyBoughtTogetherList({super.key, required this.items});

  @override
  Widget build(BuildContext context) {
   // LoggerService.d("stat:","listSize ${items?.length}");
    return ListView.builder(
      scrollDirection: Axis.horizontal,
      itemCount: items?.length ?? 0,
      itemBuilder: (context, index) {
        final item = items?[index];
        return FrequentlyBoughtTogetherListItems(imageSrc: item?.productImage ??"",isLastItem: index == (items?.length ?? 0) - 1, ); // Updated to use imageUrl
      },
    );
  }
}