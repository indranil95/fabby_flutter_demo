import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_fabby_demo/colors/colors.dart';
import 'package:flutter_fabby_demo/strings/strings.dart';
import 'package:flutter_fabby_demo/ui/dialog/custom_dialog.dart';
import 'package:flutter_fabby_demo/ui/screens/top_bar_detail.dart';
import 'package:flutter_fabby_demo/utils/logger_service.dart';
import 'package:flutter_fabby_demo/utils/text_utils.dart';
import 'package:flutter_fabby_demo/viewModels/contactus_viewmodel.dart';
import 'package:provider/provider.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:url_launcher/url_launcher_string.dart';

import '../../utils/custom_loader.dart';
import '../../utils/email_sender.dart';
import '../../utils/image_utils.dart';
import '../../utils/navigation_service.dart';
import 'dart:io';

class ContactUs extends StatefulWidget {
  const ContactUs({super.key});

  @override
  _MyFormState createState() => _MyFormState();
}

class _MyFormState extends State<ContactUs> {
  // Create separate controllers for each text field
  late TextEditingController _nameController;
  late TextEditingController _emailController;
  late TextEditingController _phoneController;
  late TextEditingController _messageController;
  late ContactUsViewModel viewModel;

  // Error messages and visibility flags for each text field
  String _nameError = "";
  String _emailError = "";
  String _phoneError = "";
  String _messageError = "";

  bool _showNameError = false;
  bool _showEmailError = false;
  bool _showPhoneError = false;
  bool _showMessageError = false;

  Future<void> launchMap(String address) async {
    Uri uri;
    final String query = Uri.encodeComponent(address);
    String googleUrl = "google.navigation:q=$query";
    Uri googleUri = Uri.parse(googleUrl);
    // Uri mapUri = Uri.parse("geo:0,0?q=$query");
    if (Platform.isAndroid) {
      uri = Uri.parse("geo:0,0?q=$query");
    } else {

      uri = Uri.parse("https://www.google.com/maps/search/Fabby+Furever+Private+Limited,+701,+Aryston+Centre,+Opp.+JW+Marriott+Hotel,+Juhu,+Mumbai+49/@19.1013038,72.8089442,14z?entry=ttu");
    }
    try {
      if (await canLaunchUrl(uri)) {
        await launchUrl(uri);
      } else {
        // Handle the case where no app can handle the URL
        if (kDebugMode) {
          print('Could not launch URL: $uri');
        }
      }
    } catch (e) {
      // Handle exceptions
      if (kDebugMode) {
        print('Exception: ${e.toString()}');
      }
    }
  }

  void launchInstagram() async {
    var nativeUrl = "instagram://user?username=FabbyFurever"; https://www.instagram.com/FabbyFurever/
    var webUrl = "https://www.instagram.com/FabbyFurever/";

    try {
      print("nativeUrl clicked");
      await launchUrlString(nativeUrl, mode: LaunchMode.externalApplication);
    } catch (e) {
      print(e);
      print("webUrl clicked");
      await launchUrlString(webUrl, mode: LaunchMode.platformDefault);
    }
  }

  void launchCaller() async {
    Uri phoneno = Uri.parse('tel:+917777060333');
    if (await launchUrl(phoneno)) {
      //dialer opened
    } else {
      //dailer is not opened
    }
  }

  @override
  void initState() {
    super.initState();
    viewModel = Provider.of<ContactUsViewModel>(context, listen: false);

    // Initialize the controllers
    _nameController = TextEditingController();
    _emailController = TextEditingController();
    _phoneController = TextEditingController();
    _messageController = TextEditingController();
    // Set up listeners for each controller
    _nameController.addListener(() {
      setState(() {
        if (_nameController.text.isEmpty) {
          _nameError = AppStrings.thisFieldIsRequired;
          _showNameError = true;
        } else {
          _nameError = "";
          _showNameError = false;
        }
      });
    });

    _emailController.addListener(() {
      setState(() {
        if (_emailController.text.isEmpty) {
          _emailError = AppStrings.thisFieldIsRequired;
          _showEmailError = true;
        } else if (!_isValidEmail(_emailController.text)) {
          _emailError = AppStrings.pleaseProvideValidEmail;
          _showEmailError = true;
        } else {
          _emailError = "";
          _showEmailError = false;
        }
      });
    });

    _phoneController.addListener(() {
      setState(() {
        if (_phoneController.text.isEmpty) {
          _phoneError = AppStrings.thisFieldIsRequired;
          _showPhoneError = true;
        } else if (!_isValidPhoneNumber(_phoneController.text)) {
          _phoneError = AppStrings.pleaseProvideValidPhone;
          _showPhoneError = true;
        } else {
          _phoneError = "";
          _showPhoneError = false;
        }
      });
    });

    _messageController.addListener(() {
      setState(() {
        if (_messageController.text.isEmpty) {
          _messageError = AppStrings.thisFieldIsRequired;
          _showMessageError = true;
        } else {
          _messageError = "";
          _showMessageError = false;
        }
      });
    });
  }

