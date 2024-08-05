// lib/widgets/top_bar.dart

import 'package:flutter/material.dart';

import '../../colors/colors.dart';
import '../../utils/text_utils.dart';

class TopBarDetail extends StatelessWidget implements PreferredSizeWidget {
  final String title;

  const TopBarDetail({super.key, required this.title});

  @override
  Widget build(BuildContext context) {
    return AppBar(
      leading: IconButton(
        icon: const Icon(Icons.arrow_back,color: AppColors.fabbyBondiBlue,size: 18.0,),
        onPressed: () {
          Navigator.of(context).pop(); // Go back to the previous screen
        },
      ),
      title: TextUtils.display(
        title,
        fontSize: 18.0, // Increased fontSize for larger text
        color: AppColors.fabbyBondiBlue,
        fontFamily: 'Poppins',
        fontWeight: FontWeight.w600,
        textAlign: TextAlign.center, // Center the text

      ),
      centerTitle: true,
      backgroundColor: AppColors.white,
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}
