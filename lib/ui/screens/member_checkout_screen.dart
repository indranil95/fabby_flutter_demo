import 'package:flutter/material.dart';
import 'package:flutter_fabby_demo/ui/dialog/address_update_dialog.dart';
import 'package:flutter_fabby_demo/ui/dialog/edit_address_sheet.dart';
import 'package:flutter_fabby_demo/ui/lists/checkout_address_list.dart';
import 'package:flutter_fabby_demo/ui/lists/checkout_cart_list.dart';
import 'package:flutter_fabby_demo/ui/screens/memeber_payment_screen.dart';
import 'package:flutter_fabby_demo/ui/screens/top_bar_detail.dart';
import 'package:flutter_fabby_demo/utils/logger_service.dart';
import 'package:flutter_fabby_demo/utils/snackbar_utils.dart';
import 'package:flutter_fabby_demo/utils/text_utils.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';
import 'package:provider/provider.dart';

import '../../AppConstant/app_constant.dart';
import '../../colors/colors.dart';
import '../../strings/strings.dart';
import '../../utils/navigation_service.dart';
import '../../viewModels/member_checkout_viewModel.dart';
import '../dialog/add_new_address_sheet.dart';
import '../dialog/custom_dialog.dart';

class MemberCheckoutScreen extends StatefulWidget {
  const MemberCheckoutScreen({super.key});

  @override
  _MemberCheckoutScreenState createState() => _MemberCheckoutScreenState();
}

class _MemberCheckoutScreenState extends State<MemberCheckoutScreen> {
  late MemberCheckoutViewModel viewModel;

  void _showAddNewAddressSheet(BuildContext context) async {
    final result = await showModalBottomSheet<Map<String, dynamic>>(
      context: context,
      isScrollControlled: true,
      backgroundColor: AppColors.transparentColor,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(
          top: Radius.circular(20),
        ),
      ),
      builder: (context) {
        return Padding(
          padding: const EdgeInsets.only(top: 8.0),
          child: DraggableScrollableSheet(
            initialChildSize: 0.6, // Adjust initial size based on your content
            minChildSize: 0.3, // Minimum size when the sheet is collapsed
            maxChildSize: 0.9, // Maximum size when the sheet is expanded
            builder: (context, scrollController) {
              return AddNewAddressSheet(
                scrollController:
                    scrollController, // Pass the scrollController to the sheet
              );
            },
          ),
        );
      },
    );

