import 'package:get/get.dart';

import '../models/user.dart';

class UserViewModel extends GetxController {
  var user = User(name: "John Doe", age: 25).obs;

  void updateUser(String name, int age) {
    user.update((val) {
      val?.name = name;
      val?.age = age;
    });
  }
}
