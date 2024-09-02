import 'package:flutter/material.dart';
import 'package:flutter_fabby_demo/models/all_product_model.dart';
import 'package:flutter_fabby_demo/models/blogs_model.dart';
import 'package:flutter_fabby_demo/ui/listItems/blogs_list_item.dart';

class BlogsList extends StatelessWidget {
  final List<Articles> items; // Ensure this matches your data type
  final Function(int) onMoveToBlogDetail;

  const BlogsList({super.key, required this.items, required this.onMoveToBlogDetail});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      scrollDirection: Axis.horizontal,
      itemCount: items.length,
      itemBuilder: (context, index) {
        final item = items[index];
        return  BlogsListItems(imageUrl: item.image, title: item.title, description: item.description, onMoveToBlogDetail: () {
          onMoveToBlogDetail(index);
        },); // Updated to use imageUrl
      },
    );
  }
}