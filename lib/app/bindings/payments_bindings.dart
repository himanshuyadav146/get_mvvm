import 'package:get/get.dart';

import '../viewmodels/payments/payment_viewmodel.dart';

class PaymentBindings extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<PaymentViewModel>(() => PaymentViewModel());
  }
}
