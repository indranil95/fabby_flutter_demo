import 'package:flutter/cupertino.dart';
import 'package:flutter_fabby_demo/models/cart_data_model.dart';
import 'package:flutter_fabby_demo/ui/listItems/cartlist_item.dart';
import 'package:flutter_fabby_demo/utils/logger_service.dart';

class CartListList extends StatefulWidget {
  final List<Carts> items; // Ensure this matches your data type
  final Function(int) onDelete;
  final Function(int) onTick;
  final Function(int) onPlus;
  final Function(int) onMinus;
  final bool areAllItemsSelected;
  final Function(double) onTotalPriceChange; // New callback for total price

  const CartListList({
    super.key,
    required this.items,
    required this.onDelete,
    required this.onTick,
    required this.onPlus,
    required this.onMinus,
    required this.areAllItemsSelected,
    required this.onTotalPriceChange,
  });

  @override
  _CartListListState createState() => _CartListListState();
}

class _CartListListState extends State<CartListList> {
  Map<int, double> itemPrices = {};

  void _handlePriceChange(int index, double price) {
    setState(() {
      itemPrices[index] = price;
    });

    // Calculate the total price
    double totalPrice =
        itemPrices.values.fold(0.0, (sum, price) => sum + price);

    // Notify the parent widget of the total price change
    widget.onTotalPriceChange(totalPrice);
  }

  @override
  Widget build(BuildContext context) {
    // Flatten the list of Data objects from all WishListModel instances
    final List<Carts> allData = widget.items;
    LoggerService.d("list ", allData.length);
    LoggerService.d("areAllItemsSelected list  ", widget.areAllItemsSelected);
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
          price: double.parse(dataItem.product!.price.toString()),
          cartCount: dataItem.cartCount.toString(),
          productQuantity:
              dataItem.product?.store?[0].pivot?.productQuantity.toString(),
          discountValue: dataItem.product?.offers != null
              ? dataItem.product?.offers?.discountValue
              : 0.0,
          discountType: dataItem.product?.offers != null
              ? dataItem.product?.offers?.discountType
              : 0,
          onDelete: () {
            widget.onDelete(index);
          },
          onTick: () {
            widget.onTick(
                index); // Pass the state here// Access product description
          },
          onPlus: () {
            widget.onPlus(
                index); // Pass the state here// Access product description
          },
          onMinus: () {
            widget.onMinus(
                index); // Pass the state here// Access product description
          },
          isInitiallyTicked: widget.areAllItemsSelected,
          onPriceChange: (price) =>
              _handlePriceChange(index, price), // Handle price changes
        );
      },
    ));
  }
}
