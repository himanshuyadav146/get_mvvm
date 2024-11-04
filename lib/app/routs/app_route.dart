import 'package:get/get.dart';
import 'package:getx_mvvm/app/bindings/auth_binding.dart';
import 'package:getx_mvvm/app/views/address_details/important_details.dart';
import 'package:getx_mvvm/app/views/persional_info/persional_info.dart';

import '../bindings/form_16_binding.dart';
import '../views/authentication/phone_no_view.dart';
import '../views/dashboard/dashboard.dart';
import '../views/form_16/form_16.dart';

class AppRoute {
  static final routs = [
    GetPage(
      name: '/phone_login',
      page: () => PhoneNoView(),
      binding: AuthBinding(), // Custom transition
    ),
    GetPage(
      name: '/important_details',
      page: () => ImportantDetails(),
      binding: AuthBinding(), // Custom transition
    ),
    GetPage(
      name: '/dashboard',
      page: () => const Dashboard(),
      binding: AuthBinding(), // Custom transition
    ),
    GetPage(
      name: '/persional_info',
      page: () => FinancialFormScreen(),
      binding: AuthBinding(), // Custom transition
    ),
    GetPage(
      name: '/form_16',
      page: () => UploadForm16(),
      binding: Form16Binding(), // Custom transition
    ),
  ];
}
