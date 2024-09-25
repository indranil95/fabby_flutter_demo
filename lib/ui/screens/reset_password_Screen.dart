import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../AppConstant/app_constant.dart';
import '../../colors/colors.dart';
import '../../strings/strings.dart';
import '../../utils/logger_service.dart';
import '../../utils/navigation_service.dart';
import '../../utils/text_utils.dart';

import 'package:flutter/material.dart';

import '../../viewModels/signup_viewmodel.dart';
import '../dialog/custom_dialog.dart';

class ResetPasswordScreen extends StatefulWidget {
  @override
  _ResetPasswordScreenState createState() => _ResetPasswordScreenState();
}

class _ResetPasswordScreenState extends State<ResetPasswordScreen> {
  // Step 1: Create a TextEditingController
  TextEditingController emailController = TextEditingController();
  String _emailError = "";
  bool _showEmailError = false;
  late SignUpViewModel viewModel;

  @override
  void initState() {
    super.initState();
    viewModel = Provider.of<SignUpViewModel>(context, listen: false);
    emailController = TextEditingController();
    emailController.addListener(() {
      if (mounted) {
        setState(() {
          if (emailController.text.isEmpty) {
            _emailError = AppStrings.thisFieldIsRequired;
            _showEmailError = true;
          } else if (!isValidEmail(emailController.text)) {
            _emailError = AppStrings.pleaseProvideValidEmail;
            _showEmailError = true;
          } else {
            _emailError = "";
            _showEmailError = false;
          }
        });
      }
    });
  }

  @override
  void dispose() {
    emailController.dispose();
    super.dispose();
  }

  // Example function to use the TextField value
  void proceed() {
    String inputText = emailController.text; // Step 3: Access the value

    // Example: Print the value or use it in a task
    if (inputText.isNotEmpty) {
      print("Input: $inputText");
      // Perform further actions with the input value
      // For example, send to an API, validate, etc.
    } else {
      print("Field is empty");
    }
  }

  bool isValidEmail(String email) {
    final emailRegex = RegExp(
      r'^([a-zA-Z0-9._%+-]+)@([a-zA-Z0-9.-]+)\.([a-zA-Z]{2,})$',
      caseSensitive: false,
    );
    return emailRegex.hasMatch(email);
  }

