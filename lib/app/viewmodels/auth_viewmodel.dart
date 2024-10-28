import 'package:get/get.dart';

import '../data/auth_repository.dart';
import '../models/user.dart';

class AuthViewModel extends GetxController {
  final AuthRepository _authRepository = AuthRepository();
  var user = Rxn<User>();
  var isLoading = false.obs;
  var otpSent = false.obs;
  var phoneNumber = ''.obs;

  Future<void> sendOtp(String phone) async {
    isLoading.value = true;
    otpSent.value = await _authRepository.sendOtp(phone);
    isLoading.value = false;

    if (otpSent.value) {
      phoneNumber.value = phone;
      Get.toNamed('/otp_verification');
    } else {
      Get.snackbar('Error', 'Failed to send OTP');
    }
  }

  Future<void> verifyOtp(String otp) async {
    isLoading.value = true;
    user.value = await _authRepository.verifyOtp(otp);
    isLoading.value = false;

    if (user.value != null) {
      Get.offAllNamed('/dashboard');
    } else {
      Get.snackbar('Error', 'Invalid OTP');
    }
  }
}