  @override
  void dispose() {
    // Dispose of controllers
    _nameController.dispose();
    _emailController.dispose();
    _phoneController.dispose();
    _messageController.dispose();
    super.dispose();
  }

  bool _isValidPhoneNumber(String phoneNumber) {
    final phoneNumberRegex =
    RegExp(r'^[0-9]{10}$'); // Example pattern for 10-digit numbers
    return phoneNumberRegex.hasMatch(phoneNumber);
  }

  bool _isValidEmail(String email) {
    final emailRegex = RegExp(
      r'^([a-zA-Z0-9._%+-]+)@([a-zA-Z0-9.-]+)\.([a-zA-Z]{2,})$',
      caseSensitive: false,
    );
    return emailRegex.hasMatch(email);
  }

  void showSimpleDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return CustomDialog(
          maxLines: 1,
          message: 'Form Submitted',
          onButtonPressed: () {
            NavigationService.goBack();
          },
          buttonText: 'ok', // Customize button text if needed
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: const TopBarDetail(title: AppStrings.contactUs),
        body: Consumer<ContactUsViewModel>(
            builder: (context, viewModel, child) {
              if (viewModel.loading) {
                return  const Center(child: CustomLoader());
              }

              return Padding(
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
                                  launchCaller();
                                  // await FlutterPhoneDirectCaller.callNumber(
                                  //     "7777060333");
                                  // //makePhoneCall(AppStrings.clientMobile);
                                  // if (kDebugMode) {
                                  //   print('Phone call container tapped');
                                  // }
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
                                  margin: const EdgeInsets.symmetric(
                                      horizontal: 20.0),
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
                                    crossAxisAlignment: CrossAxisAlignment
                                        .center,
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
                                      AppStrings
                                          .fabbyFureverPrivateLimitedAddress);
                                  if (kDebugMode) {
                                    print('Map container tapped');
                                  }
                                },
                                child: Container(
                                  margin:
                                  const EdgeInsets.only(
                                      left: 20.0, right: 20.0),
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    crossAxisAlignment: CrossAxisAlignment
                                        .center,
                                    children: [
                                      SvgImage.asset('assets/location.svg'),
                                      const SizedBox(width: 20.0),
                                      Expanded(
                                        child: TextUtils.displayLargeText(
                                          AppStrings
                                              .fabbyFureverPrivateLimitedAddress,
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
                              Container(
                                margin: const EdgeInsets.all(20.0),
                                width: double.infinity,
                                child: Card(
                                  color: AppColors.white,
                                  child: Padding(
                                    padding: const EdgeInsets.all(10.0),
                                    child: Column(
                                      children: [
                                        const SizedBox(height: 10.0),
                                        TextUtils.editableText(
                                          controller: _nameController,
                                          fontSize: 16.0,
                                          fontWeight: FontWeight.normal,
                                          color: AppColors.recentStroke,
                                          hintColor: AppColors.lightGray,
                                          textAlign: TextAlign.start,
                                          maxLines: 1,
                                          fontFamily: 'Poppins',
                                          hintText: AppStrings.yourName,
                                          contentPadding: const EdgeInsets
                                              .symmetric(
                                              vertical: 10.0, horizontal: 15.0),
                                        ),
                                        if (_showNameError)
                                          Container(
                                            padding: const EdgeInsets.only(
                                                left: 5.0),
                                            alignment: Alignment.topLeft,
                                            child: TextUtils.errorText(
                                              _nameError,
                                              fontSize: 15.0,
                                              fontWeight: FontWeight.normal,
                                              color: Colors.red,
                                              textAlign: TextAlign.start,
                                              maxLines: 1,
                                              fontFamily: 'Poppins',
                                            ),
                                          ),
                                        const SizedBox(height: 10.0),
                                        TextUtils.editableText(
                                          controller: _emailController,
                                          fontSize: 16.0,
                                          fontWeight: FontWeight.normal,
                                          color: AppColors.recentStroke,
                                          hintColor: AppColors.lightGray,
                                          textAlign: TextAlign.start,
                                          maxLines: 1,
                                          fontFamily: 'Poppins',
                                          hintText: AppStrings.yourEmail,
                                          contentPadding: const EdgeInsets
                                              .symmetric(
                                              vertical: 10.0, horizontal: 15.0),
                                        ),
                                        if (_showEmailError)
                                          Container(
                                            padding: const EdgeInsets.only(
                                                left: 5.0),
                                            alignment: Alignment.topLeft,
                                            child: TextUtils.errorText(
                                              _emailError,
                                              fontSize: 15.0,
                                              fontWeight: FontWeight.normal,
                                              color: Colors.red,
                                              textAlign: TextAlign.start,
                                              maxLines: 1,
                                              fontFamily: 'Poppins',
                                            ),
                                          ),
                                        const SizedBox(height: 10.0),
                                        TextUtils.editableText(
                                          controller: _phoneController,
                                          fontSize: 16.0,
                                          fontWeight: FontWeight.normal,
                                          color: AppColors.recentStroke,
                                          hintColor: AppColors.lightGray,
                                          textAlign: TextAlign.start,
                                          maxLines: 1,
                                          keyboardType: TextInputType.number,
                                          fontFamily: 'Poppins',
                                          hintText: AppStrings.phone,
                                          contentPadding: const EdgeInsets
                                              .symmetric(
                                              vertical: 10.0, horizontal: 15.0),
                                        ),
                                        if (_showPhoneError)
                                          Container(
                                            padding: const EdgeInsets.only(
                                                left: 5.0),
                                            alignment: Alignment.topLeft,
                                            child: TextUtils.errorText(
                                              _phoneError,
                                              fontSize: 15.0,
                                              fontWeight: FontWeight.normal,
                                              color: Colors.red,
                                              textAlign: TextAlign.start,
                                              maxLines: 1,
                                              fontFamily: 'Poppins',
                                            ),
                                          ),
                                        const SizedBox(height: 10.0),
                                        TextUtils.editableText(
                                          controller: _messageController,
                                          fontSize: 16.0,
                                          fontWeight: FontWeight.normal,
                                          color: AppColors.recentStroke,
                                          hintColor: AppColors.lightGray,
                                          textAlign: TextAlign.start,
                                          maxLines: 1,
                                          fontFamily: 'Poppins',
                                          hintText: AppStrings.yourMessages,
                                          contentPadding: const EdgeInsets
                                              .symmetric(
                                              vertical: 10.0, horizontal: 15.0),
                                        ),
                                        if (_showMessageError)
                                          Container(
                                            padding: const EdgeInsets.only(
                                                left: 5.0),
                                            alignment: Alignment.topLeft,
                                            child: TextUtils.errorText(
                                              _messageError,
                                              fontSize: 15.0,
                                              fontWeight: FontWeight.normal,
                                              color: Colors.red,
                                              textAlign: TextAlign.start,
                                              maxLines: 1,
                                              fontFamily: 'Poppins',
                                            ),
                                          ),
                                        const SizedBox(height: 10.0),
                                        GestureDetector(
                                          onTap: () async {
                                            // Reset error flags
                                            setState(() {
                                              _showNameError = false;
                                              _showEmailError = false;
                                              _showPhoneError = false;
                                              _showMessageError = false;
                                            });
                                            if (_nameController.text
                                                .isNotEmpty &&
                                                _emailController.text
                                                    .isNotEmpty &&
                                                _phoneController.text
                                                    .isNotEmpty &&
                                                _messageController.text
                                                    .isNotEmpty) {
                                              LoggerService.i(
                                                  "inState", "if first");
                                              final requestBody = {
                                                'name': _nameController.text,
                                                'email': _emailController.text,
                                                'mobile': _phoneController.text,
                                                'message': _messageController
                                                    .text,
                                              };
                                              await viewModel
                                                  .sendContactUsRequest(
                                                  requestBody);
                                              if (viewModel.contactUsData
                                                  ?.data != null) {
                                                showSimpleDialog(context);
                                              }
                                            } else {
                                              LoggerService.i(
                                                  "inState", "else");
                                              if (_nameController.text
                                                  .isEmpty) {
                                                LoggerService.i(
                                                    "inState",
                                                    "_showNameError");
                                                _nameError =
                                                    AppStrings
                                                        .thisFieldIsRequired;
                                                _showNameError = true;
                                              } else {
                                                _nameError =
                                                "";
                                                _showNameError = false;
                                              }

                                              if (_emailController.text
                                                  .isEmpty) {
                                                LoggerService.i("inState",
                                                    "_emailController.text.isEmpty");
                                                _emailError =
                                                    AppStrings
                                                        .thisFieldIsRequired;
                                                _showEmailError = true;
                                              } else if (!_isValidEmail(
                                                  _emailController.text)) {
                                                LoggerService.i("inState",
                                                    "!_isValidEmail(_emailController.text)");
                                                _emailError =
                                                    AppStrings
                                                        .pleaseProvideValidEmail;
                                                _showEmailError = true;
                                              } else {
                                                _emailError =
                                                "";
                                                _showEmailError = true;
                                              }

                                              if (_phoneController.text
                                                  .isEmpty) {
                                                LoggerService.i("inState",
                                                    "_phoneController.text.isEmpty");
                                                _phoneError =
                                                    AppStrings
                                                        .thisFieldIsRequired;
                                                _showPhoneError = true;
                                              } else if (!_isValidPhoneNumber(
                                                  _phoneController.text)) {
                                                LoggerService.i("inState",
                                                    "!_isValidPhoneNumber(_phoneController.text)");
                                                _phoneError =
                                                    AppStrings
                                                        .pleaseProvideValidPhone;
                                                _showPhoneError = true;
                                              } else {
                                                _phoneError =
                                                "";
                                                _showPhoneError = false;
                                              }
                                              if (_messageController
                                                  .text.isEmpty) {
                                                LoggerService.i(
                                                    "inState",
                                                    "_showMessageError");
                                                _messageError =
                                                    AppStrings
                                                        .thisFieldIsRequired;
                                                _showMessageError = true;
                                              } else {
                                                _messageError =
                                                "";
                                                _showMessageError = false;
                                              }
                                            }
                                          },
                                          child: Container(
                                            height: 50.0,
                                            margin: const EdgeInsets.only(
                                              left: 40.0,
                                              right: 40.0,
                                              top: 10.0,
                                              bottom: 10.0,
                                            ),
                                            child: Card(
                                              color: AppColors.fabbyBondiBlue,
                                              child: Padding(
                                                padding: const EdgeInsets.all(
                                                    8.0),
                                                // Adjust the padding as needed
                                                child: Center(
                                                  // Center the text vertically and horizontally
                                                  child: TextUtils.display(
                                                    AppStrings.sendYourMessages,
                                                    fontSize: 14.0,
                                                    // Increased fontSize for larger text
                                                    color: AppColors.white,
                                                    fontFamily: 'Poppins',
                                                    fontWeight: FontWeight.bold,
                                                    textAlign: TextAlign
                                                        .center, // Center the text within its own bounds
                                                  ),
                                                ),
                                              ),
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                              ),
                              const SizedBox(height: 10.0),
                              SizedBox(
                                height: 60.0,
                                width: 60.0,
                                child: IconButton(
                                    padding: const EdgeInsets.all(0.0),
                                  icon: Image.asset('assets/insta_white.png'),
                                  iconSize: 60.0,
                                  onPressed: () {
                                    launchInstagram();
                                  },
                                ),
                              ),
                              const SizedBox(height: 20.0),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              );
            }
        )
    );
  }

}
