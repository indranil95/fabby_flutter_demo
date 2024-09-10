import 'package:flutter/material.dart';
import 'package:flutter_fabby_demo/ui/screens/resetpassword_otp.dart';
import 'package:flutter_fabby_demo/viewModels/forgotpassword_viewmodel.dart';
import 'package:provider/provider.dart';

import '../../AppConstant/app_constant.dart';
import '../../colors/colors.dart';
import '../../strings/strings.dart';
import '../../utils/image_utils.dart';
import '../../utils/logger_service.dart';
import '../../utils/navigation_service.dart';
import '../../utils/tag_button.dart';
import '../../utils/text_utils.dart';
import '../dialog/custom_dialog.dart';

class ForgotPasswordScreen extends StatefulWidget {
  const ForgotPasswordScreen({super.key});

  @override
  _ForgotPasswordScreenState createState() => _ForgotPasswordScreenState();

}
class _ForgotPasswordScreenState extends State<ForgotPasswordScreen> {
  late TextEditingController _emailController;
  String _emailError = "";
  bool _showEmailError = false;
  late  ForgotPasswordViewModel viewModel;
  @override
  void initState() {
    super.initState();
    viewModel = Provider.of<ForgotPasswordViewModel>(context, listen: false);
    _emailController = TextEditingController();
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
  }
  @override
  void dispose() {
    _emailController.dispose();
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
              margin: const EdgeInsetsDirectional.only(
                  top: 30.0, start: 20.0, end: 20),
              alignment: AlignmentDirectional.topStart,
              child: TextUtils.display(
                AppStrings.resetPassword,
                fontSize: 20.0,
                color: AppColors.sortTextColor,
                fontFamily: 'DmSerifDisplay',
                fontWeight: FontWeight.normal,
              ),
            ),
            Container(
              margin: const EdgeInsetsDirectional.only(
                  top: 10.0, start: 20.0, end: 20),
              alignment: AlignmentDirectional.topStart,
              child: TextUtils.displayLargeText(
                AppStrings.pleaseEnterYourEmailAddressMobileNumberBelowToReceiveVerificationCode,
                fontSize: 15.0,
                color: AppColors.sortTextColor,
                fontFamily: 'Poppins',
                fontWeight: FontWeight.normal,
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
            GestureDetector(
              onTap: () async {
                if(_emailController.text.toString().isNotEmpty){
                  final requestBody = {
                    'email_or_mobile': _emailController.text,
                    'request_place': AppConstants.web,
                  };
                  await viewModel.sendOtpRequest(requestBody);
                  if(viewModel.sendOtpData?.error == 200){
                    showSimpleDialog(context,"Otp send successfully");
                  }
                }else{
                  if (_emailController.text.isEmpty) {
                    LoggerService.i("inState", "_showNameError");
                    _emailError = AppStrings.thisFieldIsRequired;
                    _showEmailError = true;
                  } else {
                    _emailError = "";
                    _showEmailError = false;
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
                        AppStrings.proceed,
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
              alignment: AlignmentDirectional.center,
              width: double.infinity,
              height: 50.0,
              child: SizedBox(
                width: double.infinity,
                // Ensure the Card takes full width of the container
                height: double.infinity,
                // Ensure the Card takes full height of the container
                child: Padding(
                    padding: const EdgeInsets.all(0.0),
                    child: CancelButton(
                      text: AppStrings.cancel,
                      height: 50.0,
                      width: double.infinity,
                      onPressed: () {
                        NavigationService.goBack();
                      },
                    )),
              ),
            ),
          ],
        ),
      ),
    );
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
            LoggerService.d("hi","press");
            Future.delayed(const Duration(seconds: 1), ()
            {
              NavigationService.replaceWithData(
                  const ResetPasswordOtpScreen(), data: {"email": _emailController.text});
            });
          },
          buttonText: 'ok', // Customize button text if needed
        );
      },
    );
  }

}