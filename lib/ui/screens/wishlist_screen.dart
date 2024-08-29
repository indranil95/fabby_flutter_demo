import 'dart:core';

import 'package:flutter/material.dart';
import 'package:flutter_fabby_demo/colors/colors.dart';
import 'package:flutter_fabby_demo/models/wishlist_model.dart';
import 'package:flutter_fabby_demo/ui/lists/wishlist_list.dart';
import 'package:flutter_fabby_demo/ui/screens/top_bar_detail.dart';
import 'package:flutter_fabby_demo/utils/image_utils.dart';
import 'package:flutter_fabby_demo/utils/logger_service.dart';
import 'package:flutter_fabby_demo/utils/text_utils.dart';
import 'package:flutter_fabby_demo/viewModels/wishlist_viewmodel.dart';
import 'package:provider/provider.dart';

import '../../strings/strings.dart';

class WishListScreen extends StatefulWidget {
  const WishListScreen({super.key});

  @override
  _WishListScreenState createState() => _WishListScreenState();
}

class _WishListScreenState extends State<WishListScreen> {
  late WishlistViewModel viewModel;

  @override
  void initState() {
    viewModel = Provider.of<WishlistViewModel>(context, listen: false);
    _fetchWishlist();
    super.initState();
  }

  Future<void> _fetchWishlist() async {
    // Fetch mainId and guestId asynchronously
    String mainId = await viewModel.getMainId();
    String? guestId = await viewModel.getGuestId();

    final requestBody = {
      'userid': mainId,
      'guestid': guestId ?? "", // Handle the case where guestId is null
    };

    viewModel.wishlist(requestBody);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const TopBarDetail(title: AppStrings.wishlist),
      backgroundColor: AppColors.fabbyBack,
      body: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Consumer<WishlistViewModel>(
          builder: (context, viewModel, child) {
            final items = viewModel.wishListData?.data;
            return Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: Row(
                    children: [
                      SvgImage.asset('assets/light_pink_border.svg',
                          width: 16.0, height: 16.0),
                      const SizedBox(
                        width: 10.0,
                      ),
                      TextUtils.display(
                        "0/0 items Selected",
                        fontSize: 14.0,
                        // Increased fontSize for larger text
                        color: AppColors.sortTextColor,
                        fontFamily: 'Poppins',
                        fontWeight: FontWeight.normal,
                        textAlign: TextAlign.center, // Center the text
                      ),
                      const Spacer(),
                      // Pushes the next container to the end of the Row
                      Container(
                        alignment: Alignment.centerRight,
                        child: Row(
                          children: [
                            SvgImage.asset(
                                'assets/wishlist_add_to_cart_icon.svg',
                                width: 35.0,
                                height: 35.0),
                            const SizedBox(width: 10.0),
                            SvgImage.asset('assets/delete_icon_wishlist.svg',
                                width: 35.0, height: 35.0),
                          ],
                        ),
                      )
                    ],
                  ),
                ),
                WishListList(
                  items: items as List<Data>,
                  onMoveToCart: (int index) {
                    // Handle move to cart action here
                    LoggerService.d('Move to Cart clicked at index: $index');
                  },
                  onDelete: (int index) {
                    // Handle delete action here
                    LoggerService.d('Delete clicked at index: $index');
                  },
                  onTick: (int index) {
                    // Handle tick action here
                    LoggerService.d('Tick clicked at index: $index');
                  },
                )
              ],
            );
          },
        ),
      ),
    );
  }
}
