import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_fabby_demo/colors/colors.dart';
import 'package:flutter_fabby_demo/strings/strings.dart';
import 'package:flutter_fabby_demo/ui/screens/top_bar_detail.dart';
import 'package:flutter_fabby_demo/utils/text_utils.dart';
import 'package:flutter_phone_direct_caller/flutter_phone_direct_caller.dart';
import 'package:url_launcher/url_launcher.dart';

import '../../utils/email_sender.dart';
import '../../utils/image_utils.dart';

class ContactUs extends StatefulWidget {
  const ContactUs({super.key});

  @override
  _MyFormState createState() => _MyFormState();
}

class _MyFormState extends State<ContactUs> {
  late TextEditingController _controller;

  Future<void> launchMap(String address) async {
    final String query = Uri.encodeComponent(address);
    final Uri mapUri = Uri.parse("geo:0,0?q=$query");

    try {
      if (await canLaunchUrl(mapUri)) {
        await launchUrl(mapUri);
      } else {
        // Handle the case where no app can handle the URL
        if (kDebugMode) {
          print('Could not launch URL: $mapUri');
        }
      }
    } catch (e) {
      // Handle exceptions
      if (kDebugMode) {
        print('Exception: ${e.toString()}');
      }
    }
  }

  @override
  void initState() {
    super.initState();
    // Initialize the controller with an initial value
    _controller = TextEditingController();
  }

  @override
  void dispose() {
    _controller.dispose(); // Dispose of the controller when not needed
    super.dispose();
  }

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
                        onTap: () async {
                          await FlutterPhoneDirectCaller.callNumber(
                              "7777060333");
                          //makePhoneCall(AppStrings.clientMobile);
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
                          EmailSender.openGmail(AppStrings.dumMail);
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
                          launchMap(
                              AppStrings.fabbyFureverPrivateLimitedAddress);
                          if (kDebugMode) {
                            print('Map container tapped');
                          }
                        },
                        child: Container(
                          margin:
                              const EdgeInsets.only(left: 20.0, right: 20.0),
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
                      ),
                      SizedBox(
                        width: double.infinity,
                        child: Card(
                          color: AppColors.white,
                          child: Padding(
                            padding: const EdgeInsets.all(10.0),
                            child: Column(
                              children: [
                                TextUtils.editableTextWithValue(
                                  controller: _controller,
                                  initialValue: 'Initial text value',
                                  fontSize: 16.0,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.blue,
                                  textAlign: TextAlign.left,
                                  maxLines: 2,
                                  fontFamily: 'Arial',
                                  obscureText: false,
                                  keyboardType: TextInputType.text,
                                ),
                              ],
                            ),
                          ),
                        ),
                      )
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
}
