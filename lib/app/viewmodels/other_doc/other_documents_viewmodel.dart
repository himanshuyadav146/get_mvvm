import 'package:get/get.dart';

import '../../models/form_16/upload_model.dart';

class UploadOtherDocumentsController extends GetxController {
  // List of uploaded items
  var uploadedItems = <UploadItem>[].obs;

  // Function to simulate uploading a file
  void uploadFile(String fileName) {
    uploadedItems.add(UploadItem(fileName));
  }

  // Function to clear the uploaded list
  void clearUploads() {
    uploadedItems.clear();
  }
}
