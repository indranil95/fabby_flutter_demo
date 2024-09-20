import 'package:flutter/cupertino.dart';
import 'package:flutter_fabby_demo/models/cart_data_model.dart';
import 'package:flutter_fabby_demo/ui/listItems/cartlist_item.dart';

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


  @override
  void initState() {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      _calculateTotalPrice();
    });
    super.initState();
  }
  @override
  void didUpdateWidget(covariant CartListList oldWidget) {
    super.didUpdateWidget(oldWidget);
    WidgetsBinding.instance.addPostFrameCallback((_) {
      _calculateTotalPrice(); // Recalculate total price whenever the widget updates
    });
  }

  void _calculateTotalPrice() {
    double totalPrice = 0.0;
    for (int i = 0; i < widget.items.length; i++) {
      final item = widget.items[i];
      final itemPrice = _calculateItemPrice(item);
      itemPrices[i] = itemPrice;
      totalPrice += itemPrice;
    }

    // Notify the parent widget about the total price
    widget.onTotalPriceChange(totalPrice);
  }
  double _calculateItemPrice(Carts item) {
    double price = double.parse(item.product!.price.toString());

    // Apply discounts if available
    if (item.product?.offers != null) {
      final discountValue = item.product!.offers!.discountValue;
      final discountType = item.product!.offers!.discountType;

      if (discountType == 1) {
        // Flat discount
        price -= discountValue;
      } else if (discountType == 2) {
        // Percentage discount
        price -= price * (discountValue / 100);
      }
    }

    // Multiply by the cart count
    return price * (item.cartCount ?? 1);
  }

  @override
  Widget build(BuildContext context) {
    // Flatten the list of Data objects from all WishListModel instances
    final List<Carts> allData = widget.items;
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
            _calculateTotalPrice();
          },
          onTick: () {
            widget.onTick(
                index);
          },
          onPlus: () {
            widget.onPlus(
                index);
            _calculateTotalPrice();
          },
          onMinus: () {
            widget.onMinus(
                index);
            _calculateTotalPrice();
          },
          isInitiallyTicked: widget.areAllItemsSelected,
          onPriceChange: (price) {setState(() {
            itemPrices[index] = price;
          });
          _calculateTotalPrice();
          },
        );
      },
    ));
  }
}
