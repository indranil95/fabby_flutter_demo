import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_fabby_demo/colors/colors.dart';
import 'package:flutter_fabby_demo/strings/strings.dart';
import 'package:flutter_fabby_demo/ui/screens/top_bar_detail.dart';
import 'package:flutter_fabby_demo/utils/text_utils.dart';
import 'package:url_launcher/url_launcher.dart';

import '../../utils/image_utils.dart';

class ContactUs extends StatelessWidget {
  const ContactUs({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const TopBarDetail(title: AppStrings.contactUs),
      body: Padding(
        padding: const EdgeInsets.all(10.0),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  TextUtils.displayLargeText(
                    AppStrings.getInTouch,
                    fontSize: 20.0,
                    color: AppColors.subTextColot,
                    fontFamily: 'DmSerifDisplay',
                    fontWeight: FontWeight.w300,
                    textAlign: TextAlign.start,
                  ),
                ],
              ),
              const SizedBox(height: 10.0),
              SizedBox(
                width: double.infinity,
                child: Card(
                  color: AppColors.cardBackColor,
                  child: Column(
                    children: [
                      const SizedBox(height: 20.0),
                      GestureDetector(
                        onTap: () {
                          makePhoneCall(AppStrings.clientMobile);
                          if (kDebugMode) {
                            print('Phone call container tapped');
                          }
                        },
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            SvgImage.asset('assets/calling.svg'),
                            const SizedBox(width: 20.0),
                            TextUtils.displayLargeText(
                              AppStrings.dumMobile,
                              fontSize: 15.0,
                              color: AppColors.white,
                              fontFamily: 'Poppins',
                              fontWeight: FontWeight.normal,
                              textAlign: TextAlign.start,
                            ),
                          ],
                        ),
                      ),
                      const SizedBox(height: 20.0),
                      GestureDetector(
                        onTap: () {
                          openEmailApp(AppStrings.dumMail);
                          if (kDebugMode) {
                            print('Email container tapped');
                          }
                        },
                        child: Container(
                          margin: const EdgeInsets.symmetric(horizontal: 20.0),
                          padding: const EdgeInsets.all(8.0),
                          decoration: BoxDecoration(
                            border: Border.all(
                              color: AppColors.fabbyBondiBlue,
                              width: 1.0,
                            ),
                            borderRadius: BorderRadius.circular(8.0),
                          ),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              SvgImage.asset('assets/message.svg'),
                              const SizedBox(width: 20.0),
                              TextUtils.displayLargeText(
                                AppStrings.dumMail,
                                fontSize: 15.0,
                                color: AppColors.white,
                                fontFamily: 'Poppins',
                                fontWeight: FontWeight.normal,
                                textAlign: TextAlign.start,
                              ),
                            ],
                          ),
                        ),
                      ),
                      const SizedBox(height: 20.0),
                      GestureDetector(
                        onTap: () {
                          openMap();
                          if (kDebugMode) {
                            print('Map container tapped');
                          }
                        },
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            SvgImage.asset('assets/location.svg'),
                            const SizedBox(width: 20.0),
                            Expanded(
                              child: TextUtils.displayLargeText(
                                AppStrings.fabbyFureverPrivateLimitedAddress,
                                fontSize: 15.0,
                                color: AppColors.white,
                                fontFamily: 'Poppins',
                                fontWeight: FontWeight.normal,
                                textAlign: TextAlign.start,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Future<void> openEmailApp(String recipientEmail) async {
    final Uri emailUri = Uri(
      scheme: 'mailto',
      path: recipientEmail,
    );

    try {
      if (await canLaunchUrl(emailUri)) {
        await launchUrl(emailUri);
      } else {
        if (kDebugMode) {
          print('No email clients installed.');
        }
      }
    } catch (e) {
      if (kDebugMode) {
        print('Error: $e');
      }
    }
  }

  void makePhoneCall(String phoneNumber) async {
    phoneNumber = phoneNumber.replaceAll(RegExp(r'[() \-]'), '');
    final Uri phoneUri = Uri(scheme: 'tel', path: phoneNumber);

    try {
      if (await canLaunchUrl(phoneUri)) {
        await launchUrl(phoneUri);
      } else {
        if (kDebugMode) {
          print('Could not launch phone app');
        }
      }
    } catch (e) {
      if (kDebugMode) {
        print('Exception: ${e.toString()}');
      }
    }
  }

  void openMap() async {
    const String address = AppStrings.fabbyFureverPrivateLimitedAddress;
    final Uri mapUri = Uri.parse("geo:0,0?q=${Uri.encodeComponent(address)}");

    try {
      if (await canLaunchUrl(mapUri)) {
        await launchUrl(mapUri);
      } else {
        if (kDebugMode) {
          print('Could not open map');
        }
      }
    } catch (e) {
      if (kDebugMode) {
        print('Exception: ${e.toString()}');
      }
    }
  }
}
