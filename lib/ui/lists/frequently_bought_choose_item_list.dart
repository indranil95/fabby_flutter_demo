import 'package:flutter/material.dart';
import 'package:flutter_fabby_demo/models/all_product_model.dart';
import 'package:flutter_fabby_demo/models/product_detail_model.dart';
import 'package:flutter_fabby_demo/ui/listItems/all_product_items.dart';
import 'package:flutter_fabby_demo/ui/listItems/frequently_bought_choose_item_list_item.dart';
import 'package:flutter_fabby_demo/ui/listItems/product_description_list_items.dart';
import 'package:flutter_fabby_demo/utils/logger_service.dart';

import '../listItems/frequently_bought_together_list_items.dart';

class Frequentlyboughtchooseitemlist extends StatefulWidget {
  final List<RelatedProducts>? items; // Ensure this matches your data type
  final Function(double) onTotalPriceUpdated;
  final Function(List<RelatedProducts>) onItemsSelected; // New callback


  const Frequentlyboughtchooseitemlist(
      {super.key, required this.items, required this.onTotalPriceUpdated,required this.onItemsSelected, });

  @override
  _FrequentlyboughtchooseitemlistState createState() =>
      _FrequentlyboughtchooseitemlistState();
}
class _FrequentlyboughtchooseitemlistState extends State<Frequentlyboughtchooseitemlist> {
  double totalPrice = 0.0;
  List<RelatedProducts> selectedItems = []; // Track selected items

  @override
  void initState() {
    super.initState();
    calculateTotalPrice();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      selectAllItemsByDefault();
    });
  }
  void selectAllItemsByDefault() {
    if (widget.items != null) {
      selectedItems = List.from(widget.items!); // Select all items by default
      widget.onItemsSelected(selectedItems); // Notify parent with selected items
    }
  }
  void calculateTotalPrice() {
    double total = 0.0;

    if (widget.items != null) {
      for (var item in widget.items!) {
        double price = double.tryParse(item.price ?? "0.0") ?? 0.0;
        double discountValue = double.tryParse(item.offers?.discountValue ?? "0.0") ?? 0.0;

        if (item.offers?.discountType == 1) {
          total += price - discountValue; // Discount in amount
        } else if (item.offers?.discountType == 2) {
          total += price - (price * (discountValue / 100)); // Discount in percentage
        } else {
          total += price; // No discount
        }
      }
    }

    setState(() {
      totalPrice = total;
    });

    // Notify the parent screen about the total price update
    widget.onTotalPriceUpdated(totalPrice);
  }
  // Handle item selection change
  void onItemSelectionChanged(bool isSelected, RelatedProducts item) {
    setState(() {
      if (isSelected) {
        selectedItems.add(item);
      } else {
        selectedItems.remove(item);
      }
    });

    widget.onItemsSelected(selectedItems); // Notify parent about selected items
  }

  @override
  Widget build(BuildContext context) {
    LoggerService.d("stat:", "listSize ${widget.items?.length}");

    return ListView.builder(
      scrollDirection: Axis.vertical,
      itemCount: widget.items?.length ?? 0,
      itemBuilder: (context, index) {
        final item = widget.items?[index];
        return FrequentlyBoughtChooseItemListItem(
          title: item?.productName ?? "",
          price: item?.price ?? "",
          discountType: item?.offers?.discountType ?? 0,
          discountValue: item?.offers?.discountValue ?? "",
          onItemSelected: (isSelected) => onItemSelectionChanged(isSelected, item!),
        );
      },
    );
  }
}