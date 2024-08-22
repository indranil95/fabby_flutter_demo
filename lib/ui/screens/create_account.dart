import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_fabby_demo/ui/screens/login_screen.dart';
import 'package:flutter_fabby_demo/ui/screens/otp_screen.dart';
import 'package:flutter_fabby_demo/viewModels/signup_viewmodel.dart';
import 'package:provider/provider.dart';

import '../../AppConstant/app_constant.dart';
import '../../colors/colors.dart';
import '../../strings/strings.dart';
import '../../utils/editable_toggle.dart';
import '../../utils/image_utils.dart';
import '../../utils/logger_service.dart';
import '../../utils/navigation_service.dart';
import '../../utils/text_utils.dart';

class CreateAccountScreen extends StatefulWidget {
  const CreateAccountScreen({super.key});

  @override
  _CreateAccountScreenState createState() => _CreateAccountScreenState();
}

class _CreateAccountScreenState extends State<CreateAccountScreen> {
  late TextEditingController _firstNameController;
  late TextEditingController _lastNameController;
  late TextEditingController _emailController;
  late TextEditingController _passwordController;

  String _firstNameError = "";
  String _lastNameError = "";
  String _emailError = "";
  String _passwordError = "";
  bool _showfirstNameError = false;
  bool _showlastNameError = false;
  bool _showEmailError = false;
  bool _showPasswordError = false;
  late SignUpViewModel viewModel;

  @override
  void initState() {
    super.initState();
    viewModel = Provider.of<SignUpViewModel>(context, listen: false);
    _firstNameController = TextEditingController();
    _lastNameController = TextEditingController();
    _emailController = TextEditingController();
    _passwordController = TextEditingController();
    _emailController.addListener(() {
      if (mounted) {
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
      }
    });
    _passwordController.addListener(() {
      if (mounted) {
        setState(() {
          if (_passwordController.text.isEmpty) {
            _passwordError = AppStrings.thisFieldIsRequired;
            _showPasswordError = true;
          } else {
            _passwordError = "";
            _showPasswordError = false;
          }
        });
      }
    });
    _firstNameController.addListener(() {
      if (mounted) {
        setState(() {
          if (_firstNameController.text.isEmpty) {
            _firstNameError = AppStrings.thisFieldIsRequired;
            _showfirstNameError = true;
          } else {
            _firstNameError = "";
            _showfirstNameError = false;
          }
        });
      }
    });
    _lastNameController.addListener(() {
      if (mounted) {
        setState(() {
          if (_lastNameController.text.isEmpty) {
            _lastNameError = AppStrings.thisFieldIsRequired;
            _showlastNameError = true;
          } else {
            _lastNameError = "";
            _showlastNameError = false;
          }
        });
      }
    });
  }

