import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_fabby_demo/AppConstant/app_constant.dart';
import 'package:flutter_fabby_demo/colors/colors.dart';
import 'package:flutter_fabby_demo/ui/screens/create_account.dart';
import 'package:flutter_fabby_demo/ui/screens/forgot_password.dart';
import 'package:flutter_fabby_demo/ui/screens/home_screen.dart';
import 'package:flutter_fabby_demo/utils/snackbar_utils.dart';
import 'package:flutter_fabby_demo/viewModels/login_viewmodel.dart';
import 'package:provider/provider.dart';

import '../../strings/strings.dart';
import '../../utils/editable_toggle.dart';
import '../../utils/google_signin_service.dart';
import '../../utils/image_utils.dart';
import '../../utils/logger_service.dart';
import '../../utils/navigation_service.dart';
import '../../utils/text_utils.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  late GoogleSignInService googleSignInService;
  late TextEditingController _emailController;
  late TextEditingController _passwordController;
  late LoginViewModel viewModel;
  String _emailError = "";
  String _passwordError = "";
  bool _showEmailError = false;
  bool _showPasswordError = false; // check

  @override
  void initState() {
    super.initState();
    googleSignInService = GoogleSignInService(); // Initialize the Google Sign-In service
    _emailController = TextEditingController();
    _passwordController = TextEditingController();
    viewModel = Provider.of<LoginViewModel>(context, listen: false);
    _emailController.addListener(() {
      if (mounted) {
        setState(() {
          if (_emailController.text.isEmpty) {
            _emailError = AppStrings.thisFieldIsRequired;
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
  }

  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.fabbyBack,
      body: SingleChildScrollView(child: Column(
        children: [
          SafeArea(
            child: Container(
              margin: const EdgeInsetsDirectional.only(top: 10.0, start: 20.0),
              alignment: AlignmentDirectional.topStart,
              child: SizedBox(
                width: 100.0,
                height: 45.0,
                child: PngImage.asset(
                  'assets/fabby_top_logo.png', // Path to your PNG image
                  width: 120.0,
                  height: 45.0,
                ),
              ),
            ),
          ),
          Container(
            alignment: AlignmentDirectional.center,
            child: SizedBox(
              width: 250.0,
              height: 200.0,
              child: SvgImage.asset(
                'assets/login_back.svg', // Path to your PNG image
                width: 120.0,
                height: 45.0,
              ),
            ),
          ),
          Container(
            margin: const EdgeInsetsDirectional.only(top: 30.0, start: 20.0),
            alignment: AlignmentDirectional.topStart,
            child: TextUtils.display(
              AppStrings.welcomeBack,
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
                text: "Don't have an account? ",
                style: const TextStyle(color: Colors.black,fontSize: 15.0),
                children: [
                  TextSpan(
                    text: "Create Account",
                    style: const TextStyle(
                      color: Colors.black, // Replace with your color
                      fontWeight: FontWeight.bold,
                      fontSize: 15.0,
                      decoration: TextDecoration.underline,
                    ),
                    recognizer: TapGestureRecognizer()
                      ..onTap = () {
                        NavigationService.navigateTo(const CreateAccountScreen());
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
              controller: _emailController,
              fontSize: 16.0,
              fontWeight: FontWeight.normal,
              color: AppColors.recentStroke,
              hintColor: AppColors.lightGray,
              textAlign: TextAlign.start,
              maxLines: 1,
              fontFamily: 'Poppins',
              hintText: AppStrings.yourNameMobileNumber,
              contentPadding:
              const EdgeInsets.symmetric(vertical: 10.0, horizontal: 15.0),
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
                borderColor: AppColors.recentStroke, // Border color for the outer border
                textColor: AppColors.black, // Text color for typing
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
            onTap: () {
              NavigationService.navigateTo(const ForgotPasswordScreen());
            },
            child: Container(
              margin: const EdgeInsetsDirectional.only(end: 20.0),
              alignment: AlignmentDirectional.topEnd,
              child: TextUtils.display(
                AppStrings.forgotPassword,
                fontSize: 12.0,
                color: AppColors.black,
                fontFamily: 'Poppins',
                fontWeight: FontWeight.normal,
              ),
            ),
          ),
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
                  'login_type': AppConstants.manual,
                  'password': _passwordController.text,
                  'signin_platform': AppConstants.signUpPlatform,
                  'user_type': AppConstants.customer,
                };
                await viewModel
                    .sendLoginRequest(
                    requestBody);
                if (viewModel.loginData
                    ?.success == true) {
                  NavigationService.replaceWith(const HomeScreen());
                }else{
                  SnackbarService.showErrorSnackbar(context, viewModel.loginData
                      !.error.toString());
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
                  top: 10.0, start: 40.0, end: 40.0),
              alignment: AlignmentDirectional.center,
              width: 250.0,
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
                      AppStrings.login,
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
            onTap: () async{
              // Call the sign-in service and get the user data
              Map<String, dynamic>? userData = await googleSignInService.signInWithGoogle();

              if (userData != null) {
                // Print the userData for debugging
                LoggerService.d('User Data: $userData'); // Print the entire userData map
                // You can update the UI here or pass the user data to another widget
                String displayName=userData['name'];
                String firstName = '';
                String lastName = '';

                if (displayName != null && displayName.isNotEmpty) {
                  List<String> parts = displayName.split(" ");
                  if (parts.isNotEmpty) {
                    firstName = parts[0];
                    if (parts.length > 1) {
                      lastName = parts.sublist(1).join(" ");
                    }
                  }
                }
                String? gid = userData['id'];
                String? email=userData['email'];
                LoggerService.d('gid: $gid');
                LoggerService.d('User Email: $email');
                final requestBody = {
                  'email_or_mobile': email,
                  'fullname': firstName,
                  'lastname': lastName,
                  'gid': gid,
                  'signin_platform': AppConstants.signUpPlatform,
                  'user_type': AppConstants.customer,
                };
                await viewModel
                    .sendLoginRequest(
                    requestBody);
                if (viewModel.loginData
                    ?.success == true) {
                  NavigationService.replaceWith(const HomeScreen());
                }else{
                  SnackbarService.showErrorSnackbar(context, viewModel.loginData
                  !.error.toString());
                }
              } else {
                print('Sign-in failed or was canceled by the user.');
              }
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
      ),),
    );
  }
}
