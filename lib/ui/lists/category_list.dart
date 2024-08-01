import 'package:flutter/material.dart';
import 'package:flutter_fabby_demo/ui/listItems/category_list_items.dart';

import '../../colors/colors.dart';

class CategoryList extends StatefulWidget {
  final List<String> items; // Ensure this matches your data type
  final ValueChanged<String> onItemSelected; // Callback for item selection

  const CategoryList({
    super.key,
    required this.items,
    required this.onItemSelected, // Initialize the callback
  });

  @override
  _CategoryListState createState() => _CategoryListState();
}

class _CategoryListState extends State<CategoryList> {
  String _selectedItem = ''; // Track the selected item

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      scrollDirection: Axis.horizontal,
      itemCount: widget.items.length,
      itemBuilder: (context, index) {
        final item = widget.items[index];
        final isSelected = item == _selectedItem;

        return GestureDetector(
          onTap: () {
            setState(() {
              _selectedItem = item; // Update the selected item
            });
            widget.onItemSelected(item); // Call the callback with the selected item
          },
          child: CategoryListItem(
            label: item,
            backgroundColor: isSelected ? AppColors.cardBackColor : AppColors.white, // Change background color when selected
            textColor: isSelected ? AppColors.white : AppColors.lightBlack, // Change text color when selected
          ),
        );
      },
    );
  }
}
