import 'package:flutter/cupertino.dart';
import 'package:flutter_fabby_demo/AppConstant/app_constant.dart';
import 'package:flutter_fabby_demo/models/cart_data_model.dart';
import 'package:flutter_fabby_demo/ui/listItems/cartlist_item.dart';
import 'package:flutter_fabby_demo/ui/listItems/wishlist_item.dart';
import 'package:flutter_fabby_demo/utils/logger_service.dart';

import '../../models/wishlist_model.dart';

class CartListList extends StatelessWidget {
  final List<Carts> items; // Ensure this matches your data type
  final Function(int) onDelete;
  final Function(int) onTick;
  final bool areAllItemsSelected;


  const CartListList({
    super.key,
    required this.items,
    required this.onDelete,
    required this.onTick,
    required this.areAllItemsSelected,
  });

  @override
  Widget build(BuildContext context) {
    // Flatten the list of Data objects from all WishListModel instances
    final List<Carts> allData = items;
    LoggerService.d("list ", allData.length);
    LoggerService.d("areAllItemsSelected list  ", areAllItemsSelected);
    return Expanded(
        child: ListView.builder(
          scrollDirection: Axis.vertical,
          itemCount: allData.length,
          itemBuilder: (context, index) {
            final dataItem = allData[index];

            // Ensure your BlogsListItems widget matches the structure of Data class
            return CartListItem(
              imageSrc: dataItem.product?.productImage,
              title: dataItem.product?.productName,
              price: "${AppConstants.rupeeSign} + ${dataItem.product?.price}",
              onDelete: () {
                onDelete(index);
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
