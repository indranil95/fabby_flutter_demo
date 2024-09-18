import 'package:flutter/cupertino.dart';

import '../../models/pre_order_model.dart';
import '../listItems/orderhistory_list_items.dart';

class OrderHistorylist extends StatelessWidget {
  final List<Datum>? items; // Ensure this matches your data type

  const OrderHistorylist({super.key, required this.items});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      scrollDirection: Axis.vertical,
      itemCount: items?.length,
      itemBuilder: (context, index) {
        final item = items?[index];
        return OrderListItem(orderDate: item?.createdAt ?? '', totalPrice: item?.orderAmount ?? "", status: item?.updatedStatus ?? "", recipientName: item?.users?.fullname ?? "", productDescription: '', productImage: '',); // Updated to use imageUrl
      },
    );
  }
}