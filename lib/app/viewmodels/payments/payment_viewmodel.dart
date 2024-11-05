import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

class PaymentViewModel extends GetxController {
  // User information fields
  final nameController = TextEditingController();
  final emailController = TextEditingController();
  final phoneController = TextEditingController();

  // Payment summary fields
  final originalPrice = 1000.0.obs; // Example original price
  final discount = 0.1.obs; // Example discount (10%)
  final gstRate = 0.18; // GST at 18%
  final couponCode = ''.obs; // Coupon code field

  // Calculated values
  double get discountedPrice => originalPrice.value * (1 - discount.value);
  double get gstAmount => discountedPrice * gstRate;
  double get totalAmount => discountedPrice + gstAmount;

  // Method to apply a coupon
  void applyCoupon(String code) {
    // Example: Apply a 5% discount for a specific coupon code
    if (code == 'DISCOUNT5') {
      discount.value = 0.15; // Change discount to 15%
    } else {
      discount.value = 0.1; // Default discount
    }
  }

  // Dispose controllers
  @override
  void onClose() {
    nameController.dispose();
    emailController.dispose();
    phoneController.dispose();
    super.onClose();
  }
}