  @override
  void dispose() {
    _firstNameController.dispose();
    _lastNameController.dispose();
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.fabbyBack,
      body: SingleChildScrollView(
        child: Column(
          children: [
            SafeArea(
              child: Container(
                margin:
                    const EdgeInsetsDirectional.only(top: 10.0, start: 20.0),
                alignment: AlignmentDirectional.center,
                child: SizedBox(
                  width: 250.0,
                  height: 250.0,
                  child: PngImage.asset(
                    'assets/login_bg.png', // Path to your PNG image
                    width: 250.0,
                    height: 250.0,
                  ),
                ),
              ),
            ),
            Container(
              margin: const EdgeInsetsDirectional.only(top: 30.0, start: 20.0),
              alignment: AlignmentDirectional.topStart,
              child: TextUtils.display(
                AppStrings.helloNewFriend,
                fontSize: 20.0,
                color: AppColors.sortTextColor,
                fontFamily: 'DmSerifDisplay',
                fontWeight: FontWeight.normal,
              ),
            ),
            Container(
              margin: const EdgeInsetsDirectional.only(top: 10.0, start: 20.0),
              alignment: AlignmentDirectional.topStart,
              child: RichText(
                text: TextSpan(
                  text: "Already a user ? ",
                  style: const TextStyle(color: Colors.black,fontSize: 15.0),
                  children: [
                    TextSpan(
                      text: "Login",
                      style: const TextStyle(
                        color: Colors.black, // Replace with your color
                        fontWeight: FontWeight.bold,
                        fontSize: 15.0,
                        decoration: TextDecoration.underline,
                      ),
                      recognizer: TapGestureRecognizer()
                        ..onTap = () {
                          NavigationService.navigateTo(const LoginScreen());
                        },
                    ),
                  ],
                ),
              ),
            ),
            Container(
              margin: const EdgeInsetsDirectional.only(
                  top: 20.0, start: 20.0, end: 20.0),
              alignment: AlignmentDirectional.topStart,
              child: TextUtils.editableText(
                controller: _firstNameController,
                fontSize: 16.0,
                fontWeight: FontWeight.normal,
                color: AppColors.recentStroke,
                hintColor: AppColors.lightGray,
                textAlign: TextAlign.start,
                maxLines: 1,
                fontFamily: 'Poppins',
                hintText: AppStrings.yourFirstName,
                contentPadding: const EdgeInsets.symmetric(
                    vertical: 10.0, horizontal: 15.0),
              ),
            ),
            if (_showfirstNameError)
              Container(
                padding: const EdgeInsets.only(left: 20.0),
                alignment: Alignment.topLeft,
                child: TextUtils.errorText(
                  _firstNameError,
                  fontSize: 15.0,
                  fontWeight: FontWeight.normal,
                  color: Colors.red,
                  textAlign: TextAlign.start,
                  maxLines: 1,
                  fontFamily: 'Poppins',
                ),
              ),
            const SizedBox(height: 10.0),
            Container(
              margin: const EdgeInsetsDirectional.only(
                  top: 20.0, start: 20.0, end: 20.0),
              alignment: AlignmentDirectional.topStart,
              child: TextUtils.editableText(
                controller: _lastNameController,
                fontSize: 16.0,
                fontWeight: FontWeight.normal,
                color: AppColors.recentStroke,
                hintColor: AppColors.lightGray,
                textAlign: TextAlign.start,
                maxLines: 1,
                fontFamily: 'Poppins',
                hintText: AppStrings.yourLastName,
                contentPadding: const EdgeInsets.symmetric(
                    vertical: 10.0, horizontal: 15.0),
              ),
            ),
            if (_showlastNameError)
              Container(
                padding: const EdgeInsets.only(left: 20.0),
                alignment: Alignment.topLeft,
                child: TextUtils.errorText(
                  _lastNameError,
                  fontSize: 15.0,
                  fontWeight: FontWeight.normal,
                  color: Colors.red,
                  textAlign: TextAlign.start,
                  maxLines: 1,
                  fontFamily: 'Poppins',
                ),
              ),
            const SizedBox(height: 10.0),
            Container(
              margin: const EdgeInsetsDirectional.only(
                  top: 20.0, start: 20.0, end: 20.0),
              alignment: AlignmentDirectional.topStart,
              child: TextUtils.editableText(
                controller: _emailController,
                fontSize: 16.0,
                fontWeight: FontWeight.normal,
                color: AppColors.recentStroke,
                hintColor: AppColors.lightGray,
                textAlign: TextAlign.start,
                maxLines: 1,
                fontFamily: 'Poppins',
                hintText: AppStrings.yourNameMobileNumber,
                contentPadding: const EdgeInsets.symmetric(
                    vertical: 10.0, horizontal: 15.0),
              ),
            ),
            if (_showEmailError)
              Container(
                padding: const EdgeInsets.only(left: 20.0),
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
            Container(
                margin: const EdgeInsetsDirectional.only(
                    top: 10.0, start: 20.0, end: 20.0),
                alignment: AlignmentDirectional.topStart,
                child: EditableTextWithToggle(
                  controller: _passwordController,
                  fontSize: 16.0,
                  fontWeight: FontWeight.normal,
                  color: AppColors.recentStroke,
                  hintColor: AppColors.lightGray,
                  textAlign: TextAlign.start,
                  maxLines: 1,
                  fontFamily: 'Poppins',
                  hintText: AppStrings.yourPassword,
                  contentPadding: const EdgeInsets.symmetric(
                      vertical: 10.0, horizontal: 15.0),
                )),
            if (_showPasswordError)
              Container(
                padding: const EdgeInsets.only(left: 20.0),
                alignment: Alignment.topLeft,
                child: TextUtils.errorText(
                  _passwordError,
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
                //NavigationService.replaceWith(const LoginScreen());
                setState(() {
                  _showEmailError = false;
                  _showPasswordError = false;
                });
                if (_emailController.text.isNotEmpty &&
                    _passwordController.text.isNotEmpty) {
                  final requestBody = {
                  'email_or_mobile': _emailController.text,
                  'fullname': _firstNameController.text,
                  'lastname': _lastNameController.text,
                    'password': _passwordController.text,
                  'register_type': AppConstants.manual,
                  'request_place': AppConstants.web,
                  'signin_platform': AppConstants.signUpPlatform,
                  'user_type': AppConstants.customer,
                };
                await viewModel
                    .sendSignUpRequest(
                    requestBody);
                if (viewModel.signUpData
                    ?.data != null) {
                  NavigationService.replaceWith(const OtpScreen());
                }
                } else {
                  if (_emailController.text.isEmpty) {
                    LoggerService.i("inState", "_showNameError");
                    _emailError = AppStrings.thisFieldIsRequired;
                    _showEmailError = true;
                  } else {
                    _emailError = "";
                    _showEmailError = false;
                  }
                  if (_passwordController.text.isEmpty) {
                    LoggerService.i("inState", "_showNameError");
                    _passwordError = AppStrings.thisFieldIsRequired;
                    _showPasswordError = true;
                  } else {
                    _passwordError = "";
                    _showPasswordError = false;
                  }
                }
              },
              child: Container(
                margin: const EdgeInsetsDirectional.only(
                    top: 10.0, start: 20.0, end: 20.0),
                alignment: AlignmentDirectional.center,
                width: double.infinity,
                height: 50.0,
                child: Card(
                  color: AppColors.fabbyBondiBlue,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20.0), // Add curve here
                  ),
                  child: SizedBox(
                    width: double.infinity,
                    // Ensure the Card takes full width of the container
                    height: double.infinity,
                    // Ensure the Card takes full height of the container
                    child: Padding(
                      padding: const EdgeInsets.all(10.0),
                      child: TextUtils.display(
                        AppStrings.signUp,
                        fontSize: 14.0,
                        // Increased fontSize for larger text
                        color: AppColors.white,
                        fontFamily: 'Poppins',
                        fontWeight: FontWeight.normal,
                        textAlign: TextAlign.center, // Center the text
                      ),
                    ),
                  ),
                ),
              ),
            ),
            Container(
              margin: const EdgeInsetsDirectional.only(
                  top: 10.0, start: 20.0, end: 20.0),
              child: Row(
                children: [
// First View (left line)
                  Expanded(
                    flex: 4, // Equivalent to android:layout_weight="0.4"
                    child: Container(
                      height: 1.0,
                      color: Colors.grey.withOpacity(
                          0.5), // Equivalent to @color/light_gray_alpha
                    ),
                  ),
                  // AppCompatTextView (text in the middle)
                  Expanded(
                    flex: 1, // Equivalent to android:layout_weight="0.1"
                    child: Center(
                      child: TextUtils.display(
                        AppStrings.or,
                        fontSize: 13.0,
                        color: AppColors.sortTextColor,
                        fontFamily: 'DmSerifDisplay',
                        fontWeight: FontWeight.normal,
                      ),
                    ),
                  ),
                  // Second View (right line)
                  Expanded(
                    flex: 4, // Equivalent to android:layout_weight="0.4"
                    child: Container(
                      height: 1.0,
                      color: Colors.grey.withOpacity(
                          0.5), // Equivalent to @color/light_gray_alpha
                    ),
                  ),
                ],
              ),
            ),
            GestureDetector(
              onTap: () {
                //NavigationService.replaceWith(const LoginScreen());
              },
              child: Container(
                margin: const EdgeInsets.only(top: 10.0),
                width: 120.0,
                height: 50.0,
                child: Card(
                  color: AppColors.googleBack,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20.0), // Add curve here
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      // Image at the start
                      SvgImage.asset(
                        'assets/login_google.svg',
                        // Replace with your image path
                        width: 24.0, // Adjust the size of the image
                        height: 24.0,
                      ),
                      const SizedBox(width: 8.0),
                      // Add some spacing between image and text
                      // TextUtils display for text
                      TextUtils.display(
                        AppStrings.google,
                        fontSize: 14.0,
                        color: AppColors.white,
                        fontFamily: 'Poppins',
                        fontWeight: FontWeight.normal,
                        textAlign: TextAlign.center,
                      ),
                    ],
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }

  bool _isValidEmail(String email) {
    final emailRegex = RegExp(
      r'^([a-zA-Z0-9._%+-]+)@([a-zA-Z0-9.-]+)\.([a-zA-Z]{2,})$',
      caseSensitive: false,
    );
    return emailRegex.hasMatch(email);
  }
}
