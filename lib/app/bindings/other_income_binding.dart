import 'package:get/get.dart';
import 'package:getx_mvvm/app/viewmodels/other_income/orther_income_viewmodel.dart';

class OtherIncomeBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<OtherIncomeViewModel>(() => OtherIncomeViewModel());
  }
}