    if (result != null) {
      // Handle the result (request body) here
    //  LoggerService.d('Request Body: $result');
      await viewModel.sendAddAddressMobileRequest(result);
      if (viewModel.addAddressData?.success == true) {
        showSuccessCardDialog(
          context,
          "Address saved successfully",
        );
      } else {
        SnackbarService.showErrorSnackbar(
            context, viewModel.addAddressData!.statusCode.toString());
      }
      // You can use this data to send a request or perform other actions
    }
  }

  void _showEditAddressSheet(
    BuildContext context,
    num? id,
  ) async {
    final result = await showModalBottomSheet<Map<String, dynamic>>(
      context: context,
      isScrollControlled: true,
      backgroundColor: AppColors.transparentColor,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(
          top: Radius.circular(20),
        ),
      ),
      builder: (context) {
        return Padding(
          padding: const EdgeInsets.only(top: 8.0),
          child: DraggableScrollableSheet(
            initialChildSize: 0.6, // Adjust initial size based on your content
            minChildSize: 0.3, // Minimum size when the sheet is collapsed
            maxChildSize: 0.9, // Maximum size when the sheet is expanded
            builder: (context, scrollController) {
              return EditAddressSheet(
                  scrollController: scrollController,
                  id: id ?? 0 // Pass the scrollController to the sheet
                  );
            },
          ),
        );
      },
    );

    if (result != null) {
      // Handle the result (request body) here
     // LoggerService.d('Request Body: $result');
      await viewModel.sendAddAddressMobileRequest(result);
      if (viewModel.addAddressData?.success == true) {
        showSuccessCardDialog(
          context,
          "Address saved successfully",
        );
      } else {
        SnackbarService.showErrorSnackbar(
            context, viewModel.addAddressData!.statusCode.toString());
      }
      // You can use this data to send a request or perform other actions
    }
  }

  void showSimpleDialog(BuildContext context, String s) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return CustomDialog(
          maxLines: 1,
          message: s,
          onButtonPressed: () {
            //NavigationService.goBack();
            _fetchCheckoutData();
          },
          buttonText: 'ok', // Customize button text if needed
        );
      },
    );
  }

  void showSuccessCardDialog(BuildContext context, String s) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return SuccessMessageCard(
          title: s,
          onButtonPressed: () {
            //NavigationService.goBack();
            _fetchCheckoutData();
          },
          buttonText: 'ok', maxLines: 1, // Customize button text if needed
        );
      },
    );
  }

  @override
  void initState() {
    viewModel = Provider.of<MemberCheckoutViewModel>(context, listen: false);
    _fetchCheckoutData();
    _fetchCartList();
    super.initState();
  }

  Future<void> _fetchCheckoutData() async {
    String? guestId = await viewModel.getGuestId();

    final requestBody = {
      'guest_id': guestId, // Handle the case where guestId is null
    };

    viewModel.checkout(requestBody);
  }

  Future<void> _fetchCartList() async {
    // Fetch mainId and guestId asynchronously
    String mainId = await viewModel.getMainId();
    String? guestId = await viewModel.getGuestId();

    final requestBody = {
      'buy_now': AppConstants.blankLimit,
      'store_id': AppConstants.storeId,
      'user_id': int.parse(mainId),
      'guestid': guestId, // Handle the case where guestId is null
    };

    viewModel.cartDataList(requestBody);
  }

  String removeDecimalPoints(String input) {
    // Remove commas from the input string
    String cleanInput = input.replaceAll(",", "");

    // Convert the clean string to a double
    double doubleValue = double.parse(cleanInput);

    // Round the double value to the nearest integer
    int integerValue = doubleValue.round();

    // Convert the integer to a string and return
    return integerValue.toString();
  }
  String setTotalValue(String subtotal, String discount) {
    // Replace commas and convert to double for subtotal and discount
    double subtotalValue = double.parse(subtotal.replaceAll(",", ""));
    double shippingCharges;

    // Determine shipping charges based on subtotal
    if (subtotalValue >= 900) {
      shippingCharges = 0.0;
    } else {
      shippingCharges = 50.0;
    }

    double discountValue = double.parse(discount.replaceAll(",", ""));

    // Calculate total
    double total = subtotalValue - discountValue + shippingCharges;

    // Use the removeDecimalPoints function
    String finalValue = removeDecimalPoints(total.toString());

    // Assuming you have Constants.rupeeSign defined
    const String rupeeSign = '₹'; // Replace with your rupee sign constant

    // Return the total value as a formatted string
    return rupeeSign + " " + finalValue;
  }


  String discount = "0";
  String coupon = AppConstants.noData;
  String buyNow = AppConstants.blankLimit;
  String customerAddressId = "";

  @override
  Widget build(BuildContext context) {
    final data =
        ModalRoute.of(context)?.settings.arguments as Map<String, dynamic>?;
    discount = data?['discount'] ?? "0";
    coupon = data?['coupon'] ?? "0";
    buyNow = data?['buy_now'] ?? AppConstants.blankLimit;
   // LoggerService.d("discount $discount");
    return Scaffold(
      appBar: const TopBarDetail(title: AppStrings.checkoutFirstCaps),
      backgroundColor: AppColors.fabbyBack,
      body: Padding(
        padding: const EdgeInsets.all(10.0),
        child: SingleChildScrollView(child: Consumer<MemberCheckoutViewModel>(
          builder: (context, viewModel, child) {
            if (viewModel.loading) {
              return Center(
                child: LoadingAnimationWidget.staggeredDotsWave(
                    color: AppColors.fabbyBondiBlue, size: 50.0),
              );
            }
            final items = viewModel.checkoutModel?.data?.customerAddress ?? [];
            final cartItems = viewModel.cartData?.data?.carts;
            final cartData = viewModel.cartData?.data;
            return Column(
              children: [
                Row(
                  children: [
                    Container(
                      margin: const EdgeInsets.only(
                          left: 10.0, right: 10.0, top: 10.0),
                      child: TextUtils.display(
                        AppStrings.shippingDetails,
                        fontFamily: 'DmSerifDisplay',
                        fontWeight: FontWeight.w500,
                        fontSize: 20,
                        color: AppColors.sortTextColor,
                      ),
                    ),
                  ],
                ),
                Row(
                  children: [
                    Container(
                      margin: const EdgeInsets.only(
                          left: 10.0, right: 10.0, top: 10.0),
                      child: TextUtils.display(
                        AppStrings.yourPetsEssentialsJustAClickAway,
                        fontFamily: 'Poppins',
                        fontWeight: FontWeight.normal,
                        fontSize: 13,
                        color: AppColors.sortTextColor,
                      ),
                    ),
                  ],
                ),
                Column(
                  children: [
                    Container(
                        width: double.infinity,
                        margin: const EdgeInsets.only(
                            left: 10.0, right: 10.0, bottom: 20.0, top: 10.0),
                        decoration: BoxDecoration(
                          color: Colors.transparent,
                          // Equivalent to @color/transparent
                          borderRadius: BorderRadius.circular(5.0),
                          // Equivalent to android:radius="5dp"
                          border: Border.all(
                            color: AppColors.lightBlueFabby,
                            // Replace with actual color value for @color/light_blue_fabby
                            width:
                                1.5, // Replace with actual dimension value for @dimen/_1sdp
                          ),
                        ),
                        child: Column(
                          children: [
                            Row(
                              children: [
                                Container(
                                  margin: const EdgeInsets.only(left: 10.0),
                                  child: Padding(
                                    padding: const EdgeInsets.all(5.0),
                                    child: TextUtils.display(
                                      AppStrings.yourSavedAddresses,
                                      fontFamily: 'DmSerifDisplay',
                                      fontWeight: FontWeight.normal,
                                      fontSize: 16,
                                      color: AppColors.sortTextColor,
                                    ),
                                  ),
                                ),
                              ],
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
                            Visibility(
                              visible: items.isNotEmpty,
                              child: SizedBox(
                                height: 200.0,
                                child: Checkoutaddresslist(
                                  items: items,
                                  onDelete: (int index) async {
                                    final item = items[index];
                                    final requestBody = {"id": item.id};
                                    await viewModel.deleteAddress(requestBody);
                                    if (viewModel
                                            .deletedAddressModel?.success ==
                                        true) {
                                      showSimpleDialog(context,
                                          "Address deleted successfully");
                                    } else {
                                      SnackbarService.showErrorSnackbar(
                                          context,
                                          viewModel
                                              .deletedAddressModel!.statusCode
                                              .toString());
                                    }
                                  },
                                  onEdit: (int index) {
                                    /*LoggerService.d(
                                        'Tick clicked at index: $index');*/
                                    final item = items[index];
                                    _showEditAddressSheet(context, item.id);
                                  },
                                  onItemSelected: (int index) async {
                                    /*LoggerService.d(
                                        'plus clicked at index: $index');*/
                                    final item = items[index];
                                    customerAddressId=item.id.toString();
                                  },
                                ),
                              ),
                            )
                          ],
                        )),
                    GestureDetector(
                      onTap: () {
                        _showAddNewAddressSheet(context);
                      },
                      child: Row(
                        children: [
                          Container(
                            margin: const EdgeInsets.only(
                              left: 10.0,
                            ),
                            child: IconButton(
                              icon: const Icon(Icons.add),
                              // System "add" icon
                              onPressed: () {},
                            ),
                          ),
                          Container(
                            margin: const EdgeInsets.only(
                              right: 10.0,
                            ),
                            child: TextUtils.display(
                              AppStrings.addNewAddress,
                              fontFamily: 'Poppins',
                              fontWeight: FontWeight.w400,
                              fontSize: 15,
                              color: AppColors.sortTextColor,
                            ),
                          ),
                        ],
                      ),
                    ),
                    Container(
                      width: double.infinity,
                      height: 500.0,
                      color: AppColors.paymentSelectBack,
                      child: Column(
                        children: [
                          Visibility(
                              visible: cartItems?.isNotEmpty ?? false,
                              child: CheckoutCartList(items: cartItems ?? [])),
                          Container(
                            margin: const EdgeInsets.all(10),
                            child: Row(
                              children: [
                                TextUtils.display(
                                  AppStrings.subtotal,
                                  fontFamily: 'Poppins',
                                  fontWeight: FontWeight.w600,
                                  fontSize: 13,
                                  color: AppColors.sortTextColor,
                                ),
                                const Spacer(),
                                TextUtils.display(
                                  removeDecimalPoints(
                                      cartData?.subtotal ?? "0"),
                                  fontFamily: 'DmSerifDisplay',
                                  fontWeight: FontWeight.normal,
                                  fontSize: 13,
                                  color: AppColors.sortTextColor,
                                ),
                              ],
                            ),
                          ),
                          Container(
                            margin: const EdgeInsets.all(10),
                            child: Row(
                              children: [
                                TextUtils.display(
                                  AppStrings.couponDiscount,
                                  fontFamily: 'Poppins',
                                  fontWeight: FontWeight.normal,
                                  fontSize: 14,
                                  color: AppColors.sortTextColor,
                                ),
                                const Spacer(),
                                TextUtils.display(
                                  discount,
                                  fontFamily: 'DmSerifDisplay',
                                  fontWeight: FontWeight.normal,
                                  fontSize: 13,
                                  color: AppColors.sortTextColor,
                                ),
                              ],
                            ),
                          ),
                          Container(
                            margin: const EdgeInsets.all(10),
                            child: Row(
                              children: [
                                TextUtils.display(
                                  AppStrings.shippingCharges,
                                  fontFamily: 'Poppins',
                                  fontWeight: FontWeight.normal,
                                  fontSize: 14,
                                  color: AppColors.sortTextColor,
                                ),
                                const Spacer(),
                                int.parse(removeDecimalPoints(
                                            cartData?.subtotal ?? "0")) >=
                                        900
                                    ? TextUtils.display(
                                        "₹ 0",
                                        fontFamily: 'DmSerifDisplay',
                                        fontWeight: FontWeight.normal,
                                        fontSize: 13,
                                        color: AppColors.sortTextColor,
                                      )
                                    : TextUtils.display(
                                        "₹ 50",
                                        fontFamily: 'DmSerifDisplay',
                                        fontWeight: FontWeight.normal,
                                        fontSize: 13,
                                        color: AppColors.sortTextColor,
                                      ),
                              ],
                            ),
                          ),
                          Container(
                            width: double.infinity,
                            // Equivalent to match_parent
                            height: 1.0,
                            // Equivalent to 1dp height
                            margin:
                                const EdgeInsets.fromLTRB(10.0, 0.0, 10.0, 0.0),
                            // Equivalent to layout_marginStart, layout_marginTop, layout_marginEnd
                            color: AppColors
                                .white, // Equivalent to android:background="@color/white"
                          ),
                          Container(
                            margin: const EdgeInsets.all(10),
                            child: Row(
                              children: [
                                TextUtils.display(
                                  AppStrings.total,
                                  fontFamily: 'Poppins',
                                  fontWeight: FontWeight.w600,
                                  fontSize: 14,
                                  color: AppColors.sortTextColor,
                                ),
                                const Spacer(),
                                TextUtils.display(
                                  setTotalValue(removeDecimalPoints(cartData?.subtotal ?? "0"),discount),
                                  fontFamily: 'DmSerifDisplay',
                                  fontWeight: FontWeight.normal,
                                  fontSize: 14,
                                  color: AppColors.sortTextColor,
                                ),
                              ],
                            ),
                          ),
                          GestureDetector(onTap: (){
                            customerAddressId.isNotEmpty ?
                            NavigationService.navigateToWithData(
                                const MemberPaymentScreen(),
                                data: {
                                  "customerAddressId": customerAddressId,
                                  "discountString": discount,
                                  "couponString": coupon,
                                  "buyNowString": buyNow
                                }) : SnackbarService.showErrorSnackbar(context, "Please select an address");
                          },child: Container(
                            margin: const EdgeInsetsDirectional.all(10.0),
                            alignment: AlignmentDirectional.center,
                            width: double.infinity,
                            height: 50.0,
                            child: Card(
                              color: AppColors.fabbyBondiBlue,
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(
                                    20.0), // Add curve here
                              ),
                              child: SizedBox(
                                width: double.infinity,
                                // Ensure the Card takes full width of the container
                                height: double.infinity,
                                // Ensure the Card takes full height of the container
                                child: Padding(
                                  padding: const EdgeInsets.all(10.0),
                                  child: TextUtils.display(
                                    AppStrings.continueToPayment,
                                    fontSize: 14.0,
                                    // Increased fontSize for larger text
                                    color: AppColors.white,
                                    fontFamily: 'Poppins',
                                    fontWeight: FontWeight.w600,
                                    textAlign:
                                    TextAlign.center, // Center the text
                                  ),
                                ),
                              ),
                            ),
                          ),)

                        ],
                      ),
                    ),
                  ],
                )
              ],
            );
          },
        )),
      ),
    );
  }
}
