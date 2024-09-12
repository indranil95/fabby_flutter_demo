import 'package:flutter/material.dart';
import 'package:flutter_fabby_demo/ui/screens/top_bar_detail.dart';
import 'package:flutter_fabby_demo/utils/text_utils.dart';

import '../../colors/colors.dart';
import '../../strings/strings.dart';

class MemberCheckoutScreen extends StatefulWidget {
  const MemberCheckoutScreen({super.key});

  @override
  _MemberCheckoutScreenState createState() => _MemberCheckoutScreenState();
}

class _MemberCheckoutScreenState extends State<MemberCheckoutScreen> {
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      appBar: TopBarDetail(title: AppStrings.checkoutFirstCaps),
      backgroundColor: AppColors.fabbyBack,
      body: Padding(
          padding: EdgeInsets.all(10.0),
          child: SingleChildScrollView(
            child: Column(
              children: [
                Row(
                  children: [
                    Container(
                      margin: EdgeInsets.only(left: 10.0, right: 10.0),
                      child: TextUtils.display(
                        'Read More',
                          fontFamily: 'Poppins',
                          fontWeight: FontWeight.w600,
                          fontSize: 12,
                          color: AppColors.cardBackColor,
                          decoration: TextDecoration.underline,),
                    ),
                  ],
                )
              ],
            ),
          )),
    );
  }
}
