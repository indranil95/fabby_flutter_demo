import 'package:flutter/material.dart';
import 'package:flutter_fabby_demo/colors/colors.dart';
import 'package:flutter_fabby_demo/strings/strings.dart';
import 'package:flutter_fabby_demo/ui/screens/top_bar_detail.dart';
import 'package:flutter_fabby_demo/utils/text_utils.dart';

class PrivacyPolicy extends StatelessWidget {
  const PrivacyPolicy({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const TopBarDetail(title: AppStrings.privacyPolicy),
      body: Padding( padding: const EdgeInsets.all(10.0),
        child:SingleChildScrollView(
          child:Column(
            crossAxisAlignment: CrossAxisAlignment.stretch, // Makes the Column take full width
            children: [
              TextUtils.displayLargeText(
                AppStrings.privacyPolicyNew,
                fontSize: 20.0,
                // Increased fontSize for larger text
                color: AppColors.subTextColot,
                fontFamily: 'DmSerifDisplay',
                fontWeight: FontWeight.w300,
                textAlign: TextAlign.start, // Center the text
              ),
              const SizedBox(height: 10.0,),
              TextUtils.displayLargeText(
                AppStrings.companyCommitment,
                fontSize: 15.0,
                // Increased fontSize for larger text
                color: AppColors.subTextColot,
                fontFamily: 'Poppins',
                fontWeight: FontWeight.normal,
                textAlign: TextAlign.start, // Center the text
              ),
              const SizedBox(height: 10.0,),
              TextUtils.displayLargeText(
                AppStrings.internalRecordKeeping,
                fontSize: 20.0,
                // Increased fontSize for larger text
                color: AppColors.subTextColot,
                fontFamily: 'DmSerifDisplay',
                fontWeight: FontWeight.w300,
                textAlign: TextAlign.start, // Center the text
              ),
              const SizedBox(height: 10.0,),
              TextUtils.displayLargeText(
                AppStrings.usePersonalInformation,
                fontSize: 15.0,
                // Increased fontSize for larger text
                color: AppColors.subTextColot,
                fontFamily: 'Poppins',
                fontWeight: FontWeight.normal,
                textAlign: TextAlign.start, // Center the text
              ),
              const SizedBox(height: 10.0,),
              TextUtils.displayLargeText(
                AppStrings.security,
                fontSize: 20.0,
                // Increased fontSize for larger text
                color: AppColors.subTextColot,
                fontFamily: 'DmSerifDisplay',
                fontWeight: FontWeight.w300,
                textAlign: TextAlign.start, // Center the text
              ),
              const SizedBox(height: 10.0,),
              TextUtils.displayLargeText(
                AppStrings.personalInformationSecurity,
                fontSize: 15.0,
                // Increased fontSize for larger text
                color: AppColors.subTextColot,
                fontFamily: 'Poppins',
                fontWeight: FontWeight.normal,
                textAlign: TextAlign.start, // Center the text
              ),
              const SizedBox(height: 10.0,),
              TextUtils.displayLargeText(
                AppStrings.howWeUseCookies,
                fontSize: 20.0,
                // Increased fontSize for larger text
                color: AppColors.subTextColot,
                fontFamily: 'DmSerifDisplay',
                fontWeight: FontWeight.w300,
                textAlign: TextAlign.start, // Center the text
              ),
              const SizedBox(height: 10.0,),
              TextUtils.displayLargeText(
                AppStrings.cookieDescription,
                fontSize: 15.0,
                // Increased fontSize for larger text
                color: AppColors.subTextColot,
                fontFamily: 'Poppins',
                fontWeight: FontWeight.normal,
                textAlign: TextAlign.start, // Center the text
              ),
              const SizedBox(height: 10.0,),
              TextUtils.displayLargeText(
                AppStrings.linksToOtherWebsites,
                fontSize: 20.0,
                // Increased fontSize for larger text
                color: AppColors.subTextColot,
                fontFamily: 'DmSerifDisplay',
                fontWeight: FontWeight.w300,
                textAlign: TextAlign.start, // Center the text
              ),
              const SizedBox(height: 10.0,),
              TextUtils.displayLargeText(
                AppStrings.otherWebsitesDescription,
                fontSize: 15.0,
                // Increased fontSize for larger text
                color: AppColors.subTextColot,
                fontFamily: 'Poppins',
                fontWeight: FontWeight.normal,
                textAlign: TextAlign.start, // Center the text
              ),
              const SizedBox(height: 10.0,),
              TextUtils.displayLargeText(
                AppStrings.controllingYourPersonalInformation,
                fontSize: 20.0,
                // Increased fontSize for larger text
                color: AppColors.subTextColot,
                fontFamily: 'DmSerifDisplay',
                fontWeight: FontWeight.w300,
                textAlign: TextAlign.start, // Center the text
              ),
              const SizedBox(height: 10.0,),
              TextUtils.displayLargeText(
                AppStrings.requestDetails,
                fontSize: 15.0,
                // Increased fontSize for larger text
                color: AppColors.subTextColot,
                fontFamily: 'Poppins',
                fontWeight: FontWeight.normal,
                textAlign: TextAlign.start, // Center the text
              ),
              const SizedBox(height: 10.0,),
              TextUtils.displayLargeText(
                AppStrings.grievanceSection,
                fontSize: 20.0,
                // Increased fontSize for larger text
                color: AppColors.subTextColot,
                fontFamily: 'DmSerifDisplay',
                fontWeight: FontWeight.w300,
                textAlign: TextAlign.start, // Center the text
              ),
              const SizedBox(height: 10.0,),
              TextUtils.displayLargeText(
                AppStrings.grievanceDescription,
                fontSize: 15.0,
                // Increased fontSize for larger text
                color: AppColors.subTextColot,
                fontFamily: 'Poppins',
                fontWeight: FontWeight.normal,
                textAlign: TextAlign.start, // Center the text
              ),
              const SizedBox(height: 10.0,),
            ],
          ),
        )

      )
    );
  }
}
