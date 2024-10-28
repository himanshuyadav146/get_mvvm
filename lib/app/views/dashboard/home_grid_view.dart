import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:getx_mvvm/app/common_widgets/common_button.dart';
import 'package:getx_mvvm/app/common_widgets/common_scafold.dart';

import '../../viewmodels/dashboard/grid_view_model.dart';

class GridSelectionScreen extends StatelessWidget {
  final GridViewModel gridViewModel = Get.put(GridViewModel());

  @override
  Widget build(BuildContext context) {
    return CommonScaffold(
      title: 'Selection',
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            Expanded(
              child: Obx(
                () => GridView.builder(
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2, // 2 cards per row
                    crossAxisSpacing: 8.0,
                    mainAxisSpacing: 8.0,
                    childAspectRatio: 3 / 4, // Aspect ratio for the cards
                  ),
                  itemCount: gridViewModel.items.length,
                  itemBuilder: (context, index) {
                    var item = gridViewModel.items[index];
                    return GestureDetector(
                      onTap: () {
                        gridViewModel.toggleSelection(index);
                      },
                      child: Card(
                        elevation: 4.0,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(12.0),
                        ),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.stretch,
                          children: [
                            ClipRRect(
                              borderRadius: const BorderRadius.vertical(
                                top: Radius.circular(12.0),
                              ),
                              child: Image.asset(
                                item.isSelected
                                    ? gridViewModel.selectedImage
                                    : item.image,
                                height: 120.0,
                                fit: BoxFit.cover,
                              ),
                            ),
                            SizedBox(height: 8.0),
                            Padding(
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 8.0),
                              child: Text(
                                item.text,
                                textAlign: TextAlign.center,
                                style: const TextStyle(
                                  fontSize: 16.0,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    );
                  },
                ),
              ),
            ),
            SizedBox(height: 16.0),
            CommonButton(
                text: 'Next',
                onPressed: () {
                  Get.toNamed('/persional_info');
                }),
          ],
        ),
      ),
      isDrawer: false,
      isResizeToAvoidBottomInset: false,
    );
  }
}
