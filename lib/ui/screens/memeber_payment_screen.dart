import 'package:flutter/material.dart';
import 'package:flutter_fabby_demo/ui/screens/top_bar_detail.dart';
import 'package:flutter_fabby_demo/utils/image_utils.dart';
import 'package:flutter_fabby_demo/viewModels/member_payment_viewmodel.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';
import 'package:provider/provider.dart';

import '../../colors/colors.dart';
import '../../strings/strings.dart';
import '../../utils/logger_service.dart';
import '../../utils/snackbar_utils.dart';
import '../../utils/text_utils.dart';
import '../dialog/add_new_address_sheet.dart';
import '../dialog/address_update_dialog.dart';
import '../dialog/edit_address_sheet.dart';

class MemberPaymentScreen extends StatefulWidget {
  const MemberPaymentScreen({super.key});

  @override
  _MemberPaymentScreenState createState() => _MemberPaymentScreenState();
}

class _MemberPaymentScreenState extends State<MemberPaymentScreen> {
  late MemberPaymentViewmodel viewModel;
  bool _isOnlinePaymentSelected = true;
  bool _isCodSelected = false;
  bool _isSameAddress = true;
  bool _isDifferentAddress = false;

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
      LoggerService.d('Request Body: $result');
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
      LoggerService.d('Request Body: $result');
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
    viewModel = Provider.of<MemberPaymentViewmodel>(context, listen: false);
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
              ],
            );
          },
        )),
      ),
    );
  }
}
