import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../common_widgets/common_button.dart';
import '../../common_widgets/commont_text_form_field.dart';
import '../../viewmodels/payments/payment_viewmodel.dart';

class PaymentPage extends StatelessWidget {
  final PaymentViewModel viewModel = Get.find<PaymentViewModel>();

  PaymentPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Payment'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            // User Information Section
            _buildUserInfoSection(),
            SizedBox(height: 16.0),

            // Payment Summary Section
            _buildPaymentSummarySection(),

            Spacer(),
            // Check Out Button at the Bottom
            CommonButton(
              text: 'Check Out',
              onPressed: () {
                // Implement check out logic here
              },
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildUserInfoSection() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text('User Information',
            style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
        SizedBox(height: 8.0),
        CommonTextFormField(
          controller: viewModel.nameController,
          labelText: 'Name',
          validator: (value) =>
              value == null || value.isEmpty ? 'Please enter your name' : null,
        ),
        SizedBox(height: 16.0),
        CommonTextFormField(
          controller: viewModel.emailController,
          labelText: 'Email ID',
          validator: (value) =>
              value == null || value.isEmpty ? 'Please enter your email' : null,
        ),
        SizedBox(height: 16.0),
        CommonTextFormField(
          controller: viewModel.phoneController,
          labelText: 'Phone No',
          validator: (value) => value == null || value.isEmpty
              ? 'Please enter your phone number'
              : null,
        ),
      ],
    );
  }

  Widget _buildPaymentSummarySection() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text('Payment Summary',
            style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
        SizedBox(height: 8.0),

        // Coupon Code Field
        CommonTextFormField(
          controller: TextEditingController(),
          labelText: 'Coupon Code',
          // onFieldSubmitted: (code) {
          //   viewModel.applyCoupon(code);
          // },
        ),
        SizedBox(height: 16.0),

        // Payment Details
        _buildSummaryRow('Original Price:',
            viewModel.originalPrice.value.toStringAsFixed(2)),
        Obx(() => _buildSummaryRow(
            'Discounted Price:', viewModel.discountedPrice.toStringAsFixed(2))),
        Obx(() => _buildSummaryRow(
            'GST @ 18%:', viewModel.gstAmount.toStringAsFixed(2))),

        Divider(),
        Obx(() => _buildSummaryRow(
              'Total:',
              viewModel.totalAmount.toStringAsFixed(2),
              isBold: true,
            )),
      ],
    );
  }

  Widget _buildSummaryRow(String title, String value, {bool isBold = false}) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 4.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            title,
            style: TextStyle(
                fontWeight: isBold ? FontWeight.bold : FontWeight.normal),
          ),
          Text(
            value,
            style: TextStyle(
                fontWeight: isBold ? FontWeight.bold : FontWeight.normal),
          ),
        ],
      ),
    );
  }
}
