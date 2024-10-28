import 'package:get/get.dart';

import '../viewmodels/form_16/upload_view_model.dart';

class Form16Binding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<UploadController>(() => UploadController());
  }
}
