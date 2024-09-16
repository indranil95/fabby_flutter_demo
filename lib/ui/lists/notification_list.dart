import 'package:flutter/material.dart';
import 'package:flutter_fabby_demo/models/all_product_model.dart';
import 'package:flutter_fabby_demo/models/blogs_model.dart';
import 'package:flutter_fabby_demo/ui/listItems/blogs_list_item.dart';

import '../../models/notification_model.dart';
import '../listItems/Notification_list_items.dart';

class NotificationList extends StatelessWidget {
  final List<NotificationDatum> items; // Ensure this matches your data type
  // final Function(int) onMoveToBlogDetail;

  const NotificationList({super.key, required this.items});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      scrollDirection: Axis.vertical,
      itemCount: items.length,
      itemBuilder: (context, index) {
        final item = items[index];
        return  NotificationListItem(title: item.title ?? '', info: item.text ?? ''); // Updated to use imageUrl
      },
    );
  }
}