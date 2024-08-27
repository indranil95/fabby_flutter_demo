import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:pin_code_fields/pin_code_fields.dart';
import 'package:provider/provider.dart';

import '../../AppConstant/app_constant.dart';
import '../../colors/colors.dart';
import '../../strings/strings.dart';
import '../../utils/editable_toggle.dart';
import '../../utils/image_utils.dart';
import '../../utils/logger_service.dart';
import '../../utils/navigation_service.dart';
import '../../utils/snackbar_utils.dart';
import '../../utils/tag_button.dart';
import '../../utils/text_utils.dart';
import '../../viewModels/resetpassword_viewmodel.dart';
import '../dialog/custom_dialog.dart';

class ResetPasswordScreen extends StatefulWidget {
  const ResetPasswordScreen({super.key});

  @override
  _ResetPasswordScreenState createState() => _ResetPasswordScreenState();
}
class _ResetPasswordScreenState extends State<ResetPasswordScreen> {
  bool completionStat = false;
  String otpValue="";
  String emailValue="";
  late ResetPasswordViewModel viewModel;
  late TextEditingController _passwordController;
  String _passwordError = "";
  bool _showPasswordError = false;
  late TextEditingController _cPasswordController;
  String _cPasswordError = "";
  bool _cShowPasswordError = false;

  @override
  void initState() {
    super.initState();
    _passwordController = TextEditingController();
    _cPasswordController = TextEditingController();
    viewModel = Provider.of<ResetPasswordViewModel>(context, listen: false);
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
    _cPasswordController.addListener(() {
      if (mounted) {
        setState(() {
          if (_cPasswordController.text.isEmpty) {
            _cPasswordError = AppStrings.thisFieldIsRequired;
            _cShowPasswordError = true;
          } else {
            _cPasswordError = "";
            _cShowPasswordError = false;
          }
        });
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    // Retrieve arguments
    final data = ModalRoute.of(context)?.settings.arguments as Map<String, dynamic>?;
    emailValue=data?['email'] ?? AppConstants.noData;
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
                AppStrings.accountVerification,
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
                AppStrings.pleaseEnterVerificationCodeSentOnYourEmail,
                fontSize: 15.0,
                color: AppColors.sortTextColor,
                fontFamily: 'Poppins',
                fontWeight: FontWeight.normal,
              ),
            ),
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
                  hintText: AppStrings.enterYourPassword,
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
            Container(
                margin: const EdgeInsetsDirectional.only(
                    top: 10.0, start: 20.0, end: 20.0),
                alignment: AlignmentDirectional.topStart,
                child: EditableTextWithToggle(
                  controller: _cPasswordController,
                  fontSize: 16.0,
                  fontWeight: FontWeight.normal,
                  color: AppColors.recentStroke,
                  hintColor: AppColors.lightGray,
                  textAlign: TextAlign.start,
                  maxLines: 1,
                  fontFamily: 'Poppins',
                  hintText: AppStrings.confirmPassword,
                  contentPadding: const EdgeInsets.symmetric(
                      vertical: 10.0, horizontal: 15.0),
                )),
            if (_cShowPasswordError)
              Container(
                padding: const EdgeInsets.only(left: 20.0),
                alignment: Alignment.topLeft,
                child: TextUtils.errorText(
                  _cPasswordError,
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
                  final requestBody = {
                    'email': emailValue,
                    'password': _passwordController.text.toString(),
                    'unique_id': AppConstants.blankLimit,
                    'cpassword': _cPasswordController.text.toString(),
                  };
                  await viewModel.passwordReset(requestBody);
                  if (viewModel.passwordData
                      ?.success == true) {
                    showSimpleDialog(context,"Password updated successfully");
                  }else{
                    SnackbarService.showErrorSnackbar(context, viewModel.passwordData
                    !.statusCode);
                  }
                //NavigationService.replaceWith(const LoginScreen());
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
                      text: "Cancel",
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
          message: s,
          onButtonPressed: () {
            NavigationService.goBack();
          },
          buttonText: 'ok', // Customize button text if needed
        );
      },
    );
  }
}