import 'package:flutter/foundation.dart';
import 'package:url_launcher/url_launcher.dart';

class EmailSender {
  // Function to open Gmail with recipient prefilled
  static void openGmail(String recipientEmail) async {
    final Uri emailUri = Uri(
      scheme: 'mailto',
      path: recipientEmail,
    );

    try {
      if (await canLaunchUrl(emailUri)) {
        await launchUrl(emailUri);
      } else {
        // Handle the case where no email client is installed
        if (kDebugMode) {
          print('No email clients installed.');
        }
      }
    } catch (e) {
      // Handle any errors that might occur
      if (kDebugMode) {
        print('Error: $e');
      }
    }
  }
}