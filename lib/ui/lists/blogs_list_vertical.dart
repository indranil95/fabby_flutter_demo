import 'package:flutter/material.dart';
import 'package:flutter_fabby_demo/models/blogs_model.dart';

import '../listItems/all_blogs_list_item.dart';

class BlogsListVertical extends StatelessWidget {
  final List<Articles> items; // Ensure this matches your data type
  final Function(int) onMoveToBlogDetail;

  const BlogsListVertical({super.key, required this.items, required this.onMoveToBlogDetail});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      scrollDirection: Axis.vertical,
      itemCount: items.length,
      itemBuilder: (context, index) {
        final item = items[index];
        return  AllBlogListItem(imageUrl: item.image, title: item.title, description: item.description, onMoveToBlogDetail: () {
          onMoveToBlogDetail(index);
        },); // Updated to use imageUrl
      },
    );
  }
}