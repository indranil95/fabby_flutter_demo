import 'package:flutter/material.dart';
import 'package:flutter_fabby_demo/models/blogs_model.dart';
import 'package:flutter_fabby_demo/ui/listItems/recentblog_list_items.dart';


class RecentblogList extends StatelessWidget {
  final List<Articles> items; // Ensure this matches your data type
  final Function(int) onMoveToBlogDetail;

  const RecentblogList({super.key, required this.items, required this.onMoveToBlogDetail});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      scrollDirection: Axis.vertical,
      itemCount: items.length,
      itemBuilder: (context, index) {
        final item = items[index];
        return  RecentBlogListItem(imageUrl: item.image, title: item.title, description: item.description, onMoveToBlogDetail: () {
          onMoveToBlogDetail(index);
        },); // Updated to use imageUrl
      },
    );
  }
}