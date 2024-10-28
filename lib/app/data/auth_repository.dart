// app/data/auth_repository.dart
import '../models/user.dart';

class AuthRepository {
  Future<bool> sendOtp(String phoneNumber) async {
    // Simulate sending OTP (API call)
    await Future.delayed(const Duration(seconds: 2));
    return true; // Assume OTP is sent successfully
  }

  Future<User?> verifyOtp(String otp) async {
    // Simulate OTP verification (API call)
    await Future.delayed(const Duration(seconds: 2));
    if (otp == "123456") {
      return User(name: "Verified User", age: 30);
    }
    return null;
  }
}
