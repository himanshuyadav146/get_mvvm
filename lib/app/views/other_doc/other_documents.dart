import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../common_widgets/common_button.dart';
import '../../common_widgets/common_scafold.dart';
import '../../common_widgets/common_upload_card.dart';
import '../../viewmodels/other_doc/other_documents_viewmodel.dart';

class OtherDocuments extends StatelessWidget {
  final UploadOtherDocumentsController uploadController =
      Get.put(UploadOtherDocumentsController());

  OtherDocuments({super.key});

  @override
  Widget build(BuildContext context) {
    return CommonScaffold(
      title: 'Upload Other Documents',
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            // Upload Card
            CustomUploadCard(
              title: 'Upload your file',
              icon: Icons.cloud_upload,
              // Simulate an upload when the card is tapped
              onTap: () {
                uploadController.uploadFile(
                    'UploadedFile_${uploadController.uploadedItems.length + 1}.txt');
              },
            ),
            const SizedBox(height: 20),
            // List of uploaded items
            Expanded(
              child: Obx(() {
                if (uploadController.uploadedItems.isEmpty) {
                  return const Center(child: Text('No files uploaded.'));
                }
                return ListView.builder(
                  itemCount: uploadController.uploadedItems.length,
                  itemBuilder: (context, index) {
                    final item = uploadController.uploadedItems[index];
                    return ListTile(
                      leading: const Icon(Icons.file_present),
                      title: Text(item.fileName),
                    );
                  },
                );
              }),
            ),
            CommonButton(
                text: 'Next',
                onPressed: () {
                  Get.toNamed('/important_details');
                }),
          ],
        ),
      ),
      isDrawer: false,
      isResizeToAvoidBottomInset: false,
    );
  }
}
