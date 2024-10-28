import 'package:get/get.dart';

import '../../models/dashboard/item_model.dart';

class GridViewModel extends GetxController {
  // List of items
  var items = <ItemModel>[
    ItemModel(image: 'assets/dashboard/money.png', text: 'Salary/Pension'),
    ItemModel(image: 'assets/dashboard/house.png', text: 'House Property'),
    ItemModel(image: 'assets/dashboard/loan.png', text: 'Business/Profession'),
    ItemModel(image: 'assets/dashboard/capital.png', text: 'Capital Gain'),
    ItemModel(image: 'assets/dashboard/cooperation.png', text: 'Other Source'),
    ItemModel(image: 'assets/gain.png', text: 'Foreign Income'),
  ].obs;

  // Replacement image for selected items
  final String selectedImage = 'assets/dashboard/capital.png';

  // Toggle selection status
  void toggleSelection(int index) {
    items[index].isSelected = !items[index].isSelected;
    items.refresh(); // Notify listeners to update the UI
  }
}
