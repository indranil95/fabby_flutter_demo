import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_fabby_demo/models/profile_model.dart';
import 'package:flutter_fabby_demo/ui/screens/reset_password_Screen.dart';
import 'package:flutter_fabby_demo/ui/screens/top_bar_detail.dart';
import 'package:flutter_fabby_demo/viewModels/profile_viewmodel.dart';
import 'package:image_picker/image_picker.dart';
import 'package:provider/provider.dart';

import '../../colors/colors.dart';
import '../../strings/strings.dart';
import '../../utils/logger_service.dart';
import '../../utils/navigation_service.dart';
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

  late ProfileViewModel viewModel;
  bool isMale = true;
  bool isEditingPersonalInfo = false;
  bool isEditingEmail = false;
  bool isEditingMobile = false;
  bool isDefaultImage = true; // For handling the "Delete Profile Picture" state

  // late PickedFile _imageFile;
  // final ImagePicker _picker = ImagePicker();
  File? _imageFile;  // Update to File? type for picked images
  final ImagePicker _picker = ImagePicker();

  @override
  void initState() {
    super.initState();
    viewModel = Provider.of<ProfileViewModel>(context, listen: false);
    WidgetsBinding.instance.addPostFrameCallback((_) {
      _fetchProfileData();
    });
  }

  Future<void> _fetchProfileData() async {
    // Fetch mainId and guestId asynchronously
    // String mainId = await viewModel.getMainId();
    //
    // LoggerService.d("main", mainId);
    // int userId = int.parse(mainId);
    viewModel.getProfile(49);
    if (viewModel.profileData != null) {
      // Set the profile data to the controllers
      setState(() {
        // nameController.text = viewModel.profileData?.data?[0].fullname ?? '';
        lastNameController.text = viewModel.profileData?.data?[0].lastname ?? '';
        emailController.text = viewModel.profileData?.data?[0].email ?? '';
        mobileController.text = viewModel.profileData?.data?[0].mobile ?? '';
        if ((viewModel.profileData?.data?[0].gender ?? '') == 'Male') {
          isMale = true;
        }  // Assuming gender is a string
        // Handle profile picture and other fields if needed
        LoggerService.d('Fetched Profile Data', viewModel.profileData?.data?[0]);
      });

    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const TopBarDetail(title: AppStrings.profile),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            // Align all to the left
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
                    backgroundImage: _imageFile == null
                        ? const AssetImage('assets/defaultProfile.png') // Default profile image
                        : FileImage(_imageFile!) as ImageProvider, // Selected image
                  ),
                  const SizedBox(width: 16),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      TextButton(
                        onPressed: () {
                          // Handle change image
                          showModalBottomSheet(
                            context: context,
                            builder: ((builder) => bottomSheet()),
                          );
                          // setState(() {
                          //   isDefaultImage =
                          //   false; // Enable delete option after image change
                          // });
                        },
                        child: const Text(
                          'Change Image',
                          style: TextStyle(
                            color: Colors.blueAccent,
                            decoration: TextDecoration.underline,
                            decorationColor: Colors.blueAccent,
                            // Set underline color to blue
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
                            decorationColor: Colors.blueAccent,
                            // Set underline color to blue
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
              _buildTextField(lastNameController, '', isEditingPersonalInfo),

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
              _buildTextField(emailController, '', isEditingEmail),
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
              _buildTextField(mobileController, '', isEditingMobile),
              const SizedBox(height: 16),
              const SizedBox(height: 16),
              _buildSaveButton(), // Save button moved to left

              const SizedBox(height: 24),
              // Reset Password Section
              OutlinedButton(
                onPressed: () {
                  NavigationService.navigateToWithData(ResetPasswordScreen());
                },
                child: const Text(
                    'Reset Password', style: TextStyle(color: Colors.black)),
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

  Widget _buildTextField(TextEditingController controller, String hint,
      bool isEditable) {
    return TextField(
      controller: controller,
      enabled: isEditable, // Enable/disable based on edit state
      decoration: InputDecoration(
        hintText: hint,
        filled: true,
        fillColor: isEditable ? Colors.white : Colors.grey.shade200,
        // Change color when editable
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8),
          borderSide: BorderSide.none,
        ),
      ),
    );
  }

  Widget _buildSectionTitle(String title, String actionText,
      VoidCallback? onActionTap) {
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
          _saveProfile();
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

  Widget bottomSheet() {
    return Container(
      height: 100.0,
      width: MediaQuery.of(context).size.width,
      margin: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
      child: Column(
        children: <Widget>[
          const Text(
            "Choose Profile Photo",
            style: TextStyle(fontSize: 20.0),
          ),
          const SizedBox(height: 20),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              IconButton(
                icon: const Icon(Icons.camera),
                onPressed: () {
                  takePhoto(ImageSource.camera);
                  Navigator.of(context).pop(); // Close the bottom sheet after taking a photo
                },
              ),
              const Text("Camera"),
              const SizedBox(width: 20),
              IconButton(
                icon: const Icon(Icons.image),
                onPressed: () {
                  takePhoto(ImageSource.gallery);
                  Navigator.of(context).pop(); // Close the bottom sheet after selecting an image
                },
              ),
              const Text("Gallery"),
            ],
          )
        ],
      ),
    );
  }

  // Function to take a photo or select from the gallery
  void takePhoto(ImageSource source) async {
    final pickedFile = await _picker.pickImage(source: source);

    setState(() {
      if (pickedFile != null) {
        _imageFile = File(pickedFile.path);  // Assign picked image to the _imageFile variable
        isDefaultImage = false;  // Update the image state
      }
    });
  }

  void _saveProfile() {
    // Collect the data from text controllers and other inputs
    String firstName = nameController.text;
    LoggerService.d("value",nameController.text);
    String lastName = lastNameController.text;
    LoggerService.d("value",lastNameController.text);
    String email = emailController.text;
    LoggerService.d("value",emailController.text);
    String mobile = mobileController.text;
    LoggerService.d("value",mobileController.text);
    String gender = isMale ? 'Male' : 'Female';
    File? profileImage = _imageFile; // Optional profile image

    // Example: Creating a map to hold the data
    Map<String, dynamic> profileData = {
      'firstName': firstName,
      'lastName': lastName,
      'email': email,
      'mobile': mobile,
      'gender': gender,
      // 'profileImage': profileImage?.path, // Pass the file path or handle image upload separately
    };

    // Print or log the profile data for debugging
    LoggerService.d("value",profileData);

    // Call your API method here with the profileData
    viewModel.updateProfile(profileData);
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
