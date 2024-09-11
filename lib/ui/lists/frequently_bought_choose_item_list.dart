import 'package:flutter/material.dart';
import 'package:flutter_fabby_demo/models/all_product_model.dart';
import 'package:flutter_fabby_demo/models/product_detail_model.dart';
import 'package:flutter_fabby_demo/ui/listItems/all_product_items.dart';
import 'package:flutter_fabby_demo/ui/listItems/frequently_bought_choose_item_list_item.dart';
import 'package:flutter_fabby_demo/ui/listItems/product_description_list_items.dart';
import 'package:flutter_fabby_demo/utils/logger_service.dart';

import '../listItems/frequently_bought_together_list_items.dart';

class Frequentlyboughtchooseitemlist extends StatelessWidget {
  final List<RelatedProducts>? items; // Ensure this matches your data type

  const Frequentlyboughtchooseitemlist({super.key, required this.items});

  @override
  Widget build(BuildContext context) {
    LoggerService.d("stat:","listSize ${items?.length}");
    return ListView.builder(
      scrollDirection: Axis.vertical,
      itemCount: items?.length ?? 0,
      itemBuilder: (context, index) {
        final item = items?[index];
        return FrequentlyBoughtChooseItemListItem(title: item?.productName ??"",price:item?.price ?? "",discountType:item?.offers?.discountType ?? 0,discountValue: item?.offers?.discountValue ?? "", ); // Updated to use imageUrl
      },
    );
  }
}