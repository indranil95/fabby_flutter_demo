import 'package:flutter/material.dart';
import 'package:flutter_fabby_demo/colors/colors.dart';
import 'package:flutter_fabby_demo/utils/text_utils.dart';
import 'package:lottie/lottie.dart';

class OrderSuccessCard extends StatefulWidget {
  final String orderId;
  final VoidCallback onButtonPressed;

  const OrderSuccessCard({Key? key, required this.orderId,required this.onButtonPressed}) : super(key: key);

  @override
  _OrderSuccessCardState createState() => _OrderSuccessCardState();
}

class _OrderSuccessCardState extends State<OrderSuccessCard> {
  @override
  Widget build(BuildContext context) {
    return Card(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10),
      ),
      margin: const EdgeInsets.symmetric(horizontal: 16),
      // Optional margin for centering
      child: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TextUtils.display(
              'Order placed successfully',
              fontSize: 28,
              fontFamily: 'DMSerifDisplay',
              // Equivalent to `@style/style_dmserif_regular`
              color: Colors.black,
              // Equivalent to `@string/order_place_successfully`\
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 10),
            TextUtils.displayLargeText(
              widget.orderId, // Replace with actual message or string
              fontSize: 13,
              fontFamily: 'Poppins',
              // Equivalent to `@style/style_poppins_regular`
              color: Colors.black,
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 20),
            Lottie.asset(
              'assets/tick_anim_new.json', // Path to your lottie animation
              width: 200,
              height: 100,
              fit: BoxFit.contain,
              repeat: true,
              animate: true,
            ),
            const SizedBox(height: 10),
            Card(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(20),
              ),
              color: AppColors.fabbyBondiBlue,
              // Equivalent to `@color/fabby_bondi_blue`
              margin: const EdgeInsets.only(top: 10, bottom: 20),
              child: InkWell(
                onTap: () {
                  widget.onButtonPressed(); // Call the callback here
                  Navigator.of(context).pop();
                },
                child: Padding(
                  padding: const EdgeInsets.symmetric(
                      vertical: 8.0, horizontal: 20.0),
                  child: Center(
                    child: TextUtils.display(
                      'OK', // Equivalent to `@string/ok`
                      fontFamily: 'PoppinsSemiBold',
                      fontSize: 14,
                      color: Colors.white,
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
