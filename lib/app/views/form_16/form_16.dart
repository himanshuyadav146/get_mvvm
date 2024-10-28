import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../common_widgets/common_upload_card.dart';
import '../../viewmodels/form_16/upload_view_model.dart';

class UploadForm16 extends StatelessWidget {
  final UploadController uploadController = Get.put(UploadController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Upload Files'),
      ),
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
          ],
        ),
      ),
    );
  }
}
