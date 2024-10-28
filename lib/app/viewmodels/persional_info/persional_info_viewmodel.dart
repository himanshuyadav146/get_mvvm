import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../models/persional_info/persion_info_model.dart';

class FinancialFormViewModel extends GetxController {
  // Controllers for text fields
  final firstNameController = TextEditingController();
  final middleNameController = TextEditingController();
  final lastNameController = TextEditingController();
  final mobileNumberController = TextEditingController();
  final emailController = TextEditingController();
  final panNumberController = TextEditingController();
  final dobController = TextEditingController();

  // Selected financial year
  final selectedYear = ''.obs;

  // Available financial years
  final List<String> financialYears = ['2021-2022', '2022-2023', '2023-2024'];

  // Method to validate and submit the form
  void submitForm() {
    if (_validateForm()) {
      // Create a user model
      final user = User(
        firstName: firstNameController.text,
        middleName: middleNameController.text,
        lastName: lastNameController.text,
        mobileNumber: mobileNumberController.text,
        email: emailController.text,
        panNumber: panNumberController.text,
        dob: dobController.text,
        financialYear: selectedYear.value,
      );

      // Perform any further actions with the user data
      // e.g., send it to the server, navigate to the next screen, etc.
      Get.snackbar('Success', 'Form submitted successfully!');
    } else {
      Get.snackbar('Error', 'Please fill in all fields correctly');
    }
  }

  // Method to validate the form
  bool _validateForm() {
    if (firstNameController.text.isEmpty ||
        lastNameController.text.isEmpty ||
        mobileNumberController.text.isEmpty ||
        emailController.text.isEmpty ||
        panNumberController.text.isEmpty ||
        dobController.text.isEmpty ||
        selectedYear.value.isEmpty) {
      return false;
    }
    return true;
  }

  @override
  void onClose() {
    // Dispose of the controllers when the ViewModel is disposed
    firstNameController.dispose();
    middleNameController.dispose();
    lastNameController.dispose();
    mobileNumberController.dispose();
    emailController.dispose();
    panNumberController.dispose();
    dobController.dispose();
    super.onClose();
  }
}
