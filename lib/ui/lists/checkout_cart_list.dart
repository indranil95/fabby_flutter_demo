import 'package:flutter/cupertino.dart';
import 'package:flutter_fabby_demo/AppConstant/app_constant.dart';
import 'package:flutter_fabby_demo/models/cart_data_model.dart';
import 'package:flutter_fabby_demo/ui/listItems/checkout_cart_item.dart';
import 'package:flutter_fabby_demo/utils/logger_service.dart';

class CheckoutCartList extends StatefulWidget {
  final List<Carts> items; // Ensure this matches your data type

  const CheckoutCartList({
    super.key,
    required this.items,
  });

  @override
  _CheckoutCartListState createState() => _CheckoutCartListState();
}

class _CheckoutCartListState extends State<CheckoutCartList> {
  int? selectedIndex; // Track the selected index

  @override
  Widget build(BuildContext context) {
    // Flatten the list of Data objects from all WishListModel instances
    final List<Carts> allData = widget.items;
   // LoggerService.d("list ", allData.length);
    return Expanded(
        child: ListView.builder(
      scrollDirection: Axis.vertical,
      itemCount: allData.length,
      itemBuilder: (context, index) {
        final dataItem = allData[index];

        // Ensure your BlogsListItems widget matches the structure of Data class
        return CheckoutCartItem(
          imgurl: dataItem.product?.productImage ?? "",
          title: dataItem.product?.productName ?? "",
          subtitle: AppConstants.weight,
          price: dataItem.product?.price ?? "",
          discountValue: dataItem.product?.offers != null
              ? (dataItem.product?.offers?.discountValue?.toString() ?? "0.0")
              : "0.0",
          discountType: dataItem.product?.offers != null
              ? dataItem.product?.offers?.discountType
              : 0,
          subtitlevalue: "Quantity : ${dataItem.cartCount}N",
          cartCount:dataItem.cartCount ?? 0,
        );
      },
    ));
  }
}
