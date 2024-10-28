import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ThemeService extends GetxService {
  final _themeMode = ThemeMode.system.obs;

  ThemeMode get themeMode => _themeMode.value;

  void switchTheme(ThemeMode mode) {
    _themeMode.value = mode;
    Get.changeThemeMode(mode);
  }

  ThemeMode getThemeModeFromStorage() {
    // Retrieve the theme mode from storage (e.g., shared_preferences) if needed
    // This is a placeholder for the actual storage logic
    return ThemeMode.system;
  }

  @override
  void onInit() {
    super.onInit();
    _themeMode.value = getThemeModeFromStorage();
    Get.changeThemeMode(_themeMode.value);
  }
}
