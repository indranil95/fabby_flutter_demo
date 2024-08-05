import 'package:flutter/material.dart';
import 'package:flutter_fabby_demo/strings/strings.dart';
import 'package:flutter_fabby_demo/ui/screens/top_bar_detail.dart';
import 'package:flutter_fabby_demo/utils/image_utils.dart';

import '../../colors/colors.dart';
import '../../utils/text_utils.dart';

class AboutUs extends StatelessWidget {
  const AboutUs({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: const TopBarDetail(title: AppStrings.aboutUs),
        body: Padding( padding: const EdgeInsets.all(10.0),
            child:SingleChildScrollView(
              child:Column(
                crossAxisAlignment: CrossAxisAlignment.stretch, // Makes the Column take full width
                children: [
                  TextUtils.displayLargeText(
                    AppStrings.theFutureOfPetCare,
                    fontSize: 20.0,
                    // Increased fontSize for larger text
                    color: AppColors.subTextColot,
                    fontFamily: 'DmSerifDisplay',
                    fontWeight: FontWeight.w300,
                    textAlign: TextAlign.center, // Center the text
                  ),
                  const SizedBox(height: 10.0,),
                  TextUtils.displayLargeText(
                    AppStrings.aboutUsFirst,
                    fontSize: 15.0,
                    // Increased fontSize for larger text
                    color: AppColors.subTextColot,
                    fontFamily: 'Poppins',
                    fontWeight: FontWeight.normal,
                    textAlign: TextAlign.start, // Center the text
                  ),
                  const SizedBox(height: 30.0,),
                  PngImage.asset(
                    'assets/our_story.png',
                    // Path to your PNG image
                    width: double.infinity,
                    height: 470.0
                  ),
                  const SizedBox(height: 30.0,),
                  TextUtils.displayLargeText(
                    AppStrings.weAreFabbyFurever,
                    fontSize: 20.0,
                    // Increased fontSize for larger text
                    color: AppColors.subTextColot,
                    fontFamily: 'DmSerifDisplay',
                    fontWeight: FontWeight.w300,
                    textAlign: TextAlign.center, // Center the text
                  ),
                  const SizedBox(height: 10.0,),
                  TextUtils.displayLargeText(
                   "We're passionate about pets and understand the happiness they bring into our lives, as well as the responsibilities that come with caring for them.\n Our mission is to simplify pet care, making it as effortless as the love you feel for your pets. We offer a range of products and services designed to maintain cleanliness, health, and happiness for your pets.\nLeveraging our extensive experience in pet care, we've crafted innovative, high-quality solutions tailored to the unique needs of your furry companions, ensuring a better living environment for both you and your pets.\n Ultimately, our aim is to strengthen the bond between pets and their hoomans, turning every shared moment into a delightful and treasured memory.",
                    fontSize: 15.0,
                    // Increased fontSize for larger text
                    color: AppColors.subTextColot,
                    fontFamily: 'Poppins',
                    fontWeight: FontWeight.normal,
                    textAlign: TextAlign.start, // Center the text
                  ),
                  const SizedBox(height: 30.0,),
                  PngImage.asset(
                    'assets/who_we_are.png',
                    // Path to your PNG image
                    width: double.infinity,
                    height: 470.0
                  ),
                  const SizedBox(height: 10.0,),
                ],
              ),
            )

        )
    );
  }
}