import 'package:flutter/cupertino.dart';
import 'package:flutter_fabby_demo/AppConstant/app_constant.dart';
import 'package:flutter_fabby_demo/ui/listItems/wishlist_item.dart';

import '../../models/wishlist_model.dart';

class WishListList extends StatelessWidget {
  final List<WishListModel> items; // Ensure this matches your data type

  const WishListList({super.key, required this.items});

  @override
  Widget build(BuildContext context) {
    // Flatten the list of Data objects from all WishListModel instances
    final List<Data> allData = items.expand((wishListModel) => wishListModel.data).toList();

    return ListView.builder(
      scrollDirection: Axis.horizontal,
      itemCount: allData.length,
      itemBuilder: (context, index) {
        final dataItem = allData[index];

        // Ensure your BlogsListItems widget matches the structure of Data class
        return WishlistItem(
           imageSrc: dataItem.product.productImage, title: dataItem.product.productName, price: AppConstants.rupeeSign + dataItem.product.price, onDelete: () {  }, onMoveToCart: () {  }, // Access product description
        );
      },
    );
  }
}
