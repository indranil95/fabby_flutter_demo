import 'package:flutter/material.dart';
import 'package:flutter_fabby_demo/models/all_product_model.dart';
import 'package:flutter_fabby_demo/models/product_detail_model.dart';
import 'package:flutter_fabby_demo/ui/listItems/all_product_items.dart';
import 'package:flutter_fabby_demo/ui/listItems/frequently_bought_choose_item_list_item.dart';
import 'package:flutter_fabby_demo/ui/listItems/product_description_list_items.dart';
import 'package:flutter_fabby_demo/ui/listItems/similar_product_list_item.dart';
import 'package:flutter_fabby_demo/utils/logger_service.dart';

import '../listItems/frequently_bought_together_list_items.dart';

class SimilarProductList extends StatefulWidget {
  final List<SimilarProducts>? items; // Ensure this matches your data type
  final Function(int) onMoveToProductDetail;

  const SimilarProductList(
      {super.key, required this.items, required this.onMoveToProductDetail });

  @override
  _SimilarProductListState createState() =>
      _SimilarProductListState();
}
class _SimilarProductListState extends State<SimilarProductList> {

  @override
  void initState() {
    super.initState();

  }


  @override
  Widget build(BuildContext context) {
    LoggerService.d("stat:", "listSize ${widget.items?.length}");

    return ListView.builder(
      scrollDirection: Axis.vertical,
      itemCount: widget.items?.length ?? 0,
      itemBuilder: (context, index) {
        final item = widget.items?[index];
        return SimilarProductListItem(
          image: item?.productImage ?? "",
          description: item?.productName ?? "",
          price: item?.price ?? "",
          discountType: item?.offers?.discountType ?? 0,
          discountValue: item?.offers?.discountValue ?? "",
          onMoveToProductDetail: () {
          widget.onMoveToProductDetail(index);
        },
        );
      },
    );
  }
}