  void showSimpleDialog(BuildContext context, String s) {
    showDialog(
        context: context,
        barrierDismissible: false,
        builder: (BuildContext context) {
          return CustomDialog(
            maxLines: 1,
            message: s,
            onButtonPressed: () {
              Future.delayed(const Duration(seconds: 1), () {
                // NavigationService.replaceWithData(
                //     const ResetPasswordScreen(), data: {"email": emailValue});
              });
            },
            buttonText: 'ok', // Customize button text if needed
          );
        }
    );
  }

//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: Padding(
//         padding: const EdgeInsets.all(16.0),
//         child: Column(
//           mainAxisAlignment: MainAxisAlignment.center,
//           children: [
//             // Step 2: Assign the controller to the TextField
//             TextField(
//               controller: emailController,
//               decoration: InputDecoration(
//                 filled: true,
//                 fillColor: Colors.white,
//                 hintText: 'Your email/mobile number',
//                 enabledBorder: OutlineInputBorder(
//                   borderRadius: BorderRadius.circular(10),
//                   borderSide: BorderSide(
//                     color: Colors.black,
//                     width: 1.5,
//                   ),
//                 ),
//                 focusedBorder: OutlineInputBorder(
//                   borderRadius: BorderRadius.circular(10),
//                   borderSide: BorderSide(
//                     color: Colors.pink,
//                     width: 2.0,
//                   ),
//                 ),
//               ),
//             ),
//             SizedBox(height: 20),
//             ElevatedButton(
//               onPressed: proceed, // Call the function to use TextField value
//               child: Text('Proceed'),
//               style: ElevatedButton.styleFrom(
//                 primary: Colors.pink, // Button color
//                 padding: EdgeInsets.symmetric(horizontal: 50, vertical: 15),
//               ),
//             ),
//             TextButton(
//               onPressed: () {
//                 // Add functionality for Cancel if needed
//               },
//               child: Text('Cancel'),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }
//
// void main() => runApp(MaterialApp(home: ResetPasswordScreen()));

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFFFF1F7), // Light pink background
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            children: [
              const SizedBox(height: 60), // Space for status bar
              // Placeholder for Image (you can add your image here later)
              Center(
                child: Image.asset(
                  'assets/resetPassword.png', // Path to the image
                  width: 200, // Set width as per your requirement
                  height: 200, // Set height as per your requirement
                ),
              ),
              const SizedBox(height: 20),

              // Reset Password Text
              Align(
                alignment: Alignment.centerLeft,
                child: TextUtils.display(
                AppStrings.resetPassword,
                fontSize: 20.0,
                color: AppColors.black,
                fontFamily: 'DmSerifDisplay',
              ),
              ),
              const SizedBox(height: 10),

              // Instruction Text
              Align(
                alignment: Alignment.centerLeft,
                child: TextUtils.display(
                  AppStrings.pleaseEnterYourEmailAddressMobileNumberBelowToReceiveVerificationCode,
                  fontSize: 16.0,
                  color: AppColors.black,
                  fontFamily: 'Poppins',
                  fontWeight: FontWeight.w400,
                  maxLines: 4
                ),
                // child: Text(
                //   'Please Enter your Email Address/\nMobile Number Below to Receive Verification Code.',
                //   style: TextStyle(
                //     fontSize: 16,
                //     color: Colors.black87,
                //   ),
                // ),
              ),
              const SizedBox(height: 30),

              // Input Field for Email/Mobile Number
              TextField(
                controller: emailController,
                decoration: InputDecoration(
                  filled: true,
                  fillColor: Colors.white,
                  hintText: 'Your email/mobile number',
                  hintStyle: const TextStyle(color: Colors.grey),
                  // contentPadding: const EdgeInsets.symmetric(
                  //     vertical: 20.0, horizontal: 15.0),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(15),
                    borderSide: BorderSide.none,
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(15),// Rounded corners
                    borderSide: BorderSide(
                      color: Colors.grey, // Border color
                      width: 1, // Border width
                    ),
                  ),
                  // Border when the TextField is focused (selected)
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(15),
                    borderSide: BorderSide(
                      color: Colors.grey, // Border color when focused
                      width: 1, // Border width when focused
                    ),
                  ),

                  // Padding inside the TextField
                  contentPadding: EdgeInsets.symmetric(vertical: 20.0, horizontal: 15.0),
                ),
              ),
              const SizedBox(height: 20),

              // Proceed Button
              SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                  onPressed: ()
                    // Handle proceed action
                    async {
                      //NavigationService.replaceWith(const LoginScreen());
                      setState(() {
                        _showEmailError = false;
                      });
                      if (emailController.text.isNotEmpty) {
                        final requestBody = {
                          'email_or_mobile': emailController.text,
                          'request_place': AppConstants.web,
                        };
                        await viewModel
                            .sendSignUpRequest(
                            requestBody);
                        if (viewModel.signUpData
                            ?.data != null) {
                          await viewModel.sendOtpRequest(requestBody);
                          if(viewModel.sendOtpData?.error == 200){
                            showSimpleDialog(context,"Otp send successfully");
                          }
                        }
                      } else {
                          LoggerService.d("inState", "_showNameError");
                          LoggerService.d("error", emailController.text);
                          _emailError = AppStrings.thisFieldIsRequired;
                          _showEmailError = true;
                      }
                    },
                  style: ElevatedButton.styleFrom(
                    padding: const EdgeInsets.symmetric(vertical: 15),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(30),
                    ),
                    backgroundColor: const Color(0xFFED9CAF), // Pink button
                  ),
                  child: const Text(
                    'Proceed',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 16,
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 15),

              // Cancel Button
              SizedBox(
                width: double.infinity,
                child: OutlinedButton(
                  onPressed: () {
                    Navigator.of(context).pop();
                    // Handle cancel action
                  },
                  style: OutlinedButton.styleFrom(
                    padding: const EdgeInsets.symmetric(vertical: 15, horizontal: 100),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(30),
                    ),
                    side: const BorderSide(color: Colors.black),
                  ),
                  child: const Text(
                    'Cancel',
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 16,
                    ),
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
