import 'package:flutter/material.dart';
import 'package:flutter_fabby_demo/utils/image_utils.dart';
// Required for SVG support

class SortAndFilterDropdown {
  final BuildContext context;
  final Widget partnerView;
  final String result;
  final int productId;
  final OnAdapterItemClickListener itemClick;

  SortAndFilterDropdown({
    required this.context,
    required this.partnerView,
    required this.result,
    required this.productId,
    required this.itemClick,
  });

  // Show the sort dropdown
  void showSortDropdown() {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              _buildSortOption("All Products", Constants.allProductSort),
              _buildSortOption("High to Low", Constants.highToLowSort),
              _buildSortOption("Low to High", Constants.lowToHighSort),
              _buildSortOption("A to Z", Constants.aToZSort),
              _buildSortOption("Z to A", Constants.zToASort),
            ],
          ),
        );
      },
    );
  }

  Widget _buildSortOption(String label, String sortOption) {
    final color = result == sortOption ? Colors.grey[300] : Colors.transparent;
    return InkWell(
      onTap: () {
        itemClick.onClick(sortOption,productId);
        Navigator.of(context).pop();
      },
      child: Container(
        color: color,
        padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 20),
        child: Text(label),
      ),
    );
  }

  // Show the share dropdown
  void showShareDropdown() {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          content: Row(
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              _buildShareOption('assets/whatsapp.svg', Constants.whatsApp),
              _buildShareOption('assets/facebook_menu.svg', Constants.faceBook),
              _buildShareOption('assets/twitter_icon.svg', Constants.twitter),
              _buildShareOption('assets/instagram_menu.svg', Constants.instagram),
              _buildShareOption('assets/share_icon_menu.svg', Constants.share),
            ],
          ),
        );
      },
    );
  }

  Widget _buildShareOption(String assetPath, int option) {
    return IconButton(
      icon: SvgImage.asset(assetPath, width: 24, height: 24),
      onPressed: () {
        itemClick.onClick(option.toString(),productId);
        Navigator.of(context).pop();
      },
    );
  }
}

// Helper interface to handle item clicks
abstract class OnAdapterItemClickListener {
  void onClick(String sortOption,int productId);
}

class Constants {
  static const String allProductSort = 'all_product';
  static const String highToLowSort = 'high_to_low';
  static const String lowToHighSort = 'low_to_high';
  static const String aToZSort = 'a_to_z';
  static const String zToASort = 'z_to_a';

  static const int whatsApp = 80;
  static const int faceBook = 81;
  static const int twitter = 83;
  static const int instagram = 82;
  static const int share = 84;
  static const int dismiss = 85;
}
