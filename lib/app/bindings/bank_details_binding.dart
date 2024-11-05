import 'package:get/get.dart';

import '../viewmodels/bank_details/bank_account_viewmodel.dart';

class BankDetailsBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<BankAccountViewModel>(() => BankAccountViewModel());
  }
}
