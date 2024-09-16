import 'package:flutter/cupertino.dart';
import 'package:flutter_fabby_demo/models/cart_data_model.dart';
import 'package:flutter_fabby_demo/models/checkout_model.dart';
import 'package:flutter_fabby_demo/ui/listItems/cartlist_item.dart';
import 'package:flutter_fabby_demo/ui/listItems/checkout_address_item.dart';
import 'package:flutter_fabby_demo/utils/logger_service.dart';

class Checkoutaddresslist extends StatefulWidget {
  final List<CustomerAddress> items; // Ensure this matches your data type
  final Function(int) onDelete;
  final Function(int) onEdit;
  final Function(int) onItemSelected;

  const Checkoutaddresslist({
    super.key,
    required this.items,
    required this.onDelete,
    required this.onEdit,
    required this.onItemSelected,
  });

  @override
  _CheckoutaddresslistState createState() => _CheckoutaddresslistState();
}

class _CheckoutaddresslistState extends State<Checkoutaddresslist> {
  int? selectedIndex; // Track the selected index

  @override
  Widget build(BuildContext context) {
    // Flatten the list of Data objects from all WishListModel instances
    final List<CustomerAddress> allData = widget.items;
    LoggerService.d("list ", allData.length);
    return Expanded(
        child: ListView.builder(
          scrollDirection: Axis.vertical,
          itemCount: allData.length,
          itemBuilder: (context, index) {
            final dataItem = allData[index];

            // Ensure your BlogsListItems widget matches the structure of Data class
            return CheckoutAddressItem(
              location: dataItem.location ?? "",
              pin: dataItem.pin.toString(),
              city: dataItem.city ?? "",
              state: dataItem.state ?? "",
              country: dataItem.country ?? "",
              isSelected: selectedIndex == index, // Mark selected item
              onDelete: () {
                widget.onDelete(index);
              },
              onEdit: () {
                widget.onEdit(
                    index);
              },
              onItemSelected: () {
                setState(() {
                  selectedIndex = index; // Update selected index
                });
                widget.onItemSelected(index);
              },
            );
          },
        ));
  }
}
