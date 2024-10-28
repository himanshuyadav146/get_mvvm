import 'package:get/get.dart';
import 'package:getx_mvvm/app/viewmodels/auth_viewmodel.dart';

import '../viewmodels/user_viewmodel.dart';

class AuthBinding extends Bindings {
  @override
  void dependencies() {
    // Get.put(UserViewModel());
    Get.lazyPut<UserViewModel>(() => UserViewModel());
    Get.lazyPut<AuthViewModel>(() => AuthViewModel());
    // Get.lazyPut(() => ThemeService());
  }
}
