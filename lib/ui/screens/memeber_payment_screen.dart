import 'package:flutter/material.dart';
import 'package:flutter_fabby_demo/ui/dialog/order_success_card.dart';
import 'package:flutter_fabby_demo/ui/screens/home_screen.dart';
import 'package:flutter_fabby_demo/ui/screens/top_bar_detail.dart';
import 'package:flutter_fabby_demo/utils/image_utils.dart';
import 'package:flutter_fabby_demo/viewModels/member_payment_viewmodel.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';
import 'package:provider/provider.dart';
import 'package:razorpay_flutter/razorpay_flutter.dart';

import '../../AppConstant/app_constant.dart';
import '../../colors/colors.dart';
import '../../strings/strings.dart';
import '../../utils/logger_service.dart';
import '../../utils/navigation_service.dart';
import '../../utils/snackbar_utils.dart';
import '../../utils/text_utils.dart';
import '../dialog/add_new_address_sheet.dart';
import '../dialog/address_update_dialog.dart';
import '../dialog/edit_address_sheet.dart';
import '../lists/checkout_cart_list.dart';

class MemberPaymentScreen extends StatefulWidget {
  const MemberPaymentScreen({super.key});

  @override
  _MemberPaymentScreenState createState() => _MemberPaymentScreenState();
}

class _MemberPaymentScreenState extends State<MemberPaymentScreen> {
  late Razorpay _razorpay;

