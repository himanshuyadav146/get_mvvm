import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:getx_mvvm/app/common_widgets/common_button.dart';
import 'package:getx_mvvm/app/common_widgets/common_scafold.dart';

import '../../viewmodels/auth_viewmodel.dart';

class OtpVerificationView extends StatelessWidget {
  final TextEditingController otp1Controller = TextEditingController();
  final TextEditingController otp2Controller = TextEditingController();
  final TextEditingController otp3Controller = TextEditingController();
  final TextEditingController otp4Controller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final AuthViewModel authViewModel = Get.find();

    return CommonScaffold(
      title: 'Verify OTP',
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 24, horizontal: 32),
          child: Column(
            children: [
              SizedBox(
                height: 18,
              ),
              Container(
                width: 200,
                height: 200,
                decoration: BoxDecoration(
                  color: Colors.deepPurple.shade50,
                  shape: BoxShape.circle,
                ),
                child: Image.asset(
                  'assets/images/illustration-3.png',
                ),
              ),
              SizedBox(
                height: 24,
              ),
              Text(
                'Verification',
                style: TextStyle(
                  fontSize: 22,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(
                height: 10,
              ),
              Text(
                "Enter your OTP code number",
                style: TextStyle(
                  fontSize: 14,
                  fontWeight: FontWeight.bold,
                  color: Colors.black38,
                ),
                textAlign: TextAlign.center,
              ),
              SizedBox(
                height: 28,
              ),
              Container(
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(12),
                ),
                child: Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        _textFieldOTP(
                            first: true, last: false, context: context),
                        _textFieldOTP(
                            first: false, last: false, context: context),
                        _textFieldOTP(
                            first: false, last: false, context: context),
                        _textFieldOTP(
                            first: false, last: true, context: context),
                      ],
                    ),
                    SizedBox(
                      height: 22,
                    ),
                    Obx(() {
                      return authViewModel.isLoading.value
                          ? const CircularProgressIndicator()
                          : SizedBox(
                              width: double.infinity,
                              child: CommonButton(
                                text: 'Verify OTP',
                                onPressed: () {
                                  authViewModel.verifyOtp('123456');
                                },
                              ));
                    }),
                  ],
                ),
              ),
              SizedBox(
                height: 18,
              ),
              Text(
                "Didn't you receive any code?",
                style: TextStyle(
                  fontSize: 14,
                  fontWeight: FontWeight.bold,
                  color: Colors.black38,
                ),
                textAlign: TextAlign.center,
              ),
              SizedBox(
                height: 18,
              ),
              Text(
                "Resend New Code",
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                  color: Colors.purple,
                ),
                textAlign: TextAlign.center,
              ),
            ],
          ),
        ),
      ),
      isDrawer: false,
      isResizeToAvoidBottomInset: true,
    );
  }

  Widget _textFieldOTP(
      {required bool first, last, required BuildContext context}) {
    return Container(
      height: 85,
      child: AspectRatio(
        aspectRatio: 1.0,
        child: TextField(
          autofocus: true,
          onChanged: (value) {
            if (value.length == 1 && last == false) {
              FocusScope.of(context).nextFocus();
            }
            if (value.length == 0 && first == false) {
              FocusScope.of(context).previousFocus();
            }
          },
          showCursor: false,
          readOnly: false,
          textAlign: TextAlign.center,
          style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
          keyboardType: TextInputType.number,
          maxLength: 1,
          decoration: InputDecoration(
            counter: Offstage(),
            enabledBorder: OutlineInputBorder(
                borderSide: BorderSide(width: 2, color: Colors.black12),
                borderRadius: BorderRadius.circular(12)),
            focusedBorder: OutlineInputBorder(
                borderSide: BorderSide(width: 2, color: Colors.purple),
                borderRadius: BorderRadius.circular(12)),
          ),
        ),
      ),
    );
  }
}
