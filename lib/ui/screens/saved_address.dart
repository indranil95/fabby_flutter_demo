
import 'package:flutter/material.dart';
import 'package:flutter_fabby_demo/ui/screens/top_bar_detail.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';
import 'package:provider/provider.dart';

import '../../colors/colors.dart';
import '../../strings/strings.dart';
import '../../utils/logger_service.dart';
import '../../utils/snackbar_utils.dart';
import '../../utils/text_utils.dart';
import '../../viewModels/member_checkout_viewModel.dart';
import '../dialog/add_new_address_sheet.dart';
import '../dialog/address_update_dialog.dart';
import '../dialog/custom_dialog.dart';
import '../lists/saved_address_list.dart';

class SavedAddressScreen extends StatefulWidget {
  const SavedAddressScreen({super.key});
  @override
  _SavedAddressScreenState createState() => _SavedAddressScreenState();
}

class _SavedAddressScreenState extends State<SavedAddressScreen> {
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
    super.initState();
    viewModel = Provider.of<MemberCheckoutViewModel>(context, listen: false);
    _fetchCheckoutData();
  }

  Future<void> _fetchCheckoutData() async {
    String? guestId = await viewModel.getGuestId();

    final requestBody = {
      'guest_id': guestId, // Handle the case where guestId is null
    };

    viewModel.checkout(requestBody);
  }

  @override
  Widget build(BuildContext context) {
    final data = ModalRoute.of(context)?.settings.arguments as Map<String, dynamic>?;

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
            return Column(
              children: [
                Column(
                  children: [
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
                              fontFamily: 'DmSerifDisplay',
                              fontSize: 15,
                              color: AppColors.sortTextColor,
                            ),
                          ),
                        ],
                      ),
                    ),
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
                                child: SavedAddressList(
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
                                  onItemSelected: (int index) async {
                                    LoggerService.d(
                                        'plus clicked at index: $index');
                                    final item = items[index];
                                    // customerAddressId=item.id.toString();
                                  },
                                ),
                              ),
                            )
                          ],
                        )),
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