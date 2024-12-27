import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:getx_mvvm/app/common_widgets/common_scafold.dart';

import '../../common_widgets/common_button.dart';
import '../../common_widgets/commont_text_form_field.dart';
import '../../viewmodels/auth_viewmodel.dart';
import 'otp_verification_view.dart';

class PhoneNoView extends StatelessWidget {
  final TextEditingController phoneController = TextEditingController();
  final PageController pageController = PageController();

  PhoneNoView({super.key});

  @override
  Widget build(BuildContext context) {
    final AuthViewModel authViewModel = Get.find();
    return CommonScaffold(
      title: 'Login',
      isAppBar: false,
      body: Stack(
        children: [
          Container(
            height: double.infinity,
            width: double.infinity,
            decoration: const BoxDecoration(
              gradient: LinearGradient(colors: [
                Color(0xff6468F6),
                Color(0xff6468F6),
              ]),
            ),
            child: const Padding(
              padding: EdgeInsets.only(left: 20, top: 50),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Welcome',
                    style: TextStyle(
                        fontSize: 22,
                        fontWeight: FontWeight.bold,
                        color: Color(0xffffffff)),
                    textAlign: TextAlign.left,
                  ),
                  Text(
                    "Add your phone number. we'll send you a verification code so we know you're real",
                    style: TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.bold,
                      color: Color(0xffffffff),
                    ),
                    textAlign: TextAlign.left,
                  ),
                ],
              ),
            ),
          ),
          _PhoneAuthPageView(),
        ],
      ),
      isDrawer: false,
      isResizeToAvoidBottomInset: true,
    );
  }
}

class _PhoneAuthPageView extends StatefulWidget {
  const _PhoneAuthPageView({super.key});

  @override
  State<_PhoneAuthPageView> createState() => _PhoneAuthPageViewState();
}

class _PhoneAuthPageViewState extends State<_PhoneAuthPageView> {
  late PageController _pageViewController;
  int _currentPageIndex = 0;
  final AuthViewModel authViewModel = Get.find();

  @override
  void initState() {
    super.initState();
    _pageViewController = PageController();

    ever(authViewModel.otpSent, (isOtpSent) {
      if (isOtpSent) {
        _navigateToOtpPage();
      }
    });
  }

  @override
  void dispose() {
    super.dispose();
    _pageViewController.dispose();
  }

  void _navigateToOtpPage() {
    setState(() {
      _currentPageIndex = 1;
    });
    _pageViewController.animateToPage(
      _currentPageIndex,
      duration: const Duration(milliseconds: 300),
      curve: Curves.easeInOut,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 200),
      child: Container(
        height: double.infinity,
        width: double.infinity,
        decoration: const BoxDecoration(
            borderRadius: BorderRadius.only(
                topLeft: Radius.circular(40), topRight: Radius.circular(40)),
            color: Color(0xffffffff)),
        child: Padding(
          padding: const EdgeInsets.only(left: 16, right: 16),
          child: PageView(
            controller: _pageViewController,
            physics: const NeverScrollableScrollPhysics(),
            children: <Widget>[
              Center(
                child: _buildPhoneNumberPage(authViewModel),
              ),
              OtpVerificationView(
                pageController: _pageViewController,
              ),
            ],
          ),
        ),
      ),
    );
  }
}

Widget _buildPhoneNumberPage(AuthViewModel authViewModel) {
  final TextEditingController phoneController = TextEditingController();
  return Column(
    children: [
      Padding(
        padding: EdgeInsets.only(top: 30.0),
        child: Container(
          width: 200,
          height: 200,
          decoration: BoxDecoration(
            color: Colors.deepPurple.shade50,
            shape: BoxShape.circle,
          ),
          child: Image.asset(
            'assets/images/illustration-2.png',
          ),
        ),
      ),
      Container(
        padding: const EdgeInsets.all(28),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(12),
        ),
        child: Column(
          children: [
            CommonTextFormField(
              controller: phoneController,
              keyboardType: TextInputType.number,
              prefixText: '(+91)',
              labelText: 'Phone Number',
              suffixIcon: Icons.check_circle,
              errorIcon: Icons.error,
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return 'Phone number cannot be empty';
                } else if (value.length < 10) {
                  return 'Phone number must be at least 10 digits';
                }
                return null;
              },
            ),
            const SizedBox(
              height: 22,
            ),
            Obx(() {
              return authViewModel.isLoading.value
                  ? const CircularProgressIndicator()
                  : SizedBox(
                      width: double.infinity,
                      child: CommonButton(
                        text: 'Send OTP',
                        onPressed: () {
                          authViewModel.sendOtp(phoneController.text);
                        },
                      ));
            }),
          ],
        ),
      )
    ],
  );
}
