import 'package:get/get.dart';
import 'package:getx_mvvm/app/viewmodels/other_doc/other_documents_viewmodel.dart';

import '../viewmodels/form_16/upload_view_model.dart';

class Form16Binding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<UploadController>(() => UploadController());
    Get.lazyPut<UploadOtherDocumentsController>(
        () => UploadOtherDocumentsController());
  }
}
