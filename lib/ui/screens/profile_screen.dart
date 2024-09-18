import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_fabby_demo/ui/screens/top_bar_detail.dart';
import 'package:image_picker/image_picker.dart';

import '../../colors/colors.dart';
import '../../strings/strings.dart';
import '../../utils/text_utils.dart';

class ProfileScreen extends StatefulWidget {
  @override
  _ProfileScreenState createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  TextEditingController nameController = TextEditingController();
  TextEditingController lastNameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController mobileController = TextEditingController();

  bool isMale = true;
  bool isEditingPersonalInfo = false;
  bool isEditingEmail = false;
  bool isEditingMobile = false;
  bool isDefaultImage = true; // For handling the "Delete Profile Picture" state

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const TopBarDetail(title: AppStrings.profile),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start, // Align all to the left
            children: [
              // Profile Picture Section
              Align(
                alignment: Alignment.centerLeft,
                child: TextUtils.displayLargeText(
                  AppStrings.profilePicture,
                  fontSize: 17.0,
                  color: AppColors.subTextColot,
                  fontFamily: 'Poppins',
                  fontWeight: FontWeight.bold,
                  textAlign: TextAlign.start, // Align text to the left
                ),
              ),
              const SizedBox(height: 10),
              Row(
                children: [
                  CircleAvatar(
                    radius: 50,
                    backgroundColor: Colors.pink.shade100,
                    backgroundImage: const AssetImage('assets/defaultProfile.png'),
                  ),
                  const SizedBox(width: 16),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      TextButton(
                        onPressed: () {
                          // Handle change image
                          setState(() {
                            isDefaultImage = false; // Enable delete option after image change
                          });
                        },
                        child: const Text(
                          'Change Image',
                          style: TextStyle(
                            color: Colors.blueAccent,
                            decoration: TextDecoration.underline,
                            decorationColor: Colors.blueAccent, // Set underline color to blue
                            fontFamily: 'Poppins',
                          ),
                        ),
                      ),
                      TextButton(
                        onPressed: isDefaultImage
                            ? null // Disable if it's the default image
                            : () {
                          // Handle delete image
                          setState(() {
                            isDefaultImage = true; // Reset to default state
                          });
                        },
                        child: const Text(
                          'Delete Profile Picture',
                          style: TextStyle(
                            color: Colors.blueAccent,
                            decoration: TextDecoration.underline,
                            decorationColor: Colors.blueAccent, // Set underline color to blue
                            fontFamily: 'Poppins',
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
              const SizedBox(height: 16),

              // Personal Information Section
              _buildSectionTitle('Personal Information', 'Edit', () {
                setState(() {
                  isEditingPersonalInfo = !isEditingPersonalInfo;
                });
              }),
              const SizedBox(height: 8),
              _buildTextField(nameController, 'Pranay', isEditingPersonalInfo),
              const SizedBox(height: 8),
              _buildTextField(lastNameController, 'Barua', isEditingPersonalInfo),

              const SizedBox(height: 16),

              // Gender Section
              _buildSectionTitle('Your Gender', '', null),
              Row(
                children: [
                  Expanded(
                    child: RadioListTile<bool>(
                      value: true,
                      groupValue: isMale,
                      onChanged: (bool? value) {
                        setState(() {
                          isMale = value!;
                        });
                      },
                      title: const Text('Male'),
                      activeColor: Colors.pink,
                    ),
                  ),
                  Expanded(
                    child: RadioListTile<bool>(
                      value: false,
                      groupValue: isMale,
                      onChanged: (bool? value) {
                        setState(() {
                          isMale = value!;
                        });
                      },
                      title: const Text('Female'),
                      activeColor: Colors.pink,
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 16),
              _buildSaveButton(),
              const SizedBox(height: 16),

              // Email Section
              _buildSectionTitle('Email Address', 'Edit', () {
                setState(() {
                  isEditingEmail = !isEditingEmail;
                });
              }),
              const SizedBox(height: 8),
              _buildTextField(emailController, 'pranay@appic.me', isEditingEmail),
              const SizedBox(height: 16),
              _buildSaveButton(), // Save button moved to left

              // Mobile Number Section
              const SizedBox(height: 16),
              _buildSectionTitle('Mobile Number', 'Edit', () {
                setState(() {
                  isEditingMobile = !isEditingMobile;
                });
              }),
              const SizedBox(height: 8),
              _buildTextField(mobileController, '123456789', isEditingMobile),
              const SizedBox(height: 16),
              // _buildSectionTitle('Mobile Number', 'Edit', () {
              //   setState(() {
              //     // Similar to email, handle edit state here if needed.
              //   });
              // }),
              // const SizedBox(height: 8),
              // _buildTextField(mobileController, '123456789', false),
              const SizedBox(height: 16),
              _buildSaveButton(), // Save button moved to left

              const SizedBox(height: 24),
              // Reset Password Section
              OutlinedButton(
                onPressed: () {
                  // Handle password reset
                },
                child: const Text('Reset Password', style: TextStyle(color: Colors.black)),
                style: OutlinedButton.styleFrom(
                  side: const BorderSide(color: Colors.black),
                ),
              ),
              const SizedBox(height: 24),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildTextField(TextEditingController controller, String hint, bool isEditable) {
    return TextField(
      controller: controller,
      enabled: isEditable, // Enable/disable based on edit state
      decoration: InputDecoration(
        hintText: hint,
        filled: true,
        fillColor: isEditable ? Colors.white : Colors.grey.shade200, // Change color when editable
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8),
          borderSide: BorderSide.none,
        ),
      ),
    );
  }

  Widget _buildSectionTitle(String title, String actionText, VoidCallback? onActionTap) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(title, style: const TextStyle(fontWeight: FontWeight.bold)),
        actionText.isNotEmpty
            ? TextButton(
          onPressed: onActionTap,
          child: Text(actionText),
        )
            : const SizedBox.shrink(),
      ],
    );
  }

  Widget _buildSaveButton() {
    return Align(
      alignment: Alignment.centerLeft, // Align the button to the left
      child: ElevatedButton(
        onPressed: () {
          // Handle save action
        },
        child: const Text('Save', style: TextStyle(color: Colors.white)),
        style: ElevatedButton.styleFrom(
          backgroundColor: const Color(0xFFED9CAF),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(24),
          ),
        ),
      ),
    );
  }
}



// class _ProfileScreenState extends State<ProfileScreen> {
//   TextEditingController nameController = TextEditingController();
//   TextEditingController lastNameController = TextEditingController();
//   TextEditingController emailController = TextEditingController();
//   TextEditingController mobileController = TextEditingController();
//
//   bool isMale = true;
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: const TopBarDetail(title: AppStrings.profile),
//       body: SingleChildScrollView(
//         child: Padding(
//           padding: const EdgeInsets.all(16.0),
//           child: Column(
//             children: [
//               // Profile Picture Section
//               TextUtils.displayLargeText(
//                 AppStrings.profilePicture,
//                 fontSize: 17.0,
//                 // Increased fontSize for larger text
//                 color: AppColors.subTextColot,
//                 fontFamily: 'Poppins',
//                 fontWeight: FontWeight.bold,
//                 textAlign: TextAlign.start, // Center the text
//               ),
//               const SizedBox(height: 10),
//               CircleAvatar(
//                 radius: 50,
//                 backgroundColor: Colors.pink.shade100,
//                 backgroundImage: const AssetImage('assets/defaultProfile.png'),
//               ),
//               SizedBox(height: 8),
//               TextButton(
//                 onPressed: () {
//                   // Handle change image
//                 },
//                 child: Text(
//                   'Change Image',
//                   style: TextStyle(color: Colors.blueAccent, fontFamily: 'Poppins'),
//                 ),
//               ),
//               TextButton(
//                 onPressed: () {
//                   // Handle delete image
//                 },
//                 child: Text(
//                   'Delete Profile Picture',
//                   style: TextStyle(color: Colors.blueAccent, fontFamily: 'Poppins'),
//                 ),
//               ),
//               SizedBox(height: 16),
//
//               // Personal Information Section
//               _buildSectionTitle('Personal Information', 'Edit'),
//               SizedBox(height: 8),
//               _buildTextField(nameController, 'Pranay'),
//               SizedBox(height: 8),
//               _buildTextField(lastNameController, 'Barua'),
//
//               SizedBox(height: 16),
//
//               // Gender Section
//               _buildSectionTitle('Your Gender', ''),
//               Row(
//                 children: [
//                   Expanded(
//                     child: RadioListTile<bool>(
//                       value: true,
//                       groupValue: isMale,
//                       onChanged: (bool? value) {
//                         setState(() {
//                           isMale = value!;
//                         });
//                       },
//                       title: Text('Male'),
//                       activeColor: Colors.pink,
//                     ),
//                   ),
//                   Expanded(
//                     child: RadioListTile<bool>(
//                       value: false,
//                       groupValue: isMale,
//                       onChanged: (bool? value) {
//                         setState(() {
//                           isMale = value!;
//                         });
//                       },
//                       title: Text('Female'),
//                       activeColor: Colors.pink,
//                     ),
//                   ),
//                 ],
//               ),
//               SizedBox(height: 16),
//               _buildSaveButton(),
//
//               SizedBox(height: 16),
//               // Email Section
//               _buildSectionTitle('Email Address', 'Edit'),
//               SizedBox(height: 8),
//               _buildTextField(emailController, 'pranay@appic.me'),
//               SizedBox(height: 16),
//               _buildSaveButton(),
//
//               // Mobile Number Section
//               SizedBox(height: 16),
//               _buildSectionTitle('Mobile Number', 'Edit'),
//               SizedBox(height: 8),
//               _buildTextField(mobileController, '123456789'),
//               SizedBox(height: 16),
//               _buildSaveButton(),
//
//               SizedBox(height: 24),
//               // Reset Password Section
//               OutlinedButton(
//                 onPressed: () {
//                   // Handle password reset
//                 },
//                 child: Text('Reset Password', style: TextStyle(color: Colors.black)),
//                 style: OutlinedButton.styleFrom(
//                   side: BorderSide(color: Colors.black),
//                 ),
//               ),
//               SizedBox(height: 24),
//             ],
//           ),
//         ),
//       ),
//     );
//   }
//
//   Widget _buildTextField(TextEditingController controller, String hint) {
//     return TextField(
//       controller: controller,
//       decoration: InputDecoration(
//         hintText: hint,
//         filled: true,
//         fillColor: Colors.grey.shade200,
//         border: OutlineInputBorder(
//           borderRadius: BorderRadius.circular(8),
//           borderSide: BorderSide.none,
//         ),
//       ),
//     );
//   }
//
//   Widget _buildSectionTitle(String title, String actionText) {
//     return Row(
//       mainAxisAlignment: MainAxisAlignment.spaceBetween,
//       children: [
//         Text(title, style: TextStyle(fontWeight: FontWeight.bold)),
//         actionText.isNotEmpty
//             ? TextButton(
//           onPressed: () {
//             // Handle edit action
//           },
//           child: Text(actionText),
//         )
//             : SizedBox.shrink(),
//       ],
//     );
//   }
//
//   Widget _buildSaveButton() {
//     return ElevatedButton(
//       onPressed: () {
//         // Handle save action
//       },
//       child: Text('Save'),
//       style: ElevatedButton.styleFrom(
//         backgroundColor: Color(0xFFED9CAF),
//         shape: RoundedRectangleBorder(
//           borderRadius: BorderRadius.circular(24),
//         ),
//       ),
//     );
//   }
// }
