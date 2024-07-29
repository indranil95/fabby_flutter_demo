import 'package:flutter/material.dart';
import 'package:flutter_fabby_demo/models/banner_model.dart';
import '../listItems/banner_list_item.dart'; // Adjust the import as needed

class BannerList extends StatelessWidget {
  final List<WebBanners> items; // Ensure this matches your data type

  const BannerList({super.key, required this.items});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      scrollDirection: Axis.horizontal,
      itemCount: items.length,
      itemBuilder: (context, index) {
        final item = items[index];
        return BannerListItem(imageUrl: item.banner); // Updated to use imageUrl
      },
    );
  }
}

