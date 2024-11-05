import 'package:get/get.dart';
import 'package:getx_mvvm/app/bindings/auth_binding.dart';
import 'package:getx_mvvm/app/views/address_details/important_details.dart';
import 'package:getx_mvvm/app/views/other_income/other_income.dart';
import 'package:getx_mvvm/app/views/persional_info/persional_info.dart';

import '../bindings/bank_details_binding.dart';
import '../bindings/form_16_binding.dart';
import '../bindings/other_income_binding.dart';
import '../bindings/payments_bindings.dart';
import '../views/authentication/phone_no_view.dart';
import '../views/bank_details/bank_details.dart';
import '../views/dashboard/dashboard.dart';
import '../views/form_16/form_16.dart';
import '../views/other_doc/other_documents.dart';
import '../views/payments/payment_details.dart';

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
    GetPage(
      name: '/bank_details',
      page: () => BankDetails(),
      binding: BankDetailsBinding(), // Custom transition
    ),
    GetPage(
      name: '/other_documents',
      page: () => OtherDocuments(),
      binding: Form16Binding(), // Custom transition
    ),
    GetPage(
      name: '/other_income',
      page: () => OtherIncome(),
      binding: OtherIncomeBinding(), // Custom transition
    ),
    GetPage(
      name: '/payments_details',
      page: () => PaymentPage(),
      binding: PaymentBindings(), // Custom transition
    ),
  ];
}
