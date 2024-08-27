import 'package:flutter/material.dart';
import 'package:flutter_fabby_demo/colors/colors.dart';

import '../../utils/text_utils.dart';

class PersistentBottomSheetWidget {
  static void showPersistentBottomSheet(BuildContext context, String errorMessage) {
    Scaffold.of(context).showBottomSheet(
          (BuildContext context) {
        return Container(
          padding: const EdgeInsets.all(16.0),
          child: Center(
            child: TextUtils.display(
              errorMessage,
              fontSize: 15.0,
              color: AppColors.fabbyBondiBlue,
              fontFamily: 'DmSerifDisplay',
              fontWeight: FontWeight.w300,
              textAlign: TextAlign.center,
            ),
          ),
        );
      },
    );
  }
}

