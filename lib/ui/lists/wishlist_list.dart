import 'package:flutter/cupertino.dart';
import 'package:flutter_fabby_demo/AppConstant/app_constant.dart';
import 'package:flutter_fabby_demo/ui/listItems/wishlist_item.dart';
import 'package:flutter_fabby_demo/utils/logger_service.dart';

import '../../models/wishlist_model.dart';

class WishListList extends StatelessWidget {
  final List<Data> items; // Ensure this matches your data type
  final Function(int) onMoveToCart;
  final Function(int) onDelete;
  final Function(int) onTick;
  final bool areAllItemsSelected;


  const WishListList({
    super.key,
    required this.items,
    required this.onMoveToCart,
    required this.onDelete,
    required this.onTick,
    required this.areAllItemsSelected,
  });

  @override
  Widget build(BuildContext context) {
    // Flatten the list of Data objects from all WishListModel instances
    final List<Data> allData = items;
   // LoggerService.d("list ", allData.length);
   // LoggerService.d("areAllItemsSelected list  ", areAllItemsSelected);
    return Expanded(
        child: GridView.builder(
      padding: const EdgeInsets.all(0), // Optional padding
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2, // Number of columns in the grid
        mainAxisSpacing: 2, // Space between rows
        crossAxisSpacing: 2, // Space between columns
        childAspectRatio: 0.6, // Aspect ratio to control item height/width
      ),
      itemCount: allData.length,
      itemBuilder: (context, index) {
        final dataItem = allData[index];

        // Ensure your BlogsListItems widget matches the structure of Data class
        return WishlistItem(
          imageSrc: dataItem.product.productImage,
          title: dataItem.product.productName,
          price: AppConstants.rupeeSign + dataItem.product.price,
          onDelete: () {
            onDelete(index);
          },
          onMoveToCart: () {
            onMoveToCart(index);
          },
          onTick: () {
            onTick(index);// Pass the state here// Access product description
          },
          isInitiallyTicked: areAllItemsSelected,
        );
      },
    ));
  }
}