  late MemberPaymentViewmodel viewModel;
  bool _isOnlinePaymentSelected = true;
  bool _isCodSelected = false;
  bool _isSameAddress = true;
  bool _isDifferentAddress = false;
  String paymentMethod = "card";
  String orderValue = "";
  String totalValue = "";
  String mainOrderId = "";

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
  String setFinalValue(String subtotal, String discount) {
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
    return finalValue;
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

  void showSuccessCardDialog(BuildContext context, String s) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return SuccessMessageCard(
          title: s,
          onButtonPressed: () {
            //NavigationService.goBack();
            _fetchCustomerAddress(customerAddressId);
          },
          buttonText: 'ok', maxLines: 1, // Customize button text if needed
        );
      },
    );
  }
  void showOrderSuccessDialog(BuildContext context, String orderId) {
    showDialog(
      context: context,
      barrierDismissible: false, // Prevent dismissing by tapping outside
      builder: (BuildContext context) {
        return Dialog(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10), // Rounded edges
          ),
          child: OrderSuccessCard(
            orderId: orderId,
            onButtonPressed: () {
              // Close the dialog and navigate back multiple times
              NavigationService.goBack(); // Close the dialog
              NavigationService.goBack(); // Additional navigation logic
              NavigationService.goBack();
            },
          ),
        );
      },
    );
  }


  Future<void> _fetchCustomerAddress(String id) async {
    final requestBody = {
      'id': id, // Handle the case where guestId is null
    };

    await viewModel.getCustomerAddress(requestBody);
  }

  String setTextColorForSubstring({
    required String fullText,
    required String targetText,
    required Color
        color, // color is no longer needed for the string output, but keeping it for consistency
  }) {
    // Find the start and end index of the target text in the full text
    int startIndex = fullText.indexOf(targetText);

    if (startIndex >= 0) {
      int endIndex = startIndex + targetText.length;

      // Create a string to combine the parts
      String resultText = "";

      if (startIndex > 0) {
        // Add the part before the target text
        resultText += fullText.substring(0, startIndex);
      }

      // Add the target text (would be colored in a UI context)
      resultText += fullText.substring(startIndex, endIndex);

      if (endIndex < fullText.length) {
        // Add the part after the target text
        resultText += fullText.substring(endIndex);
      }

      return resultText;
    } else {
      // If the target text is not found, return the full text
      return fullText;
    }
  }

  String customerAddressId = "";
  String discountString = "";
  String couponString = "";
  String buyNowString = "";
  String originalText = "Standard Shipping . ₹ 0";
  String targetText = "₹ 0";

  @override
  void initState() {
    _razorpay = Razorpay();
    _razorpay.on(Razorpay.EVENT_PAYMENT_SUCCESS, _handlePaymentSuccess);
    _razorpay.on(Razorpay.EVENT_PAYMENT_ERROR, _handlePaymentError);
    _razorpay.on(Razorpay.EVENT_EXTERNAL_WALLET, _handleExternalWallet);
    viewModel = Provider.of<MemberPaymentViewmodel>(context, listen: false);
    _fetchCartList();
    Future.microtask(() {
      final data =
          ModalRoute.of(context)?.settings.arguments as Map<String, dynamic>?;
      if (data != null) {
        _fetchCustomerAddress(data['customerAddressId']);
      }
    });
    super.initState();
  }
  @override
  void dispose() {
    super.dispose();
    _razorpay.clear(); // Removes all listeners
  }
  void _handlePaymentSuccess(PaymentSuccessResponse response) {
    // Do something when payment is successful
    print("Payment Successful: ${response.paymentId}");
    showOrderSuccessDialog(context, mainOrderId);
  }

  void _handlePaymentError(PaymentFailureResponse response) {
    // Handle payment error
    print("Payment Error: ${response.code} | ${response.message}");
  }

  void _handleExternalWallet(ExternalWalletResponse response) {
    // Handle external wallet payments
    print("External Wallet: ${response.walletName}");
  }

  void openCheckout( String orderId, String setFinalValue) async{
    final result = await viewModel.accountLoginData();
    final userMobile = result['mobile'];
    final userEmail = result['email'];
    final userFullName = result['fullname'];
    double total = double.parse(setFinalValue);
    total =total * 100;
    var options = {
      'key': AppConstants.razorpayKey, // Replace with your Razorpay API key
      'amount': total, // Amount in the smallest currency unit (e.g., 50000 for ₹500.00)
    "currency": "INR",
    "send_sms_hash": true,
    "allow_rotation": false,
      'name': userFullName,
      "reference_id" : orderId,
      'description': 'Payment Order no. $orderId',
      'prefill': {
        'contact': userMobile,
        'email': userEmail,
      },
      'external': {
        'wallets': ['paytm'],
      }
    };

    try {
      _razorpay.open(options);
    } catch (e) {
      print(e.toString());
    }
  }


  @override
  Widget build(BuildContext context) {
    final data =
        ModalRoute.of(context)?.settings.arguments as Map<String, dynamic>?;
    customerAddressId = data?['customerAddressId'];
    discountString = data?['discountString'];
    couponString = data?['couponString'];
    buyNowString = data?['buyNowString'];

    //_fetchCustomerAddress(customerAddressId);

    return Scaffold(
      appBar: const TopBarDetail(title: AppStrings.checkoutFirstCaps),
      backgroundColor: AppColors.fabbyBack,
      body: Padding(
        padding: const EdgeInsets.all(10.0),
        child: SingleChildScrollView(child: Consumer<MemberPaymentViewmodel>(
          builder: (context, viewModel, child) {
            if (viewModel.loading) {
              return Center(
                child: LoadingAnimationWidget.staggeredDotsWave(
                    color: AppColors.fabbyBondiBlue, size: 50.0),
              );
            }
            final items =
                viewModel.customerAddressModel?.data?.customerAddress ?? [];
            final cartItems = viewModel.cartData?.data?.carts;
            final cartData = viewModel.cartData?.data;
            final totalValue = removeDecimalPoints(viewModel.cartData?.data?.subtotal ??"0");
            final orderValue = viewModel.cartData?.data?.subtotal.toString();

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
                Container(
                  width: double.infinity,
                  margin: const EdgeInsets.only(
                      left: 10.0, right: 10.0, bottom: 20.0, top: 10.0),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(5.0),
                    border: Border.all(
                      color: AppColors.lightBlueFabby,
                      width: 1.5,
                    ),
                  ),
                  child: Column(
                    children: [
                      Container(
                        margin: const EdgeInsets.symmetric(
                            horizontal: 10.0, vertical: 10.0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            TextUtils.display(
                              AppStrings.contact,
                              fontFamily: 'DMSerifDisplay',
                              fontSize: 16.0,
                              color: AppColors.productDetailText,
                            ),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                // Mobile Text
                                SizedBox(
                                  width: 200.0,
                                  child: TextUtils.display(
                                      items[0].mobileNumber ?? "",
                                      fontFamily: 'Poppins',
                                      fontSize: 15.0,
                                      color: AppColors.removeTextColor,
                                      maxLines: 1),
                                ),
                                const SizedBox(height: 10.0),
                                // Email Text
                                SizedBox(
                                  width: 200.0,
                                  child: TextUtils.display(items[0].email ?? "",
                                      fontFamily: 'Poppins',
                                      fontSize: 15.0,
                                      color: AppColors.removeTextColor,
                                      maxLines: 1),
                                ),
                              ],
                            ),
                            GestureDetector(
                              onTap: () {
                                _showEditAddressSheet(
                                    context, num.parse(customerAddressId));
                              },
                              child: TextUtils.display(AppStrings.changeNew,
                                  fontFamily: 'DMSerifDisplay',
                                  fontSize: 16.0,
                                  color: AppColors.removeTextColor,
                                  decoration: TextDecoration.underline),
                            ),
                          ],
                        ),
                      ),
                      Container(
                        width: double.infinity,
                        // Equivalent to match_parent
                        height: 1.0,
                        // Equivalent to 1dp height
                        margin: const EdgeInsets.fromLTRB(10.0, 0.0, 10.0, 0.0),
                        // Equivalent to layout_marginStart, layout_marginTop, layout_marginEnd
                        color: AppColors
                            .fabbyBondiBlue, // Equivalent to android:background="@color/white"
                      ),
                      Container(
                        margin: const EdgeInsets.symmetric(
                            horizontal: 10.0, vertical: 10.0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            TextUtils.display(AppStrings.shipToSmall,
                                fontFamily: 'DMSerifDisplay',
                                fontSize: 16.0,
                                color: AppColors.productDetailText),
                            SizedBox(
                              width: 200.0,
                              child: TextUtils.display(items[0].location ?? "",
                                  fontFamily: 'Poppins',
                                  fontSize: 15.0,
                                  color: AppColors.removeTextColor,
                                  maxLines: 1),
                            ),
                            GestureDetector(
                              onTap: () {
                                _showEditAddressSheet(
                                    context, num.parse(customerAddressId));
                              },
                              child: TextUtils.display(AppStrings.changeNew,
                                  fontFamily: 'DMSerifDisplay',
                                  fontSize: 16.0,
                                  color: AppColors.removeTextColor,
                                  decoration: TextDecoration.underline),
                            ),
                          ],
                        ),
                      ),
                      Container(
                        width: double.infinity,
                        // Equivalent to match_parent
                        height: 1.0,
                        // Equivalent to 1dp height
                        margin: const EdgeInsets.fromLTRB(10.0, 0.0, 10.0, 0.0),
                        // Equivalent to layout_marginStart, layout_marginTop, layout_marginEnd
                        color: AppColors
                            .fabbyBondiBlue, // Equivalent to android:background="@color/white"
                      ),
                      Container(
                        margin: const EdgeInsets.symmetric(
                            horizontal: 10.0, vertical: 10.0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            TextUtils.display(AppStrings.method,
                                fontFamily: 'DMSerifDisplay',
                                fontSize: 16.0,
                                color: AppColors.productDetailText),
                            Container(
                              child: TextUtils.display(
                                setTextColorForSubstring(
                                    fullText: originalText,
                                    targetText: targetText,
                                    color: AppColors.sortTextColor),
                                fontFamily: 'Poppins',
                                fontSize: 15.0,
                                color: AppColors.removeTextColor,
                              ),
                            ),
                            TextUtils.display(
                              "              ",
                              fontFamily: 'DMSerifDisplay',
                              fontSize: 16.0,
                              color: AppColors.removeTextColor,
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
                Row(
                  children: [
                    Container(
                      margin: const EdgeInsets.only(
                          left: 10.0, right: 10.0, top: 10.0),
                      child: TextUtils.display(
                        AppStrings.payment,
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
                        AppStrings.effortlessCheckoutWithVariousPaymentOptions,
                        fontFamily: 'Poppins',
                        fontWeight: FontWeight.normal,
                        fontSize: 13,
                        color: AppColors.sortTextColor,
                      ),
                    ),
                  ],
                ),
                Container(
                  margin: const EdgeInsets.only(top: 10.0),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(5.0),
                    border: Border.all(
                      color: AppColors.lightBlueFabby,
                      width: 1.5,
                    ),
                  ),
                  child: Column(
                    children: [
                      // Online Payment Section
                      Container(
                        padding: const EdgeInsets.symmetric(vertical: 10.0),
                        decoration: _isOnlinePaymentSelected
                            ? BoxDecoration(
                                color: AppColors.lightBlueFabby,
                                borderRadius: BorderRadius.circular(4.0),
                                border: Border.all(
                                  color: AppColors.lightBlueFabby,
                                  width: 1.5,
                                ),
                              )
                            : null, // No decoration if not selected
                        child: Row(
                          children: [
                            Padding(
                              padding: const EdgeInsets.only(left: 20.0),
                              child: GestureDetector(
                                onTap: () {
                                  setState(() {
                                    paymentMethod="card";
                                    _isOnlinePaymentSelected = true;
                                    _isCodSelected =
                                        false; // Deselect COD if online payment is selected
                                  });
                                },
                                child: SvgImage.asset(
                                  _isOnlinePaymentSelected
                                      ? 'assets/payment_selected.svg'
                                      : 'assets/payment_unselected.svg',
                                  width: 20.0,
                                  height: 20.0,
                                ),
                              ),
                            ),
                            const SizedBox(width: 20.0),
                            Expanded(
                              child: Align(
                                alignment: Alignment.centerLeft,
                                child: TextUtils.displayLargeText(
                                  AppStrings.razorpayUpi,
                                  fontFamily: 'Poppins',
                                  fontSize: 14.0,
                                ),
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(right: 20.0),
                              child: PngImage.asset(
                                'assets/checkout_pay_image.png',
                                width: 120.0,
                              ),
                            ),
                          ],
                        ),
                      ),
                      // Cash on Delivery (COD) Section
                      Container(
                        padding: const EdgeInsets.symmetric(vertical: 10.0),
                        decoration: _isCodSelected
                            ? BoxDecoration(
                                color: AppColors.lightBlueFabby,
                                borderRadius: BorderRadius.circular(4.0),
                                border: Border.all(
                                  color: AppColors.lightBlueFabby,
                                  width: 1.5,
                                ),
                              )
                            : null, // No decoration if not selected
                        child: Row(
                          children: [
                            Padding(
                              padding: const EdgeInsets.only(left: 20.0),
                              child: GestureDetector(
                                onTap: () {
                                  setState(() {
                                    paymentMethod="cash";
                                    _isCodSelected = true;
                                    _isOnlinePaymentSelected =
                                        false; // Deselect online payment if COD is selected
                                  });
                                },
                                child: SvgImage.asset(
                                  _isCodSelected
                                      ? 'assets/payment_selected.svg'
                                      : 'assets/payment_unselected.svg',
                                  width: 20.0,
                                  height: 20.0,
                                ),
                              ),
                            ),
                            const SizedBox(width: 10.0),
                            Expanded(
                              child: Align(
                                alignment: Alignment.centerLeft,
                                child: TextUtils.displayLargeText(
                                  AppStrings.cashOnDeliveryCod,
                                  fontFamily: 'Poppins',
                                  fontSize: 14.0,
                                ),
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(right: 20.0),
                              child: Opacity(
                                opacity: _isCodSelected ? 0.0 : 0.0,
                                child: PngImage.asset(
                                  'assets/checkout_pay_image.png',
                                  width: 120.0,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
                Row(
                  children: [
                    Container(
                      margin: const EdgeInsets.only(
                          left: 10.0, right: 10.0, top: 10.0),
                      child: TextUtils.display(
                        AppStrings.billingAddress,
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
                    Expanded(
                      child: Container(
                        margin: const EdgeInsets.only(
                            left: 10.0, right: 10.0, top: 10.0),
                        child: TextUtils.displayLargeText(
                          AppStrings
                              .selectTheAddressThatMatchesYourCardOrPaymentMethod,
                          fontFamily: 'Poppins',
                          fontWeight: FontWeight.normal,
                          fontSize: 13,
                          color: AppColors.sortTextColor,
                        ),
                      ),
                    ),
                  ],
                ),
                Container(
                  margin: const EdgeInsets.only(top: 10.0),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(5.0),
                    border: Border.all(
                      color: AppColors.lightBlueFabby,
                      width: 1.5,
                    ),
                  ),
                  child: Column(
                    children: [
                      // Online Payment Section
                      Container(
                        padding: const EdgeInsets.symmetric(vertical: 10.0),
                        decoration: _isSameAddress
                            ? BoxDecoration(
                                color: AppColors.lightBlueFabby,
                                borderRadius: BorderRadius.circular(4.0),
                                border: Border.all(
                                  color: AppColors.lightBlueFabby,
                                  width: 1.5,
                                ),
                              )
                            : null, // No decoration if not selected
                        child: Row(
                          children: [
                            Padding(
                              padding: const EdgeInsets.only(left: 20.0),
                              child: GestureDetector(
                                onTap: () {
                                  setState(() {
                                    _isSameAddress = true;
                                    _isDifferentAddress =
                                        false; // Deselect COD if online payment is selected
                                  });
                                },
                                child: SvgImage.asset(
                                  _isSameAddress
                                      ? 'assets/payment_selected.svg'
                                      : 'assets/payment_unselected.svg',
                                  width: 20.0,
                                  height: 20.0,
                                ),
                              ),
                            ),
                            const SizedBox(width: 20.0),
                            Expanded(
                              child: Align(
                                alignment: Alignment.centerLeft,
                                child: TextUtils.displayLargeText(
                                  AppStrings.sameAsShippingAddress,
                                  fontFamily: 'Poppins',
                                  fontSize: 14.0,
                                ),
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(right: 20.0),
                              child: Opacity(
                                opacity: _isDifferentAddress ? 0.0 : 0.0,
                                child: PngImage.asset(
                                  'assets/checkout_pay_image.png',
                                  width: 120.0,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                      // Cash on Delivery (COD) Section
                      Container(
                        padding: const EdgeInsets.symmetric(vertical: 10.0),
                        decoration: _isDifferentAddress
                            ? BoxDecoration(
                                color: AppColors.lightBlueFabby,
                                borderRadius: BorderRadius.circular(4.0),
                                border: Border.all(
                                  color: AppColors.lightBlueFabby,
                                  width: 1.5,
                                ),
                              )
                            : null, // No decoration if not selected
                        child: Row(
                          children: [
                            Padding(
                              padding: const EdgeInsets.only(left: 20.0),
                              child: GestureDetector(
                                onTap: () {
                                  setState(() {
                                    _isSameAddress = false;
                                    _isDifferentAddress =
                                        true; // Deselect online payment if COD is selected
                                  });
                                },
                                child: GestureDetector(
                                  onTap: () {
                                    _showAddNewAddressSheet(context);
                                  },
                                  child: SvgImage.asset(
                                    _isDifferentAddress
                                        ? 'assets/payment_selected.svg'
                                        : 'assets/payment_unselected.svg',
                                    width: 20.0,
                                    height: 20.0,
                                  ),
                                ),
                              ),
                            ),
                            const SizedBox(width: 10.0),
                            Expanded(
                              child: Align(
                                alignment: Alignment.centerLeft,
                                child: TextUtils.displayLargeText(
                                  AppStrings.useADifferentBillingAddress,
                                  fontFamily: 'Poppins',
                                  fontSize: 14.0,
                                ),
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(right: 20.0),
                              child: Opacity(
                                opacity: _isDifferentAddress ? 0.0 : 0.0,
                                child: PngImage.asset(
                                  'assets/checkout_pay_image.png',
                                  width: 120.0,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),

                    ],
                  ),
                ),
                Container(
                  margin: const EdgeInsets.only(top: 10.0),
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
                              discountString,
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
                              setTotalValue(removeDecimalPoints(cartData?.subtotal ?? "0"),discountString),
                              fontFamily: 'DmSerifDisplay',
                              fontWeight: FontWeight.normal,
                              fontSize: 14,
                              color: AppColors.sortTextColor,
                            ),
                          ],
                        ),
                      ),
                      GestureDetector(onTap: () async{
                        String mainId = await viewModel.getMainId();
                        String? guestId = await viewModel.getGuestId();
                        if(paymentMethod == "card"){
                            if(customerAddressId.isNotEmpty){
                              final requestBody = {
                                'buy_now': buyNowString,
                                'coupon_code': couponString,
                                'customer_address_id': customerAddressId,
                                'device_type': " ",
                                'final_total': setFinalValue(removeDecimalPoints(cartData?.subtotal ?? "0"),discountString),
                                'guest_id': guestId,
                                'order_amount': orderValue,
                                'paymentMethod': paymentMethod,
                                'payment_orderReference': "",
                                'shipping_charges': AppConstants.cartRemoveSingleCartCount.toString(),
                                'store_id': AppConstants.storeId,
                                'tax': AppConstants.cartRemoveSingleCartCount,
                                'user_id': mainId,
                              };
                             await viewModel.placeOrder(requestBody);
                              if(viewModel.placeOrderModelNew?.success == true){
                                final orderId = viewModel.placeOrderModelNew?.data.orderId.toString() ?? ""; // Use null-aware operator
                                mainOrderId=orderId;
                                if (orderId.isNotEmpty) {
                                  openCheckout(orderId,setFinalValue(removeDecimalPoints(cartData?.subtotal ?? "0"),discountString)); // Only call if orderId is not empty
                                }
                              }else{
                                SnackbarService.showErrorSnackbar(context, "Something went wrong!");
                              }
                            }else{
                              SnackbarService.showErrorSnackbar(context, "please select Address");
                            }
                        }else{
                          if(customerAddressId.isNotEmpty){
                            final requestBody = {
                              'buy_now': buyNowString,
                              'coupon_code': couponString,
                              'customer_address_id': customerAddressId,
                              'device_type': " ",
                              'final_total': setFinalValue(removeDecimalPoints(cartData?.subtotal ?? "0"),discountString),
                              'guest_id': guestId,
                              'order_amount': orderValue,
                              'paymentMethod': paymentMethod,
                              'payment_orderReference': "",
                              'shipping_charges': AppConstants.cartRemoveSingleCartCount.toString(),
                              'store_id': AppConstants.storeId,
                              'tax': AppConstants.cartRemoveSingleCartCount,
                              'user_id': mainId,
                            };
                            await viewModel.placeOrder(requestBody);
                            if(viewModel.placeOrderModelNew?.success == true){
                              showOrderSuccessDialog(context,viewModel.placeOrderModelNew?.data.orderId.toString() ?? "");
                            }else{
                              SnackbarService.showErrorSnackbar(context, "Something went wrong!");
                            }
                          }else{
                            SnackbarService.showErrorSnackbar(context, "please select Address");
                          }
                        }
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
                                AppStrings.payNow,
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
            );
          },
        )),
      ),
    );
  }
}
