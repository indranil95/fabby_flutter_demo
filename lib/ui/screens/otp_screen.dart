import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_fabby_demo/utils/logger_service.dart';
import 'package:flutter_fabby_demo/utils/tag_button.dart';
import 'package:pin_code_fields/pin_code_fields.dart';
import 'package:provider/provider.dart';

import '../../AppConstant/app_constant.dart';
import '../../colors/colors.dart';
import '../../strings/strings.dart';
import '../../utils/image_utils.dart';
import '../../utils/navigation_service.dart';
import '../../utils/snackbar_utils.dart';
import '../../utils/text_utils.dart';
import '../../viewModels/otp_viewmodel.dart';
import '../dialog/custom_dialog.dart';

class OtpScreen extends StatefulWidget {
  const OtpScreen({super.key});

  @override
  _OtpScreenState createState() => _OtpScreenState();
}

class _OtpScreenState extends State<OtpScreen> {
  bool completionStat = false;
  String otpValue="";
  String emailValue="";
  late OtpViewModel viewModel;

  @override
  void initState() {
    super.initState();
    viewModel = Provider.of<OtpViewModel>(context, listen: false);
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
                  top: 30.0, start: 20.0, end: 20),
              alignment: AlignmentDirectional.topStart,
              child: PinCodeTextField(
                appContext: context,
                length: 6,
                obscureText: false,
                animationType: AnimationType.fade,
                cursorColor: Colors.white,
                keyboardType: TextInputType.number,
                textStyle: const TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                  color: Colors.black,
                ),
                pinTheme: PinTheme(
                  shape: PinCodeFieldShape.box,
                  borderRadius: BorderRadius.circular(5),
                  fieldHeight: 48,
                  fieldWidth: 50,
                  activeFillColor: Colors.white,
                  inactiveFillColor: Colors.white,
                  activeColor: Colors.white,
                  inactiveColor: Colors.white,
                  selectedColor: Colors.white,
                  borderWidth: 2,
                ),
                animationDuration: const Duration(milliseconds: 300),
                backgroundColor: Colors.transparent,
                enableActiveFill: true,
                onCompleted: (v) {
                  if (kDebugMode) {
                    print("Completed $v");
                  }
                  completionStat = true;
                  otpValue=v;
                },
                onChanged: (value) {
                  if (kDebugMode) {
                    print(value);
                  }
                 // LoggerService.d("hi ", "length ${value.length}");
                  if (value.length == 6) {
                    completionStat = true;
                  } else {
                    completionStat = false;
                  }
                },
                beforeTextPaste: (text) {
                  if (kDebugMode) {
                    print("Allowing to paste $text");
                  }
                  return true;
                },
              ),
            ),
            GestureDetector(
              onTap: () async {
               // LoggerService.d("hi ", completionStat);
                if (completionStat) {
                  final requestBody = {
                    'email_or_mobile': emailValue,
                    'otp': otpValue,
                    'otp[]': AppConstants.otpArraySize,
                    'request_place': AppConstants.web,
                  };
                  await viewModel.sendVerifyOtpRequest(requestBody);
                  if (viewModel.otpData
                      ?.success == true) {
                    showSimpleDialog(context,"Otp verified successfully");
                  }else{
                    SnackbarService.showErrorSnackbar(context, viewModel.otpData
                        !.statusCode);
                  }
                } else {
                  SnackbarService.showErrorSnackbar(
                      context, 'Please enter a valid OTP');
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
            NavigationService.goBack();
          },
          buttonText: 'ok', // Customize button text if needed
        );
      },
    );
  }
}
