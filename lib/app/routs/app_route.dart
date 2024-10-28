import 'package:get/get.dart';
import 'package:getx_mvvm/app/bindings/auth_binding.dart';
import 'package:getx_mvvm/app/views/persional_info/persional_info.dart';

import '../bindings/form_16_binding.dart';
import '../views/authentication/otp_verification_view.dart';
import '../views/authentication/phone_no_view.dart';
import '../views/dashboard/dashboard.dart';
import '../views/form_16/form_16.dart';

class AppRoute {
  static final routs = [
    GetPage(
      name: '/phone_login',
      page: () => PhoneNoView(),
      binding: AuthBinding(),
      transition: Transition.cupertino, // Custom transition
    ),
    GetPage(
      name: '/otp_verification',
      page: () => OtpVerificationView(),
      binding: AuthBinding(),
      transition: Transition.fadeIn, // Custom transition
    ),
    GetPage(
      name: '/dashboard',
      page: () => const Dashboard(),
      binding: AuthBinding(),
      transition: Transition.zoom, // Custom transition
    ),
    GetPage(
      name: '/persional_info',
      page: () => FinancialFormScreen(),
      binding: AuthBinding(),
      transition: Transition.zoom, // Custom transition
    ),
    GetPage(
      name: '/form_16',
      page: () => UploadForm16(),
      binding: Form16Binding(),
      transition: Transition.rightToLeft, // Custom transition
    ),
  ];
}
