import 'package:flutter/material.dart';
import 'package:flutter_fabby_demo/colors/colors.dart';
import 'package:flutter_fabby_demo/strings/strings.dart';
import 'package:flutter_fabby_demo/utils/image_utils.dart';
import 'package:flutter_fabby_demo/utils/text_utils.dart';

class SavedAddressItem extends StatefulWidget {
  final String location;
  final String pin;
  final String city;
  final String state;
  final String country;
  final bool isSelected;
  final VoidCallback onItemSelected; // Callback to notify the parent
  final VoidCallback onDelete; // Callback to notify the parent

  const SavedAddressItem({
    super.key,
    required this.location,
    required this.pin,
    required this.city,
    required this.state,
    required this.country,
    required this.isSelected,
    required this.onItemSelected, // Add callback for item selection
    required this.onDelete, // Add callback for item selection
  });

  @override
  _SavedAddressItemState createState() => _SavedAddressItemState();
}

class _SavedAddressItemState extends State<SavedAddressItem> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: widget.onItemSelected,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Container(
            padding: const EdgeInsets.symmetric(vertical: 10.0),
            color: AppColors.paymentSelectBack, // Replace with your color
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Padding(
                  padding: const EdgeInsets.only(left: 20.0),
                  child: SvgImage.asset(
                    widget.isSelected
                        ? 'assets/payment_selected.svg' // Show selected image
                        : 'assets/payment_unselected.svg', // Show unselected image
                    width: 20.0,
                    height: 20.0,
                  ),
                ),
                Expanded(
                    child: Padding(
                      padding: const EdgeInsets.only(left: 20.0),
                      child: TextUtils.displayLargeText(
                        '${widget.location}  ,  ${widget.pin}  ,  ${widget.city}  ,  ${widget.state}  ,  ${widget.country}',
                        fontSize: 14.0,
                        fontFamily: 'PoppinsRegular',
                      ),
                    )),
                const Spacer(),
                Padding(
                  padding: const EdgeInsets.only(right: 10.0),
                  child: GestureDetector(
                    onTap: widget.onDelete,
                    child: TextUtils.display(AppStrings.delete,
                        fontFamily: 'Poppins',
                        fontSize: 14.0,
                        fontWeight: FontWeight.w400,
                        color: AppColors.removeTextColor,
                        decoration: TextDecoration.underline),
                  ),
                ),
                // Padding(
                //   padding: const EdgeInsets.only(right: 10.0),
                //   child: GestureDetector(
                //     onTap: widget.onEdit,
                //     child: TextUtils.display(AppStrings.edit,
                //         fontFamily: 'Poppins',
                //         fontSize: 14.0,
                //         fontWeight: FontWeight.w400,
                //         color: AppColors.removeTextColor,
                //         decoration: TextDecoration.underline),
                //   ),
                // ),
              ],
            ),
          ),
          Container(
            width: double.infinity,
            // Equivalent to match_parent
            height: 1.0,
            // Equivalent to 1dp height
            margin:
            const EdgeInsets.fromLTRB(0.0, 0.0, 0.0, 0.0),
            // Equivalent to layout_marginStart, layout_marginTop, layout_marginEnd
            color: AppColors
                .lightBlueFabby, // Equivalent to android:background="@color/white"
          ),
        ],
      ),
    );
  }
}



// import 'package:flutter/material.dart';
//
// class AddressListItem extends StatefulWidget {
//   final String address;
//   final Function onDelete;
//
//   const AddressListItem({required this.address, required this.onDelete, Key? key}) : super(key: key);
//
//   @override
//   _AddressListItemState createState() => _AddressListItemState();
// }
//
// class _AddressListItemState extends State<AddressListItem> {
//   bool isSelected = false;
//
//   @override
//   Widget build(BuildContext context) {
//     return GestureDetector(
//       onTap: () {
//         setState(() {
//           isSelected = !isSelected;
//         });
//       },
//       child: Container(
//         padding: EdgeInsets.all(10),
//         margin: EdgeInsets.symmetric(vertical: 5),
//         decoration: BoxDecoration(
//           color: isSelected ? Colors.pink.shade50 : Colors.white,
//           border: Border.all(color: Colors.pink.shade200),
//           borderRadius: BorderRadius.circular(8),
//         ),
//         child: Row(
//           crossAxisAlignment: CrossAxisAlignment.start,
//           children: [
//             // Radio Button or Image Icon
//             Icon(
//               isSelected ? Icons.radio_button_checked : Icons.radio_button_unchecked,
//               color: Colors.pink,
//             ),
//             SizedBox(width: 10),
//             // Address Text
//             Expanded(
//               child: Text(
//                 widget.address,
//                 style: TextStyle(fontSize: 16),
//               ),
//             ),
//             // Delete Button
//             IconButton(
//               onPressed: () {
//                 widget.onDelete();
//               },
//               icon: Icon(Icons.delete, color: Colors.pink),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }
